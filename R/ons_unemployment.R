#' Download unemployment rate
#'
#' Downloads the UK unemployment rate (aged 16 and over, seasonally adjusted)
#' from the ONS Labour Market Statistics. Available from 1971.
#'
#' @param from Date or character (YYYY-MM-DD). Start date. Defaults to
#'   `NULL` (all available data).
#' @param to Date or character (YYYY-MM-DD). End date. Defaults to `NULL`.
#' @param cache Logical. Use cached data if available (default `TRUE`).
#'
#' @return A data frame with columns:
#'   \describe{
#'     \item{date}{Date. First day of the period.}
#'     \item{value}{Numeric. Unemployment rate (percent).}
#'   }
#'
#' @source
#' <https://www.ons.gov.uk>
#'
#' @examples
#' \donttest{
#' ons_unemployment(from = "2020-01-01")
#' }
#'
#' @export
ons_unemployment <- function(from  = NULL,
                             to    = NULL,
                             cache = TRUE) {

  topic_path   <- "/employmentandlabourmarket/peoplenotinwork/unemployment"
  dataset_code <- "lms"
  cdid         <- "MGSX"

  cli::cli_progress_step("Fetching unemployment rate")
  out <- ons_fetch(cdid, topic_path, dataset_code,
                   from = from, to = to, cache = cache)

  cli::cli_progress_done()
  out
}
