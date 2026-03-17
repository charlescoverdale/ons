#' Download labour productivity
#'
#' Downloads quarterly labour productivity data from the ONS. Available
#' as output per hour worked or output per worker.
#'
#' @param measure Character. One of `"per_hour"` (default, output per hour
#'   worked) or `"per_worker"` (output per worker). Both are seasonally
#'   adjusted indices.
#' @param from Date or character (YYYY-MM-DD). Start date. Defaults to
#'   `NULL` (all available data).
#' @param to Date or character (YYYY-MM-DD). End date. Defaults to `NULL`.
#' @param cache Logical. Use cached data if available (default `TRUE`).
#'
#' @return A data frame with columns:
#'   \describe{
#'     \item{date}{Date. First day of the quarter.}
#'     \item{value}{Numeric. Productivity index.}
#'   }
#'
#' @source
#' <https://www.ons.gov.uk>
#'
#' @examples
#' \donttest{
#' op <- options(ons.cache_dir = tempdir())
#' try(ons_productivity(from = "2020-01-01"))
#' options(op)
#' }
#'
#' @family economic indicators
#' @export
ons_productivity <- function(measure = c("per_hour", "per_worker"),
                             from    = NULL,
                             to      = NULL,
                             cache   = TRUE) {

  measure <- match.arg(measure)

  cdid <- switch(measure,
    per_hour   = "LZVB",
    per_worker = "A4YM"
  )

  topic_path   <- "/employmentandlabourmarket/peopleinwork/labourproductivity"
  dataset_code <- "prdy"

  cli::cli_progress_step("Fetching productivity ({measure})")
  out <- ons_fetch(cdid, topic_path, dataset_code,
                   from = from, to = to, cache = cache)

  cli::cli_progress_done()
  out
}
