# CRAN submission comments: ons 0.1.5

## Reason for this submission

Data-correctness fixes. `ons_gdp()` read from a dataset that lags the
quarterly national accounts; one measure returned annual rather than
quarterly data; one series moved between ONS datasets and returned an
error; and the cache never expired. Details in NEWS.md.

## R CMD check results

0 errors | 0 warnings | 0 notes (CRAN settings, R 4.5.2, macOS).

Tests that reach the ONS are skipped on CRAN, and network examples are
wrapped in `try()` inside `\donttest{}`.

## Downstream dependencies

None on CRAN.
