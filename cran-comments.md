# CRAN submission comments — ons 0.1.4

## Reason for this submission

This is a small maintenance update to ons 0.1.3, currently on CRAN.

`ons_search()` was the only API-calling function in the package without
rate limiting, so a loop over search terms could trip the ONS API's 429
response where the equivalent loop over any other function would not. It
now uses the same rate limiter as the rest of the package.

No API changes, no changes to returned data.

## R CMD check results

0 errors | 0 warnings | 0 notes (CRAN default settings, R 4.5.2, macOS).

## Notes on data access

Unchanged: the package calls the ONS API on demand and caches locally
using `tools::R_user_dir()`. No data is bundled. Network-using examples
are wrapped in `\donttest{}` and tests in `skip_on_cran()`, so the check
does not depend on the API being reachable.

## Downstream dependencies

None on CRAN.
