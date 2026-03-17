#' Download average weekly earnings
#'
#' Downloads average weekly earnings (AWE) for the whole economy from the
#' ONS Labour Market Statistics. Available from 2000.
#'
#' @param measure Character. One of `"level"` (default, GBP per week),
#'   `"growth"` (year-on-year 3-month average percentage change), or
#'   `"real"` (real terms index, seasonally adjusted regular pay).
#' @param from Date or character (YYYY-MM-DD). Start date. Defaults to
#'   `NULL` (all available data).
#' @param to Date or character (YYYY-MM-DD). End date. Defaults to `NULL`.
#' @param cache Logical. Use cached data if available (default `TRUE`).
#'
#' @return A data frame with columns:
#'   \describe{
#'     \item{date}{Date. First day of the month.}
#'     \item{value}{Numeric. Earnings level (GBP), growth rate (percent),
#'       or real index.}
#'   }
#'
#' @source
#' <https://www.ons.gov.uk>
#'
#' @examples
#' \donttest{
#' op <- options(ons.cache_dir = tempdir())
#' try(ons_wages(from = "2020-01-01"))
#' options(op)
#' }
#'
#' @family labour market
#' @export
ons_wages <- function(measure = c("level", "growth", "real"),
                      from    = NULL,
                      to      = NULL,
                      cache   = TRUE) {

  measure <- match.arg(measure)

  cdid <- switch(measure,
    level  = "KAB9",
    growth = "KAC3",
    real   = "A2F8"
  )

  topic_path   <- "/employmentandlabourmarket/peopleinwork/earningsandworkinghours"
  dataset_code <- "lms"

  cli::cli_progress_step("Fetching average weekly earnings ({measure})")
  out <- ons_fetch(cdid, topic_path, dataset_code,
                   from = from, to = to, cache = cache)

  cli::cli_progress_done()
  out
}
