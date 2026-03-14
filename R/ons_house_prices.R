#' Download UK house prices
#'
#' Downloads UK average house prices from the HM Land Registry UK House
#' Price Index. Available from 1968. Data is jointly produced by the ONS
#' and HM Land Registry.
#'
#' The function automatically finds the latest available monthly file from
#' HM Land Registry, working backwards from the current month.
#'
#' @param from Date or character (YYYY-MM-DD). Start date. Defaults to
#'   `NULL` (all available data).
#' @param to Date or character (YYYY-MM-DD). End date. Defaults to `NULL`.
#' @param cache Logical. Use cached data if available (default `TRUE`).
#'
#' @return A data frame with columns:
#'   \describe{
#'     \item{date}{Date. First day of the month.}
#'     \item{average_price_gbp}{Numeric. Average house price (GBP).}
#'     \item{annual_change_pct}{Numeric. Annual percentage change.}
#'   }
#'
#' @source
#' <https://www.gov.uk/government/collections/uk-house-price-index-reports>
#'
#' @examples
#' \donttest{
#' ons_house_prices(from = "2020-01-01")
#' }
#'
#' @family trade and prices
#' @export
ons_house_prices <- function(from  = NULL,
                             to    = NULL,
                             cache = TRUE) {

  cli::cli_progress_step("Fetching house prices")

  url <- find_latest_hpi_url(cache = cache)
  raw <- download_cached_ons(url, cache = cache)

  tc <- textConnection(raw)
  on.exit(close(tc))
  df <- utils::read.csv(tc, stringsAsFactors = FALSE)

  # Filter to UK level only
  df <- df[df$Region_Name == "United Kingdom", , drop = FALSE]

  df$date <- as.Date(paste0(df$Date, "-01"), format = "%Y-%m-%d")

  # Apply date filters
  if (!is.null(from)) {
    from <- as.Date(from)
    df <- df[df$date >= from, , drop = FALSE]
  }
  if (!is.null(to)) {
    to <- as.Date(to)
    df <- df[df$date <= to, , drop = FALSE]
  }

  result <- data.frame(
    date              = df$date,
    average_price_gbp = as.numeric(df$Average_Price),
    annual_change_pct = as.numeric(df$Annual_Change),
    stringsAsFactors  = FALSE
  )

  rownames(result) <- NULL
  cli::cli_progress_done()
  result
}


#' Find the latest available HPI CSV URL
#'
#' Tries the current month, then works backwards up to 6 months until a
#' file is found. The Land Registry typically publishes 2 months behind.
#'
#' @noRd
find_latest_hpi_url <- function(cache = TRUE) {

  base_url <- paste0(
    "https://publicdata.landregistry.gov.uk/market-trend-data/",
    "house-price-index-data/Average-prices-"
  )

  find_hpi_url_by_probe(base_url)
}


#' Probe for the latest HPI file by trying recent months
#'
#' @noRd
find_hpi_url_by_probe <- function(base_url) {

  today <- Sys.Date()

  # Try current month, then go back up to 6 months
  for (offset in 0:6) {
    probe_date <- seq.Date(today, by = "-1 month", length.out = offset + 1L)
    probe_date <- probe_date[length(probe_date)]
    suffix <- format(probe_date, "%Y-%m")
    url <- paste0(base_url, suffix, ".csv")

    req <- httr2::request(url)
    req <- httr2::req_method(req, "HEAD")
    req <- httr2::req_user_agent(req, "ons R package (https://github.com/charlescoverdale/ons)")
    req <- httr2::req_error(req, is_error = function(resp) FALSE)
    resp <- tryCatch(httr2::req_perform(req), error = function(e) NULL)

    if (!is.null(resp) && httr2::resp_status(resp) == 200L) {
      return(url)
    }
  }

  cli::cli_abort(
    "Could not find a recent HPI file from HM Land Registry. Tried the last 7 months."
  )
}
