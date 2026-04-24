# Download consumer price inflation

Downloads CPI, CPIH, or RPI data from the ONS. Returns either the annual
rate of change or the index level.

## Usage

``` r
ons_cpi(
  measure = c("cpi", "cpih", "rpi"),
  type = c("rate", "index"),
  from = NULL,
  to = NULL,
  cache = TRUE
)
```

## Source

<https://www.ons.gov.uk>

## Arguments

- measure:

  Character. One of `"cpi"` (default), `"cpih"`, or `"rpi"`.

- type:

  Character. One of `"rate"` (default, annual percentage change) or
  `"index"` (index level).

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

  Numeric. Inflation rate (percent) or index level.

## See also

Other economic indicators:
[`ons_gdp()`](https://charlescoverdale.github.io/ons/reference/ons_gdp.md),
[`ons_monthly_gdp()`](https://charlescoverdale.github.io/ons/reference/ons_monthly_gdp.md),
[`ons_population()`](https://charlescoverdale.github.io/ons/reference/ons_population.md),
[`ons_productivity()`](https://charlescoverdale.github.io/ons/reference/ons_productivity.md)

## Examples

``` r
# \donttest{
op <- options(ons.cache_dir = tempdir())
try(ons_cpi(from = "2020-01-01"))
#> ℹ Fetching CPI (rate)
#> ✔ Fetching CPI (rate) [982ms]
#> 
#>          date value
#> 1  2020-01-01   1.8
#> 2  2020-02-01   1.7
#> 3  2020-03-01   1.5
#> 4  2020-04-01   0.8
#> 5  2020-05-01   0.5
#> 6  2020-06-01   0.6
#> 7  2020-07-01   1.0
#> 8  2020-08-01   0.2
#> 9  2020-09-01   0.5
#> 10 2020-10-01   0.7
#> 11 2020-11-01   0.3
#> 12 2020-12-01   0.6
#> 13 2021-01-01   0.7
#> 14 2021-02-01   0.4
#> 15 2021-03-01   0.7
#> 16 2021-04-01   1.5
#> 17 2021-05-01   2.1
#> 18 2021-06-01   2.5
#> 19 2021-07-01   2.0
#> 20 2021-08-01   3.2
#> 21 2021-09-01   3.1
#> 22 2021-10-01   4.2
#> 23 2021-11-01   5.1
#> 24 2021-12-01   5.4
#> 25 2022-01-01   5.5
#> 26 2022-02-01   6.2
#> 27 2022-03-01   7.0
#> 28 2022-04-01   9.0
#> 29 2022-05-01   9.1
#> 30 2022-06-01   9.4
#> 31 2022-07-01  10.1
#> 32 2022-08-01   9.9
#> 33 2022-09-01  10.1
#> 34 2022-10-01  11.1
#> 35 2022-11-01  10.7
#> 36 2022-12-01  10.5
#> 37 2023-01-01  10.1
#> 38 2023-02-01  10.4
#> 39 2023-03-01  10.1
#> 40 2023-04-01   8.7
#> 41 2023-05-01   8.7
#> 42 2023-06-01   7.9
#> 43 2023-07-01   6.8
#> 44 2023-08-01   6.7
#> 45 2023-09-01   6.7
#> 46 2023-10-01   4.6
#> 47 2023-11-01   3.9
#> 48 2023-12-01   4.0
#> 49 2024-01-01   4.0
#> 50 2024-02-01   3.4
#> 51 2024-03-01   3.2
#> 52 2024-04-01   2.3
#> 53 2024-05-01   2.0
#> 54 2024-06-01   2.0
#> 55 2024-07-01   2.2
#> 56 2024-08-01   2.2
#> 57 2024-09-01   1.7
#> 58 2024-10-01   2.3
#> 59 2024-11-01   2.6
#> 60 2024-12-01   2.5
#> 61 2025-01-01   3.0
#> 62 2025-02-01   2.8
#> 63 2025-03-01   2.6
#> 64 2025-04-01   3.5
#> 65 2025-05-01   3.4
#> 66 2025-06-01   3.6
#> 67 2025-07-01   3.8
#> 68 2025-08-01   3.8
#> 69 2025-09-01   3.8
#> 70 2025-10-01   3.6
#> 71 2025-11-01   3.2
#> 72 2025-12-01   3.4
#> 73 2026-01-01   3.0
#> 74 2026-02-01   3.0
#> 75 2026-03-01   3.3
options(op)
# }
```
