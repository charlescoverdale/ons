# ---- ONS CSV generator endpoint ----

ons_base_url <- function() {

"https://www.ons.gov.uk/generator"
}

# ---- Fetch a single CDID time series ----

#' @noRd
ons_fetch <- function(cdid, topic_path, dataset_code,
                      from = NULL, to = NULL, cache = TRUE) {

  cdid <- toupper(cdid)

  url <- paste0(
    ons_base_url(),
    "?format=csv",
    "&uri=", topic_path, "/timeseries/", tolower(cdid), "/", tolower(dataset_code)
  )

  raw <- download_cached_ons(url, cache = cache)
  out <- parse_ons_csv(raw, cdid = cdid)

  # Apply date filters
  if (!is.null(from)) {
    from <- as.Date(from)
    out <- out[out$date >= from, , drop = FALSE]
  }
  if (!is.null(to)) {
    to <- as.Date(to)
    out <- out[out$date <= to, , drop = FALSE]
  }

  rownames(out) <- NULL
  out
}

# ---- Fetch via Search API (for ons_get) ----

#' @noRd
ons_search_cdid <- function(cdid) {

  cdid <- toupper(cdid)

  url <- paste0(
    "https://api.beta.ons.gov.uk/v1/search",
    "?content_type=timeseries",
    "&cdids=", cdid,
    "&limit=1"
  )

  req <- httr2::request(url)
  req <- httr2::req_user_agent(req, "ons R package (https://github.com/charlescoverdale/ons)")
  req <- httr2::req_throttle(req, rate = 5 / 10)
  req <- httr2::req_retry(req, max_tries = 6L, backoff = ~ 8,
                          is_transient = function(resp) {
                            httr2::resp_status(resp) == 429L
                          })
  req <- httr2::req_error(req, is_error = function(resp) FALSE)
  resp <- tryCatch(
    httr2::req_perform(req),
    error = function(e) {
      cli::cli_abort(
        "Failed to connect to ONS Search API: {conditionMessage(e)}",
        parent = e
      )
    }
  )

  if (httr2::resp_status(resp) != 200L) {
    cli::cli_abort("Search API returned status {httr2::resp_status(resp)}.")
  }

  body <- httr2::resp_body_json(resp)

  if (length(body$items) == 0L) {
    cli::cli_abort("No series found for CDID {.val {cdid}}.")
  }

  item <- body$items[[1L]]
  uri <- item$uri

  if (is.null(uri) || !nzchar(uri)) {
    cli::cli_abort("Search API returned no URI for CDID {.val {cdid}}.")
  }

  uri
}

# ---- Parse ONS CSV ----

#' @noRd
parse_ons_csv <- function(raw, cdid = NULL) {

  lines <- strsplit(raw, "\r?\n")[[1L]]

  # Detect HTML error pages
  if (length(lines) > 0L && grepl("<!DOCTYPE|<html", lines[1L], ignore.case = TRUE)) {
    label <- if (!is.null(cdid)) cdid else "unknown"
    cli::cli_abort(
      "ONS returned an HTML page instead of CSV for {.val {label}}. The series may not exist."
    )
  }

  # Find the data start — skip metadata header rows
  # Metadata rows: Title, CDID, Source dataset ID, Unit, Release date, blank line
  # Data rows have period strings like "1955 Q2", "2024 JAN", "1960"
  data_start <- NULL
  for (i in seq_along(lines)) {
    line <- trimws(lines[i])
    if (nzchar(line) && grepl("^\"?\\d{4}", line)) {
      data_start <- i
      break
    }
  }

  if (is.null(data_start)) {
    label <- if (!is.null(cdid)) cdid else "unknown"
    cli::cli_abort("Could not find data rows in CSV for {.val {label}}.")
  }

  data_lines <- lines[data_start:length(lines)]
  data_lines <- data_lines[nzchar(trimws(data_lines))]

  if (length(data_lines) == 0L) {
    label <- if (!is.null(cdid)) cdid else "unknown"
    cli::cli_abort("No data rows found in CSV for {.val {label}}.")
  }

  # Parse CSV data
  tc <- textConnection(paste(data_lines, collapse = "\n"))
  on.exit(close(tc))
  df <- utils::read.csv(tc, header = FALSE, stringsAsFactors = FALSE,
                        col.names = c("period", "value"))

  # Clean period strings
  df$period <- gsub('^"|"$', "", trimws(df$period))
  df$value <- suppressWarnings(as.numeric(gsub('^"|"$', "", trimws(df$value))))

  # Remove rows where value is NA (e.g. notes, blank rows)
  df <- df[!is.na(df$value), , drop = FALSE]

  # Classify each row by frequency
  df$freq <- classify_ons_period(df$period)
  df <- df[df$freq != "unknown", , drop = FALSE]

  # Keep only the most granular frequency
  # ONS CSVs contain annual + quarterly + monthly in one file
  if ("monthly" %in% df$freq) {
    df <- df[df$freq == "monthly", , drop = FALSE]
  } else if ("quarterly" %in% df$freq) {
    df <- df[df$freq == "quarterly", , drop = FALSE]
  }
  # else keep annual

  # Parse periods to dates
  df$date <- parse_ons_period(df$period)
  df <- df[!is.na(df$date), , drop = FALSE]

  data.frame(
    date  = df$date,
    value = df$value,
    stringsAsFactors = FALSE
  )
}

