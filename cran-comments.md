# CRAN submission comments — ons 0.1.3

## Resubmission

This is a resubmission addressing CRAN feedback (Prof Ripley, 2026-03-15).
Changes since ons 0.1.0 (currently on CRAN):

* Examples now cache to `tempdir()` instead of the user's home directory,
  fixing CRAN policy compliance for `\donttest` examples.
* Cache directory is now configurable via `options(ons.cache_dir = ...)`.
* Removed non-existent pkgdown URL from DESCRIPTION.
* Examples now wrapped in `try()` to handle transient ONS API failures
  gracefully during CRAN checks — the ONS API returned HTTP 429 during
  the 0.1.2 pretest donttest run.

## Test environments

* macOS Sequoia 15.6.1, R 4.5.2 (aarch64-apple-darwin20) — local

## R CMD check results

0 errors | 0 warnings | 0 notes

## Downstream dependencies

None — no reverse dependencies.

## Notes for CRAN reviewers

* All functions that make network requests are wrapped in `\donttest{}` with
  `try()`, so they fail gracefully if the ONS API is unavailable. Caching is
  redirected to `tempdir()` so that no files are written to the user's home
  filespace.
* Data is fetched from the Office for National Statistics website at
  `https://www.ons.gov.uk`, the ONS Search API at
  `https://api.beta.ons.gov.uk/v1/search`, and HM Land Registry at
  `https://publicdata.landregistry.gov.uk` (house prices only).
* Local caching uses `tools::R_user_dir("ons", "cache")` (base R, no
  additional dependencies).
