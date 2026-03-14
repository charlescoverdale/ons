#' Search for ONS time series
#'
#' Searches the ONS catalogue for time series matching a keyword or phrase.
#' Returns CDID codes, titles, and dataset information that can be used with
#' [ons_get()].
#'
#' @param query Character. Search term (e.g. `"GDP growth"`, `"unemployment"`).
#' @param limit Integer. Maximum number of results to return (default 10,
#'   maximum 50).
#'
#' @return A data frame with columns:
#'   \describe{
#'     \item{cdid}{Character. The four-character CDID code.}
#'     \item{dataset_id}{Character. The ONS dataset identifier.}
#'     \item{title}{Character. Description of the series.}
#'     \item{release_date}{Character. Date of the most recent release.}
#'   }
#'
#' @source
#' <https://www.ons.gov.uk>
#'
#' @examples
#' \donttest{
#' ons_search("GDP growth")
#' }
#'
#' @family data access
#' @export
ons_search <- function(query, limit = 10L) {

  if (!is.character(query) || length(query) != 1L || !nzchar(query)) {
    cli::cli_abort("{.arg query} must be a non-empty string.")
  }

  limit <- min(as.integer(limit), 50L)

  url <- paste0(
    "https://api.beta.ons.gov.uk/v1/search",
    "?content_type=timeseries",
    "&q=", utils::URLencode(query, reserved = TRUE),
    "&limit=", limit
  )

  req <- httr2::request(url)
  req <- httr2::req_user_agent(req, "ons R package (https://github.com/charlescoverdale/ons)")
  req <- httr2::req_error(req, is_error = function(resp) FALSE)
  resp <- httr2::req_perform(req)

  if (httr2::resp_status(resp) != 200L) {
    cli::cli_abort("ONS Search API returned HTTP status {httr2::resp_status(resp)}.")
  }

  body <- httr2::resp_body_json(resp)
  items <- body$items

  if (length(items) == 0L) {
    cli::cli_alert_info("No results found for {.val {query}}.")
    return(data.frame(
      cdid         = character(0L),
      dataset_id   = character(0L),
      title        = character(0L),
      release_date = character(0L),
      stringsAsFactors = FALSE
    ))
  }

  data.frame(
    cdid         = vapply(items, function(x) x$cdid %||% NA_character_, character(1L)),
    dataset_id   = vapply(items, function(x) x$dataset_id %||% NA_character_, character(1L)),
    title        = vapply(items, function(x) x$title %||% NA_character_, character(1L)),
    release_date = vapply(items, function(x) x$release_date %||% NA_character_, character(1L)),
    stringsAsFactors = FALSE
  )
}

# Null-coalescing operator (not exported)
`%||%` <- function(x, y) if (is.null(x)) y else x
