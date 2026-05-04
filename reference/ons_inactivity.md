# Download economic inactivity

Downloads the number of economically inactive people (aged 16 to 64,
seasonally adjusted) from the ONS Labour Market Statistics. Available
from 1971.

## Usage

``` r
ons_inactivity(from = NULL, to = NULL, cache = TRUE)
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

  Numeric. Economically inactive people (thousands).

## See also

Other labour market:
[`ons_employment()`](https://charlescoverdale.github.io/ons/reference/ons_employment.md),
[`ons_unemployment()`](https://charlescoverdale.github.io/ons/reference/ons_unemployment.md),
[`ons_wages()`](https://charlescoverdale.github.io/ons/reference/ons_wages.md)

## Examples

``` r
# \donttest{
op <- options(ons.cache_dir = tempdir())
try(ons_inactivity(from = "2020-01-01"))
#> ℹ Fetching economic inactivity
#> ✔ Fetching economic inactivity [362ms]
#> 
#>          date value
#> 1  2020-01-01  8446
#> 2  2020-02-01  8630
#> 3  2020-03-01  8746
#> 4  2020-04-01  8809
#> 5  2020-05-01  8858
#> 6  2020-06-01  8835
#> 7  2020-07-01  8857
#> 8  2020-08-01  8917
#> 9  2020-09-01  8909
#> 10 2020-10-01  8872
#> 11 2020-11-01  8942
#> 12 2020-12-01  8974
#> 13 2021-01-01  8947
#> 14 2021-02-01  9033
#> 15 2021-03-01  9062
#> 16 2021-04-01  9061
#> 17 2021-05-01  8995
#> 18 2021-06-01  8980
#> 19 2021-07-01  8959
#> 20 2021-08-01  8966
#> 21 2021-09-01  9023
#> 22 2021-10-01  9062
#> 23 2021-11-01  9050
#> 24 2021-12-01  9087
#> 25 2022-01-01  9159
#> 26 2022-02-01  9177
#> 27 2022-03-01  9147
#> 28 2022-04-01  9081
#> 29 2022-05-01  9215
#> 30 2022-06-01  9324
#> 31 2022-07-01  9302
#> 32 2022-08-01  9301
#> 33 2022-09-01  9248
#> 34 2022-10-01  9251
#> 35 2022-11-01  9184
#> 36 2022-12-01  9195
#> 37 2023-01-01  9170
#> 38 2023-02-01  9113
#> 39 2023-03-01  9076
#> 40 2023-04-01  9050
#> 41 2023-05-01  9093
#> 42 2023-06-01  9190
#> 43 2023-07-01  9310
#> 44 2023-08-01  9288
#> 45 2023-09-01  9328
#> 46 2023-10-01  9374
#> 47 2023-11-01  9416
#> 48 2023-12-01  9437
#> 49 2024-01-01  9455
#> 50 2024-02-01  9445
#> 51 2024-03-01  9490
#> 52 2024-04-01  9461
#> 53 2024-05-01  9477
#> 54 2024-06-01  9411
#> 55 2024-07-01  9352
#> 56 2024-08-01  9307
#> 57 2024-09-01  9333
#> 58 2024-10-01  9307
#> 59 2024-11-01  9283
#> 60 2024-12-01  9268
#> 61 2025-01-01  9224
#> 62 2025-02-01  9229
#> 63 2025-03-01  9187
#> 64 2025-04-01  9085
#> 65 2025-05-01  9073
#> 66 2025-06-01  9124
#> 67 2025-07-01  9115
#> 68 2025-08-01  9080
#> 69 2025-09-01  9099
#> 70 2025-10-01  9021
#> 71 2025-11-01  9042
#> 72 2025-12-01  8999
#> 73 2026-01-01  9116
options(op)
# }
```
