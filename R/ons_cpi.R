#' Download consumer price inflation
#'
#' Downloads CPI, CPIH, or RPI data from the ONS. Returns either the annual
#' rate of change or the index level.
#'
#' @param measure Character. One of `"cpi"` (default), `"cpih"`, or `"rpi"`.
#' @param type Character. One of `"rate"` (default, annual percentage change)
#'   or `"index"` (index level).
#' @param from Date or character (YYYY-MM-DD). Start date. Defaults to
#'   `NULL` (all available data).
#' @param to Date or character (YYYY-MM-DD). End date. Defaults to `NULL`.
#' @param cache Logical. Use cached data if available (default `TRUE`).
#'
#' @return A data frame with columns:
#'   \describe{
#'     \item{date}{Date. First day of the month.}
#'     \item{value}{Numeric. Inflation rate (percent) or index level.}
#'   }
#'
#' @source
#' <https://www.ons.gov.uk>
#'
#' @examples
#' \donttest{
#' ons_cpi(from = "2020-01-01")
#' }
#'
#' @family economic indicators
#' @export
ons_cpi <- function(measure = c("cpi", "cpih", "rpi"),
                    type    = c("rate", "index"),
                    from    = NULL,
                    to      = NULL,
                    cache   = TRUE) {

  measure <- match.arg(measure)
  type    <- match.arg(type)

  code <- switch(paste(measure, type, sep = "_"),
    cpi_rate   = "D7G7",
    cpi_index  = "D7BT",
    cpih_rate  = "L55O",
    cpih_index = "L522",
    rpi_rate   = "CZBH",
    rpi_index  = "CHAW"
  )

  topic_path   <- "/economy/inflationandpriceindices"
  dataset_code <- "mm23"

  label <- toupper(measure)
  cli::cli_progress_step("Fetching {label} ({type})")
  out <- ons_fetch(code, topic_path, dataset_code,
                   from = from, to = to, cache = cache)

  cli::cli_progress_done()
  out
}
