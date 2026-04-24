# Download labour productivity

Downloads quarterly labour productivity data from the ONS. Available as
output per hour worked or output per worker.

## Usage

``` r
ons_productivity(
  measure = c("per_hour", "per_worker"),
  from = NULL,
  to = NULL,
  cache = TRUE
)
```

## Source

<https://www.ons.gov.uk>

## Arguments

- measure:

  Character. One of `"per_hour"` (default, output per hour worked) or
  `"per_worker"` (output per worker). Both are seasonally adjusted
  indices.

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

  Date. First day of the quarter.

- value:

  Numeric. Productivity index.

## See also

Other economic indicators:
[`ons_cpi()`](https://charlescoverdale.github.io/ons/reference/ons_cpi.md),
[`ons_gdp()`](https://charlescoverdale.github.io/ons/reference/ons_gdp.md),
[`ons_monthly_gdp()`](https://charlescoverdale.github.io/ons/reference/ons_monthly_gdp.md),
[`ons_population()`](https://charlescoverdale.github.io/ons/reference/ons_population.md)

## Examples

``` r
# \donttest{
op <- options(ons.cache_dir = tempdir())
try(ons_productivity(from = "2020-01-01"))
#> ℹ Fetching productivity (per_hour)
#> ✖ Fetching productivity (per_hour) [111ms]
#> 
#> Error in download_cached_ons(url, cache = cache) : 
#>   ONS returned HTTP status 429.
options(op)
# }
```
