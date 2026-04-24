# Download population estimates

Downloads mid-year population estimates for the United Kingdom from the
ONS. Returns annual estimates.

## Usage

``` r
ons_population(from = NULL, to = NULL, cache = TRUE)
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

  Date. Mid-year date (represented as 1 January).

- value:

  Numeric. Population estimate (thousands).

## See also

Other economic indicators:
[`ons_cpi()`](https://charlescoverdale.github.io/ons/reference/ons_cpi.md),
[`ons_gdp()`](https://charlescoverdale.github.io/ons/reference/ons_gdp.md),
[`ons_monthly_gdp()`](https://charlescoverdale.github.io/ons/reference/ons_monthly_gdp.md),
[`ons_productivity()`](https://charlescoverdale.github.io/ons/reference/ons_productivity.md)

## Examples

``` r
# \donttest{
op <- options(ons.cache_dir = tempdir())
try(ons_population(from = "2000-01-01"))
#> ℹ Fetching population estimates
#> ✖ Fetching population estimates [101ms]
#> 
#> Error in download_cached_ons(url, cache = cache) : 
#>   ONS returned HTTP status 429.
options(op)
# }
```
