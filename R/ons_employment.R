#' Download employment rate
#'
#' Downloads the UK employment rate (aged 16 to 64, seasonally adjusted)
#' from the ONS Labour Market Statistics. Available from 1971.
#'
#' @param group Character. One of `"total"` (default), `"male"`, or
#'   `"female"`.
#' @param from Date or character (YYYY-MM-DD). Start date. Defaults to
#'   `NULL` (all available data).
#' @param to Date or character (YYYY-MM-DD). End date. Defaults to `NULL`.
#' @param cache Logical. Use cached data if available (default `TRUE`).
#'
#' @return A data frame with columns:
#'   \describe{
#'     \item{date}{Date. First day of the period.}
#'     \item{value}{Numeric. Employment rate (percent).}
#'   }
#'
#' @source
#' <https://www.ons.gov.uk>
#'
#' @examples
#' \donttest{
#' op <- options(ons.cache_dir = tempdir())
#' ons_employment(from = "2020-01-01")
#' options(op)
#' }
#'
#' @family labour market
#' @export
ons_employment <- function(group = c("total", "male", "female"),
                           from  = NULL,
                           to    = NULL,
                           cache = TRUE) {

  group <- match.arg(group)

  cdid <- switch(group,
    total  = "LF24",
    male   = "MGSV",
    female = "LF25"
  )

  topic_path   <- "/employmentandlabourmarket/peopleinwork/employmentandemployeetypes"
  dataset_code <- "lms"

  cli::cli_progress_step("Fetching employment rate ({group})")
  out <- ons_fetch(cdid, topic_path, dataset_code,
                   from = from, to = to, cache = cache)

  cli::cli_progress_done()
  out
}
