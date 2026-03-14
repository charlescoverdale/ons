#' Clear the local download cache
#'
#' Removes cached data files stored by this package. By default all cached
#' files are deleted. Use `max_age_days` to remove only files older than a
#' given number of days.
#'
#' @param max_age_days Numeric. If supplied, only files older than this many
#'   days are removed. If `NULL` (the default), all cached files are removed.
#'
#' @return Invisibly returns `NULL`. Called for its side effect of deleting
#'   cached files.
#'
#' @examples
#' \donttest{
#' clear_cache()
#' }
#'
#' @family data access
#' @export
clear_cache <- function(max_age_days = NULL) {

  cache_dir <- ons_cache_dir()

  if (!dir.exists(cache_dir)) {
    cli::cli_alert_info("No cache directory found.")
    return(invisible(NULL))
  }

  files <- list.files(cache_dir, full.names = TRUE)

  if (length(files) == 0L) {
    cli::cli_alert_info("Cache directory is empty.")
    return(invisible(NULL))
  }

  if (!is.null(max_age_days)) {
    info <- file.info(files)
    age_days <- as.numeric(difftime(Sys.time(), info$mtime, units = "days"))
    files <- files[age_days > max_age_days]
  }

  if (length(files) == 0L) {
    cli::cli_alert_info("No cached files match the criteria.")
    return(invisible(NULL))
  }

  file.remove(files)
  cli::cli_alert_success("Removed {length(files)} cached file{?s}.")
  invisible(NULL)
}
