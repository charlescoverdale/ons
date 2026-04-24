# Download GDP data

Downloads quarterly Gross Domestic Product data from the ONS. Available
from 1948 (levels) or 1955 (growth rates).

## Usage

``` r
ons_gdp(
  measure = c("growth", "yoy", "level", "nominal"),
  from = NULL,
  to = NULL,
  cache = TRUE
)
```

## Source

<https://www.ons.gov.uk>

## Arguments

- measure:

  Character. One of `"growth"` (default, quarter-on-quarter percentage
  change), `"yoy"` (year-on-year percentage change), `"level"` (chained
  volume measure in GBP millions, seasonally adjusted), or `"nominal"`
  (current price GBP millions, seasonally adjusted).

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

  Numeric. GDP value (percent for growth measures, GBP millions for
  level measures).

## See also

Other economic indicators:
[`ons_cpi()`](https://charlescoverdale.github.io/ons/reference/ons_cpi.md),
[`ons_monthly_gdp()`](https://charlescoverdale.github.io/ons/reference/ons_monthly_gdp.md),
[`ons_population()`](https://charlescoverdale.github.io/ons/reference/ons_population.md),
[`ons_productivity()`](https://charlescoverdale.github.io/ons/reference/ons_productivity.md)

## Examples

``` r
# \donttest{
op <- options(ons.cache_dir = tempdir())
try(ons_gdp(from = "2020-01-01"))
#> ℹ Fetching GDP (growth)
#> ✔ Fetching GDP (growth) [168ms]
#> 
#>          date value
#> 1  2020-01-01  -2.7
#> 2  2020-04-01 -19.9
#> 3  2020-07-01  17.0
#> 4  2020-10-01   1.4
#> 5  2021-01-01  -1.1
#> 6  2021-04-01   7.0
#> 7  2021-07-01   1.7
#> 8  2021-10-01   1.4
#> 9  2022-01-01   1.0
#> 10 2022-04-01   0.6
#> 11 2022-07-01   0.1
#> 12 2022-10-01   0.3
#> 13 2023-01-01   0.1
#> 14 2023-04-01   0.0
#> 15 2023-07-01  -0.2
#> 16 2023-10-01  -0.3
#> 17 2024-01-01   0.8
#> 18 2024-04-01   0.6
#> 19 2024-07-01   0.2
#> 20 2024-10-01   0.3
#> 21 2025-01-01   0.7
#> 22 2025-04-01   0.2
#> 23 2025-07-01   0.1
#> 24 2025-10-01   0.1
options(op)
# }
```
