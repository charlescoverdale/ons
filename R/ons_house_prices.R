#' Download UK house prices
#'
#' Downloads UK average house prices from the HM Land Registry UK House
#' Price Index. Available from 1968. Data is jointly produced by the ONS
#' and HM Land Registry.
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
#' <https://www.gov.uk/government/statistical-data-sets/uk-house-price-index-data-downloads-november-2025>
#'
#' @examples
#' \donttest{
#' ons_house_prices(from = "2020-01-01")
#' }
#'
#' @export
ons_house_prices <- function(from  = NULL,
                             to    = NULL,
                             cache = TRUE) {

  # Use the latest Land Registry CSV — the URL includes a date but the
 # file contains the full historical series back to 1968.
  url <- paste0(
    "https://publicdata.landregistry.gov.uk/market-trend-data/",
    "house-price-index-data/Average-prices-2025-12.csv"
  )

  cli::cli_progress_step("Fetching house prices")
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
