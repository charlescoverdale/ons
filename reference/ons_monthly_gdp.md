# Download monthly GDP estimate

Downloads the monthly estimate of GDP from the ONS. This is an
experimental index-based estimate, available from 1997.

## Usage

``` r
ons_monthly_gdp(from = NULL, to = NULL, cache = TRUE)
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

  Date. First day of the month.

- value:

  Numeric. Monthly GDP index (2019 = 100).

## See also

Other economic indicators:
[`ons_cpi()`](https://charlescoverdale.github.io/ons/reference/ons_cpi.md),
[`ons_gdp()`](https://charlescoverdale.github.io/ons/reference/ons_gdp.md),
[`ons_population()`](https://charlescoverdale.github.io/ons/reference/ons_population.md),
[`ons_productivity()`](https://charlescoverdale.github.io/ons/reference/ons_productivity.md)

## Examples

``` r
# \donttest{
op <- options(ons.cache_dir = tempdir())
try(ons_monthly_gdp(from = "2020-01-01"))
#> ℹ Fetching monthly GDP
#> Waiting 10s for retry backoff ■■■■                            
#> Waiting 10s for retry backoff ■■■■■■■■■■■■                    
#> Waiting 10s for retry backoff ■■■■■■■■■■■■■■■■■■■■■           
#> Waiting 10s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■  
#> Waiting 10s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 
#> ℹ Fetching monthly GDP
#> ✖ Fetching monthly GDP [10.4s]
#> 
#> Error in download_cached_ons(url, cache = cache) : 
#>   ONS returned HTTP status 429.
options(op)
# }
```
