#' Download public sector finances
#'
#' Downloads public sector net borrowing (excluding public sector banks)
#' from the ONS. Available from 1993.
#'
#' @param from Date or character (YYYY-MM-DD). Start date. Defaults to
#'   `NULL` (all available data).
#' @param to Date or character (YYYY-MM-DD). End date. Defaults to `NULL`.
#' @param cache Logical. Use cached data if available (default `TRUE`).
#'
#' @return A data frame with columns:
#'   \describe{
#'     \item{date}{Date. First day of the month.}
#'     \item{value}{Numeric. Public sector net borrowing (GBP millions).}
#'   }
#'
#' @source
#' <https://www.ons.gov.uk>
#'
#' @examples
#' \donttest{
#' op <- options(ons.cache_dir = tempdir())
#' ons_public_finances(from = "2020-01-01")
#' options(op)
#' }
#'
#' @family public finances
#' @export
ons_public_finances <- function(from  = NULL,
                                to    = NULL,
                                cache = TRUE) {

  topic_path   <- "/economy/governmentpublicsectorandtaxes/publicsectorfinance"
  dataset_code <- "pusf"
  cdid         <- "DZLS"

  cli::cli_progress_step("Fetching public sector net borrowing")
  out <- ons_fetch(cdid, topic_path, dataset_code,
                   from = from, to = to, cache = cache)

  cli::cli_progress_done()
  out
}
