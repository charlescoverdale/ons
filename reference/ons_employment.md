# Download employment rate

Downloads the UK employment rate (aged 16 to 64, seasonally adjusted)
from the ONS Labour Market Statistics. Available from 1971.

## Usage

``` r
ons_employment(
  group = c("total", "male", "female"),
  from = NULL,
  to = NULL,
  cache = TRUE
)
```

## Source

<https://www.ons.gov.uk>

## Arguments

- group:

  Character. One of `"total"` (default), `"male"`, or `"female"`.

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

  Numeric. Employment rate (percent).

## See also

Other labour market:
[`ons_inactivity()`](https://charlescoverdale.github.io/ons/reference/ons_inactivity.md),
[`ons_unemployment()`](https://charlescoverdale.github.io/ons/reference/ons_unemployment.md),
[`ons_wages()`](https://charlescoverdale.github.io/ons/reference/ons_wages.md)

## Examples

``` r
# \donttest{
op <- options(ons.cache_dir = tempdir())
try(ons_employment(from = "2020-01-01"))
#> ℹ Fetching employment rate (total)
#> ✔ Fetching employment rate (total) [308ms]
#> 
#>          date value
#> 1  2020-01-01  76.5
#> 2  2020-02-01  75.9
#> 3  2020-03-01  75.7
#> 4  2020-04-01  75.5
#> 5  2020-05-01  75.4
#> 6  2020-06-01  75.3
#> 7  2020-07-01  75.0
#> 8  2020-08-01  74.6
#> 9  2020-09-01  74.5
#> 10 2020-10-01  74.5
#> 11 2020-11-01  74.3
#> 12 2020-12-01  74.3
#> 13 2021-01-01  74.5
#> 14 2021-02-01  74.4
#> 15 2021-03-01  74.4
#> 16 2021-04-01  74.5
#> 17 2021-05-01  74.7
#> 18 2021-06-01  74.8
#> 19 2021-07-01  74.9
#> 20 2021-08-01  75.0
#> 21 2021-09-01  75.0
#> 22 2021-10-01  75.0
#> 23 2021-11-01  75.1
#> 24 2021-12-01  75.0
#> 25 2022-01-01  75.0
#> 26 2022-02-01  75.1
#> 27 2022-03-01  75.2
#> 28 2022-04-01  75.4
#> 29 2022-05-01  75.1
#> 30 2022-06-01  75.0
#> 31 2022-07-01  75.0
#> 32 2022-08-01  75.0
#> 33 2022-09-01  75.0
#> 34 2022-10-01  75.0
#> 35 2022-11-01  75.1
#> 36 2022-12-01  75.2
#> 37 2023-01-01  75.2
#> 38 2023-02-01  75.3
#> 39 2023-03-01  75.5
#> 40 2023-04-01  75.4
#> 41 2023-05-01  75.2
#> 42 2023-06-01  74.9
#> 43 2023-07-01  74.7
#> 44 2023-08-01  74.9
#> 45 2023-09-01  74.9
#> 46 2023-10-01  74.9
#> 47 2023-11-01  74.9
#> 48 2023-12-01  74.7
#> 49 2024-01-01  74.6
#> 50 2024-02-01  74.5
#> 51 2024-03-01  74.4
#> 52 2024-04-01  74.4
#> 53 2024-05-01  74.6
#> 54 2024-06-01  74.7
#> 55 2024-07-01  75.0
#> 56 2024-08-01  74.9
#> 57 2024-09-01  74.9
#> 58 2024-10-01  74.9
#> 59 2024-11-01  75.0
#> 60 2024-12-01  75.0
#> 61 2025-01-01  75.1
#> 62 2025-02-01  75.0
#> 63 2025-03-01  75.1
#> 64 2025-04-01  75.2
#> 65 2025-05-01  75.3
#> 66 2025-06-01  75.2
#> 67 2025-07-01  75.1
#> 68 2025-08-01  75.0
#> 69 2025-09-01  74.9
#> 70 2025-10-01  75.1
#> 71 2025-11-01  75.0
#> 72 2025-12-01  75.1
#> 73 2026-01-01  75.0
options(op)
# }
```
