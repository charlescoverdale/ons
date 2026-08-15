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
#> ✔ Fetching economic inactivity [361ms]
#> 
#>          date value
#> 1  2020-01-01  8446
#> 2  2020-02-01  8627
#> 3  2020-03-01  8746
#> 4  2020-04-01  8815
#> 5  2020-05-01  8863
#> 6  2020-06-01  8837
#> 7  2020-07-01  8859
#> 8  2020-08-01  8914
#> 9  2020-09-01  8907
#> 10 2020-10-01  8867
#> 11 2020-11-01  8938
#> 12 2020-12-01  8973
#> 13 2021-01-01  8948
#> 14 2021-02-01  9027
#> 15 2021-03-01  9062
#> 16 2021-04-01  9072
#> 17 2021-05-01  9001
#> 18 2021-06-01  8983
#> 19 2021-07-01  8963
#> 20 2021-08-01  8963
#> 21 2021-09-01  9020
#> 22 2021-10-01  9055
#> 23 2021-11-01  9046
#> 24 2021-12-01  9081
#> 25 2022-01-01  9159
#> 26 2022-02-01  9170
#> 27 2022-03-01  9145
#> 28 2022-04-01  9098
#> 29 2022-05-01  9222
#> 30 2022-06-01  9327
#> 31 2022-07-01  9305
#> 32 2022-08-01  9296
#> 33 2022-09-01  9247
#> 34 2022-10-01  9247
#> 35 2022-11-01  9180
#> 36 2022-12-01  9185
#> 37 2023-01-01  9168
#> 38 2023-02-01  9103
#> 39 2023-03-01  9073
#> 40 2023-04-01  9073
#> 41 2023-05-01  9103
#> 42 2023-06-01  9195
#> 43 2023-07-01  9315
#> 44 2023-08-01  9283
#> 45 2023-09-01  9328
#> 46 2023-10-01  9372
#> 47 2023-11-01  9411
#> 48 2023-12-01  9421
#> 49 2024-01-01  9450
#> 50 2024-02-01  9431
#> 51 2024-03-01  9484
#> 52 2024-04-01  9487
#> 53 2024-05-01  9488
#> 54 2024-06-01  9418
#> 55 2024-07-01  9358
#> 56 2024-08-01  9299
#> 57 2024-09-01  9332
#> 58 2024-10-01  9309
#> 59 2024-11-01  9281
#> 60 2024-12-01  9255
#> 61 2025-01-01  9207
#> 62 2025-02-01  9200
#> 63 2025-03-01  9158
#> 64 2025-04-01  9082
#> 65 2025-05-01  9057
#> 66 2025-06-01  9109
#> 67 2025-07-01  9114
#> 68 2025-08-01  9073
#> 69 2025-09-01  9106
#> 70 2025-10-01  9026
#> 71 2025-11-01  9054
#> 72 2025-12-01  9007
#> 73 2026-01-01  9123
#> 74 2026-02-01  9103
#> 75 2026-03-01  9132
#> 76 2026-04-01  9108
options(op)
# }
```
