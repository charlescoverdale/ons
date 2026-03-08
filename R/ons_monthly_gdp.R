#' Download monthly GDP estimate
#'
#' Downloads the monthly estimate of GDP from the ONS. This is an
#' experimental index-based estimate, available from 1997.
#'
#' @param from Date or character (YYYY-MM-DD). Start date. Defaults to
#'   `NULL` (all available data).
#' @param to Date or character (YYYY-MM-DD). End date. Defaults to `NULL`.
#' @param cache Logical. Use cached data if available (default `TRUE`).
#'
#' @return A data frame with columns:
#'   \describe{
#'     \item{date}{Date. First day of the month.}
#'     \item{value}{Numeric. Monthly GDP index (2019 = 100).}
#'   }
#'
#' @source
#' <https://www.ons.gov.uk>
#'
#' @examples
#' \donttest{
#' ons_monthly_gdp(from = "2020-01-01")
#' }
#'
#' @export
ons_monthly_gdp <- function(from  = NULL,
                            to    = NULL,
                            cache = TRUE) {

  # ECY2 is the monthly GDP index (CVM SA, 2019=100)
  topic_path   <- "/economy/grossdomesticproductgdp"
  dataset_code <- "mgdp"
  cdid         <- "ECY2"

  cli::cli_progress_step("Fetching monthly GDP")
  out <- ons_fetch(cdid, topic_path, dataset_code,
                   from = from, to = to, cache = cache)

  cli::cli_progress_done()
  out
}
