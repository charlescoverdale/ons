# Download unemployment rate

Downloads the UK unemployment rate (aged 16 and over, seasonally
adjusted) from the ONS Labour Market Statistics. Available from 1971.

## Usage

``` r
ons_unemployment(from = NULL, to = NULL, cache = TRUE)
```

## Source

<https://www.ons.gov.uk>

## Arguments

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

  Date. First day of the period.

- value:

  Numeric. Unemployment rate (percent).

## Examples

``` r
# \donttest{
ons_unemployment(from = "2020-01-01")
#> ℹ Fetching unemployment rate
#> Error in download_cached_ons(url, cache = cache): ONS returned HTTP status 429.
#> ✖ Fetching unemployment rate [107ms]
#> 
# }
```
