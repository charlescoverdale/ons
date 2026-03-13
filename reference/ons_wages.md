# Download average weekly earnings

Downloads average weekly earnings (AWE) for the whole economy from the
ONS Labour Market Statistics. Available from 2000.

## Usage

``` r
ons_wages(
  measure = c("level", "growth", "real"),
  from = NULL,
  to = NULL,
  cache = TRUE
)
```

## Source

<https://www.ons.gov.uk>

## Arguments

- measure:

  Character. One of `"level"` (default, GBP per week), `"growth"`
  (year-on-year 3-month average percentage change), or `"real"` (real
  terms index, seasonally adjusted regular pay).

- from:

  Date or character (YYYY-MM-DD). Start date. Defaults to `NULL` (all
  available data).

- to:

  Date or character (YYYY-MM-DD). End date. Defaults to `NULL`.

- cache:

  Logical. Use cached data if available (default `TRUE`).

## Value

A data frame with columns:

- date:

  Date. First day of the month.

- value:

  Numeric. Earnings level (GBP), growth rate (percent), or real index.

## Examples

``` r
# \donttest{
ons_wages(from = "2020-01-01")
#> ℹ Fetching average weekly earnings (level)
#> Error in download_cached_ons(url, cache = cache): ONS returned HTTP status 429.
#> ✖ Fetching average weekly earnings (level) [96ms]
#> 
# }
```