# ---- Classify ONS period strings by frequency ----

#' @noRd
classify_ons_period <- function(period) {
  vapply(period, function(p) {
    p <- trimws(p)
    if (grepl("^\\d{4}\\s+[A-Z]{3}$", p)) return("monthly")
    if (grepl("^\\d{4}\\s+Q[1-4]$", p)) return("quarterly")
    if (grepl("^\\d{4}$", p)) return("annual")
    "unknown"
  }, character(1L), USE.NAMES = FALSE)
}

# ---- Parse ONS period strings to Date ----

#' @noRd
parse_ons_period <- function(period) {

  month_map <- c(
    JAN = 1L, FEB = 2L, MAR = 3L, APR = 4L, MAY = 5L, JUN = 6L,
    JUL = 7L, AUG = 8L, SEP = 9L, OCT = 10L, NOV = 11L, DEC = 12L
  )

  quarter_map <- c(Q1 = 1L, Q2 = 4L, Q3 = 7L, Q4 = 10L)

  dates <- rep(as.Date(NA), length(period))

  for (i in seq_along(period)) {
    p <- trimws(period[i])

    # Monthly: "2024 JAN"
    m <- regmatches(p, regexec("^(\\d{4})\\s+([A-Z]{3})$", p))[[1L]]
    if (length(m) == 3L) {
      mon <- month_map[m[3L]]
      if (!is.na(mon)) {
        dates[i] <- as.Date(sprintf("%s-%02d-01", m[2L], mon))
      }
      next
    }

    # Quarterly: "1955 Q2"
    q <- regmatches(p, regexec("^(\\d{4})\\s+(Q[1-4])$", p))[[1L]]
    if (length(q) == 3L) {
      mon <- quarter_map[q[3L]]
      dates[i] <- as.Date(sprintf("%s-%02d-01", q[2L], mon))
      next
    }

    # Annual: "1960"
    a <- regmatches(p, regexec("^(\\d{4})$", p))[[1L]]
    if (length(a) == 2L) {
      dates[i] <- as.Date(sprintf("%s-01-01", a[2L]))
      next
    }
  }

  dates
}

# ---- Date argument parsing ----

#' @noRd
parse_date_arg <- function(x, arg_name = "date") {
  if (inherits(x, "Date")) return(x)
  d <- tryCatch(as.Date(x), error = function(e) NA)
  if (is.na(d)) {
    cli::cli_abort("{.arg {arg_name}} must be a Date or character in YYYY-MM-DD format.")
  }
  d
}

# ---- Caching ----

#' @noRd
ons_cache_dir <- function() {
  tools::R_user_dir("ons", "cache")
}

#' @noRd
digest_url_ons <- function(url) {
  chars <- utf8ToInt(url)
  hash <- 5381
  for (ch in chars) {
    hash <- ((hash * 33) + ch) %% 2147483647
  }
  sprintf("ons_%010.0f_%d.rds", hash, nchar(url))
}

#' @noRd
download_cached_ons <- function(url, cache = TRUE) {

  cache_dir <- ons_cache_dir()
  cache_file <- file.path(cache_dir, digest_url_ons(url))

  if (isTRUE(cache) && file.exists(cache_file)) {
    return(readRDS(cache_file))
  }

  req <- httr2::request(url)
  req <- httr2::req_user_agent(req, "ons R package (https://github.com/charlescoverdale/ons)")
  req <- httr2::req_throttle(req, rate = 5 / 10)
  req <- httr2::req_retry(req, max_tries = 6L, backoff = ~ 8,
                          is_transient = function(resp) {
                            httr2::resp_status(resp) == 429L
                          })
  req <- httr2::req_error(req, is_error = function(resp) FALSE)
  resp <- tryCatch(
    httr2::req_perform(req),
    error = function(e) {
      cli::cli_abort(
        "Failed to connect to ONS: {conditionMessage(e)}",
        parent = e
      )
    }
  )

  if (httr2::resp_status(resp) != 200L) {
    cli::cli_abort("ONS returned HTTP status {httr2::resp_status(resp)}.")
  }

  raw <- httr2::resp_body_string(resp)

  if (isTRUE(cache)) {
    dir.create(cache_dir, recursive = TRUE, showWarnings = FALSE)
    saveRDS(raw, cache_file)
  }

  raw
}
