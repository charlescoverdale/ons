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

## See also

Other labour market:
[`ons_employment()`](https://charlescoverdale.github.io/ons/reference/ons_employment.md),
[`ons_inactivity()`](https://charlescoverdale.github.io/ons/reference/ons_inactivity.md),
[`ons_wages()`](https://charlescoverdale.github.io/ons/reference/ons_wages.md)

## Examples

``` r
# \donttest{
op <- options(ons.cache_dir = tempdir())
try(ons_unemployment(from = "2020-01-01"))
#> ℹ Fetching unemployment rate
#> Waiting 10s for retry backoff ■■■■                            
#> Waiting 10s for retry backoff ■■■■■■■■■■■                     
#> Waiting 10s for retry backoff ■■■■■■■■■■■■■■■■■■■■            
#> Waiting 10s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■   
#> Waiting 10s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 
#> ℹ Fetching unemployment rate
#> ✖ Fetching unemployment rate [10.3s]
#> 
#> Error in download_cached_ons(url, cache = cache) : 
#>   ONS returned HTTP status 429.
options(op)
# }
```
