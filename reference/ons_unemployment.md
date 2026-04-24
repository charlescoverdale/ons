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
#> ✔ Fetching unemployment rate [227ms]
#> 
#>          date value
#> 1  2020-01-01   3.9
#> 2  2020-02-01   4.1
#> 3  2020-03-01   4.1
#> 4  2020-04-01   4.1
#> 5  2020-05-01   4.1
#> 6  2020-06-01   4.4
#> 7  2020-07-01   4.6
#> 8  2020-08-01   5.0
#> 9  2020-09-01   5.2
#> 10 2020-10-01   5.2
#> 11 2020-11-01   5.3
#> 12 2020-12-01   5.2
#> 13 2021-01-01   5.0
#> 14 2021-02-01   4.9
#> 15 2021-03-01   4.8
#> 16 2021-04-01   4.8
#> 17 2021-05-01   4.7
#> 18 2021-06-01   4.6
#> 19 2021-07-01   4.5
#> 20 2021-08-01   4.4
#> 21 2021-09-01   4.3
#> 22 2021-10-01   4.2
#> 23 2021-11-01   4.2
#> 24 2021-12-01   4.1
#> 25 2022-01-01   3.9
#> 26 2022-02-01   3.8
#> 27 2022-03-01   3.8
#> 28 2022-04-01   3.7
#> 29 2022-05-01   3.8
#> 30 2022-06-01   3.6
#> 31 2022-07-01   3.6
#> 32 2022-08-01   3.7
#> 33 2022-09-01   3.8
#> 34 2022-10-01   3.9
#> 35 2022-11-01   3.9
#> 36 2022-12-01   3.9
#> 37 2023-01-01   4.0
#> 38 2023-02-01   4.0
#> 39 2023-03-01   3.9
#> 40 2023-04-01   4.0
#> 41 2023-05-01   4.2
#> 42 2023-06-01   4.3
#> 43 2023-07-01   4.3
#> 44 2023-08-01   4.1
#> 45 2023-09-01   4.0
#> 46 2023-10-01   4.0
#> 47 2023-11-01   3.9
#> 48 2023-12-01   4.1
#> 49 2024-01-01   4.2
#> 50 2024-02-01   4.3
#> 51 2024-03-01   4.4
#> 52 2024-04-01   4.4
#> 53 2024-05-01   4.2
#> 54 2024-06-01   4.2
#> 55 2024-07-01   4.1
#> 56 2024-08-01   4.3
#> 57 2024-09-01   4.3
#> 58 2024-10-01   4.4
#> 59 2024-11-01   4.4
#> 60 2024-12-01   4.4
#> 61 2025-01-01   4.4
#> 62 2025-02-01   4.5
#> 63 2025-03-01   4.6
#> 64 2025-04-01   4.7
#> 65 2025-05-01   4.7
#> 66 2025-06-01   4.7
#> 67 2025-07-01   4.8
#> 68 2025-08-01   5.0
#> 69 2025-09-01   5.1
#> 70 2025-10-01   5.1
#> 71 2025-11-01   5.2
#> 72 2025-12-01   5.2
#> 73 2026-01-01   4.9
options(op)
# }
```
