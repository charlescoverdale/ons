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
#> ✔ Fetching productivity (per_hour) [213ms]
#> 
#>          date value
#> 1  2020-01-01 102.2
#> 2  2020-04-01 101.1
#> 3  2020-07-01 109.1
#> 4  2020-10-01 104.1
#> 5  2021-01-01 100.7
#> 6  2021-04-01 103.4
#> 7  2021-07-01 101.9
#> 8  2021-10-01 101.6
#> 9  2022-01-01 101.8
#> 10 2022-04-01 101.2
#> 11 2022-07-01 101.3
#> 12 2022-10-01  99.8
#> 13 2023-01-01  99.7
#> 14 2023-04-01 100.6
#> 15 2023-07-01 100.1
#> 16 2023-10-01  99.9
#> 17 2024-01-01 100.0
#> 18 2024-04-01 100.7
#> 19 2024-07-01  98.3
#> 20 2024-10-01 100.9
#> 21 2025-01-01 101.9
#> 22 2025-04-01 101.9
#> 23 2025-07-01 102.4
#> 24 2025-10-01 102.5
#> 25 2026-01-01 103.4
#> 26 2026-04-01 103.6
#> 27 2026-07-01 104.9
options(op)
# }
```
