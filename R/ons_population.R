#' Download population estimates
#'
#' Downloads mid-year population estimates for the United Kingdom from the
#' ONS. Returns annual estimates.
#'
#' @param from Date or character (YYYY-MM-DD). Start date. Defaults to
#'   `NULL` (all available data).
#' @param to Date or character (YYYY-MM-DD). End date. Defaults to `NULL`.
#' @param cache Logical. Use cached data if available (default `TRUE`).
#'
#' @return A data frame with columns:
#'   \describe{
#'     \item{date}{Date. Mid-year date (represented as 1 January).}
#'     \item{value}{Numeric. Population estimate (thousands).}
#'   }
#'
#' @source
#' <https://www.ons.gov.uk>
#'
#' @examples
#' \donttest{
#' ons_population(from = "2000-01-01")
#' }
#'
#' @export
ons_population <- function(from  = NULL,
                           to    = NULL,
                           cache = TRUE) {

  topic_path   <- "/peoplepopulationandcommunity/populationandmigration/populationestimates"
  dataset_code <- "pop"
  cdid         <- "UKPOP"

  cli::cli_progress_step("Fetching population estimates")
  out <- ons_fetch(cdid, topic_path, dataset_code,
                   from = from, to = to, cache = cache)

  cli::cli_progress_done()
  out
}
