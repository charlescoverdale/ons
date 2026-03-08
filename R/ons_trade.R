#' Download UK trade data
#'
#' Downloads UK trade in goods and services data from the ONS. Available
#' from 1948.
#'
#' @param measure Character. One of `"balance"` (default, trade balance),
#'   `"exports"` (total exports), or `"imports"` (total imports). All in
#'   GBP millions, current prices, seasonally adjusted.
#' @param from Date or character (YYYY-MM-DD). Start date. Defaults to
#'   `NULL` (all available data).
#' @param to Date or character (YYYY-MM-DD). End date. Defaults to `NULL`.
#' @param cache Logical. Use cached data if available (default `TRUE`).
#'
#' @return A data frame with columns:
#'   \describe{
#'     \item{date}{Date. First day of the month.}
#'     \item{value}{Numeric. Trade value (GBP millions).}
#'   }
#'
#' @source
#' <https://www.ons.gov.uk>
#'
#' @examples
#' \donttest{
#' ons_trade(from = "2020-01-01")
#' }
#'
#' @export
ons_trade <- function(measure = c("balance", "exports", "imports"),
                      from    = NULL,
                      to      = NULL,
                      cache   = TRUE) {

  measure <- match.arg(measure)

  cdid <- switch(measure,
    balance = "IKBJ",
    exports = "IKBH",
    imports = "IKBI"
  )

  topic_path   <- "/economy/nationalaccounts/balanceofpayments"
  dataset_code <- "mret"

  cli::cli_progress_step("Fetching trade ({measure})")
  out <- ons_fetch(cdid, topic_path, dataset_code,
                   from = from, to = to, cache = cache)

  cli::cli_progress_done()
  out
}
