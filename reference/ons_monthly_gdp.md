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
#> ✔ Fetching monthly GDP [10.5s]
#> 
#>          date value
#> 1  2020-01-01  97.3
#> 2  2020-02-01  97.3
#> 3  2020-03-01  89.9
#> 4  2020-04-01  72.7
#> 5  2020-05-01  74.2
#> 6  2020-06-01  81.1
#> 7  2020-07-01  86.6
#> 8  2020-08-01  89.6
#> 9  2020-09-01  90.8
#> 10 2020-10-01  91.2
#> 11 2020-11-01  89.2
#> 12 2020-12-01  90.8
#> 13 2021-01-01  87.8
#> 14 2021-02-01  88.9
#> 15 2021-03-01  91.5
#> 16 2021-04-01  94.5
#> 17 2021-05-01  95.8
#> 18 2021-06-01  96.7
#> 19 2021-07-01  96.3
#> 20 2021-08-01  97.3
#> 21 2021-09-01  97.8
#> 22 2021-10-01  98.0
#> 23 2021-11-01  98.5
#> 24 2021-12-01  98.3
#> 25 2022-01-01  98.9
#> 26 2022-02-01  99.3
#> 27 2022-03-01  99.3
#> 28 2022-04-01  99.5
#> 29 2022-05-01 100.0
#> 30 2022-06-01  99.4
#> 31 2022-07-01  99.9
#> 32 2022-08-01  99.9
#> 33 2022-09-01  99.2
#> 34 2022-10-01 100.1
#> 35 2022-11-01 100.2
#> 36 2022-12-01  99.7
#> 37 2023-01-01 100.1
#> 38 2023-02-01 100.3
#> 39 2023-03-01  99.9
#> 40 2023-04-01 100.1
#> 41 2023-05-01  99.8
#> 42 2023-06-01 100.5
#> 43 2023-07-01 100.1
#> 44 2023-08-01 100.0
#> 45 2023-09-01 100.0
#> 46 2023-10-01  99.6
#> 47 2023-11-01  99.9
#> 48 2023-12-01  99.6
#> 49 2024-01-01 100.1
#> 50 2024-02-01 100.3
#> 51 2024-03-01 100.6
#> 52 2024-04-01 100.7
#> 53 2024-05-01 101.1
#> 54 2024-06-01 100.9
#> 55 2024-07-01 100.8
#> 56 2024-08-01 101.1
#> 57 2024-09-01 101.1
#> 58 2024-10-01 101.2
#> 59 2024-11-01 101.3
#> 60 2024-12-01 101.7
#> 61 2025-01-01 101.7
#> 62 2025-02-01 101.9
#> 63 2025-03-01 102.2
#> 64 2025-04-01 102.1
#> 65 2025-05-01 101.9
#> 66 2025-06-01 102.4
#> 67 2025-07-01 102.3
#> 68 2025-08-01 102.1
#> 69 2025-09-01 102.1
#> 70 2025-10-01 102.0
#> 71 2025-11-01 102.2
#> 72 2025-12-01 102.3
#> 73 2026-01-01 102.5
#> 74 2026-02-01 103.0
options(op)
# }
```
