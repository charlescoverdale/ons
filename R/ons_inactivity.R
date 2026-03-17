#' Download economic inactivity
#'
#' Downloads the number of economically inactive people (aged 16 to 64,
#' seasonally adjusted) from the ONS Labour Market Statistics. Available
#' from 1971.
#'
#' @param from Date or character (YYYY-MM-DD). Start date. Defaults to
#'   `NULL` (all available data).
#' @param to Date or character (YYYY-MM-DD). End date. Defaults to `NULL`.
#' @param cache Logical. Use cached data if available (default `TRUE`).
#'
#' @return A data frame with columns:
#'   \describe{
#'     \item{date}{Date. First day of the period.}
#'     \item{value}{Numeric. Economically inactive people (thousands).}
#'   }
#'
#' @source
#' <https://www.ons.gov.uk>
#'
#' @examples
#' \donttest{
#' op <- options(ons.cache_dir = tempdir())
#' try(ons_inactivity(from = "2020-01-01"))
#' options(op)
#' }
#'
#' @family labour market
#' @export
ons_inactivity <- function(from  = NULL,
                           to    = NULL,
                           cache = TRUE) {

  topic_path   <- "/employmentandlabourmarket/peoplenotinwork/economicinactivity"
  dataset_code <- "lms"
  cdid         <- "LF2M"

  cli::cli_progress_step("Fetching economic inactivity")
  out <- ons_fetch(cdid, topic_path, dataset_code,
                   from = from, to = to, cache = cache)

  cli::cli_progress_done()
  out
}
