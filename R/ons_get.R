#' Download any ONS time series by CDID code
#'
#' Fetches a time series from the ONS website using its CDID (four-character
#' series identifier). The function uses the ONS Search API to discover the
#' download path, then retrieves the CSV.
#'
#' CDID codes can be found by browsing the ONS time series explorer at
#' \url{https://www.ons.gov.uk/timeseriestool} or by using [ons_search()].
#'
#' @param cdid Character vector. One or more ONS CDID codes (e.g. `"IHYQ"`
#'   for quarterly GDP growth). Maximum 50 codes per call.
#' @param from Date or character (YYYY-MM-DD). Start date filter. Defaults to
#'   `NULL` (all available data).
#' @param to Date or character (YYYY-MM-DD). End date filter. Defaults to
#'   `NULL` (up to the latest observation).
#' @param cache Logical. Use cached data if available (default `TRUE`).
#'
#' @return A data frame with columns:
#'   \describe{
#'     \item{date}{Date. Observation date (first day of the period).}
#'     \item{cdid}{Character. The CDID code.}
#'     \item{value}{Numeric. Observation value.}
#'   }
#'
#' @source
#' <https://www.ons.gov.uk>
#'
#' @examples
#' \donttest{
#' op <- options(ons.cache_dir = tempdir())
#' try(ons_get("IHYQ", from = "2020-01-01"))
#' options(op)
#' }
#'
#' @family data access
#' @export
ons_get <- function(cdid,
                    from  = NULL,
                    to    = NULL,
                    cache = TRUE) {

  if (!is.character(cdid) || length(cdid) == 0L) {
    cli::cli_abort("{.arg cdid} must be a character vector of ONS CDID codes.")
  }

  if (length(cdid) > 50L) {
    cli::cli_abort("Maximum 50 CDID codes per call.")
  }

  if (!is.null(from)) from <- parse_date_arg(from, "from")
  if (!is.null(to))   to   <- parse_date_arg(to, "to")

  frames <- vector("list", length(cdid))

  for (i in seq_along(cdid)) {
    code <- toupper(cdid[i])
    cli::cli_progress_step("Fetching {.val {code}}")

    # Use Search API to discover the URI
    uri <- ons_search_cdid(code)

    # Build generator URL
    url <- paste0(ons_base_url(), "?format=csv&uri=", uri)
    raw <- download_cached_ons(url, cache = cache)
    out <- parse_ons_csv(raw, cdid = code)

    out$cdid <- code
    frames[[i]] <- out
  }

  result <- do.call(rbind, frames)

  # Apply date filters
  if (!is.null(from)) {
    result <- result[result$date >= from, , drop = FALSE]
  }
  if (!is.null(to)) {
    result <- result[result$date <= to, , drop = FALSE]
  }

  result <- data.frame(
    date  = result$date,
    cdid  = result$cdid,
    value = result$value,
    stringsAsFactors = FALSE
  )

  rownames(result) <- NULL
  cli::cli_progress_done()
  result
}
