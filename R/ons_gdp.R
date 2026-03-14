#' Download GDP data
#'
#' Downloads quarterly Gross Domestic Product data from the ONS. Available
#' from 1948 (levels) or 1955 (growth rates).
#'
#' @param measure Character. One of `"growth"` (default, quarter-on-quarter
#'   percentage change), `"yoy"` (year-on-year percentage change), `"level"`
#'   (chained volume measure in GBP millions, seasonally adjusted), or
#'   `"nominal"` (current price GBP millions, seasonally adjusted).
#' @param from Date or character (YYYY-MM-DD). Start date. Defaults to
#'   `NULL` (all available data).
#' @param to Date or character (YYYY-MM-DD). End date. Defaults to `NULL`.
#' @param cache Logical. Use cached data if available (default `TRUE`).
#'
#' @return A data frame with columns:
#'   \describe{
#'     \item{date}{Date. First day of the quarter.}
#'     \item{value}{Numeric. GDP value (percent for growth measures,
#'       GBP millions for level measures).}
#'   }
#'
#' @source
#' <https://www.ons.gov.uk>
#'
#' @examples
#' \donttest{
#' ons_gdp(from = "2020-01-01")
#' }
#'
#' @family economic indicators
#' @export
ons_gdp <- function(measure = c("growth", "yoy", "level", "nominal"),
                    from    = NULL,
                    to      = NULL,
                    cache   = TRUE) {

  measure <- match.arg(measure)

  code <- switch(measure,
    growth  = "IHYQ",
    yoy     = "IHYP",
    level   = "ABMI",
    nominal = "YBHA"
  )

  topic_path   <- "/economy/grossdomesticproductgdp"
  dataset_code <- "pn2"

  cli::cli_progress_step("Fetching GDP ({measure})")
  out <- ons_fetch(code, topic_path, dataset_code,
                   from = from, to = to, cache = cache)

  cli::cli_progress_done()
  out
}
