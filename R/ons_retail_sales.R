#' Download retail sales index
#'
#' Downloads the Retail Sales Index from the ONS. Returns volume (quantity)
#' or value (amount spent) indices.
#'
#' @param type Character. One of `"volume"` (default, quantity bought,
#'   seasonally adjusted) or `"value"` (amount spent, not seasonally
#'   adjusted).
#' @param from Date or character (YYYY-MM-DD). Start date. Defaults to
#'   `NULL` (all available data).
#' @param to Date or character (YYYY-MM-DD). End date. Defaults to `NULL`.
#' @param cache Logical. Use cached data if available (default `TRUE`).
#'
#' @return A data frame with columns:
#'   \describe{
#'     \item{date}{Date. First day of the month.}
#'     \item{value}{Numeric. Retail sales index.}
#'   }
#'
#' @source
#' <https://www.ons.gov.uk>
#'
#' @examples
#' \donttest{
#' ons_retail_sales(from = "2020-01-01")
#' }
#'
#' @family trade and prices
#' @export
ons_retail_sales <- function(type  = c("volume", "value"),
                             from  = NULL,
                             to    = NULL,
                             cache = TRUE) {

  type <- match.arg(type)

  cdid <- switch(type,
    volume = "J5EK",
    value  = "J43S"
  )

  topic_path   <- "/businessindustryandtrade/retailindustry"
  dataset_code <- "drsi"

  cli::cli_progress_step("Fetching retail sales ({type})")
  out <- ons_fetch(cdid, topic_path, dataset_code,
                   from = from, to = to, cache = cache)

  cli::cli_progress_done()
  out
}
