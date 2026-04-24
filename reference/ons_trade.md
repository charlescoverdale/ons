# Download UK trade data

Downloads UK trade in goods and services data from the ONS. Available
from 1948.

## Usage

``` r
ons_trade(
  measure = c("balance", "exports", "imports"),
  from = NULL,
  to = NULL,
  cache = TRUE
)
```

## Source

<https://www.ons.gov.uk>

## Arguments

- measure:

  Character. One of `"balance"` (default, trade balance), `"exports"`
  (total exports), or `"imports"` (total imports). All in GBP millions,
  current prices, seasonally adjusted.

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

  Numeric. Trade value (GBP millions).

## See also

Other trade and prices:
[`ons_house_prices()`](https://charlescoverdale.github.io/ons/reference/ons_house_prices.md),
[`ons_retail_sales()`](https://charlescoverdale.github.io/ons/reference/ons_retail_sales.md)

## Examples

``` r
# \donttest{
op <- options(ons.cache_dir = tempdir())
try(ons_trade(from = "2020-01-01"))
#> ℹ Fetching trade (balance)
#> ✔ Fetching trade (balance) [262ms]
#> 
#>          date  value
#> 1  2020-01-01   2412
#> 2  2020-02-01  -1353
#> 3  2020-03-01   1332
#> 4  2020-04-01   8641
#> 5  2020-05-01   9471
#> 6  2020-06-01   4277
#> 7  2020-07-01   2050
#> 8  2020-08-01   1929
#> 9  2020-09-01  -2069
#> 10 2020-10-01  -1472
#> 11 2020-11-01  -3752
#> 12 2020-12-01  -5798
#> 13 2021-01-01  -2608
#> 14 2021-02-01   -654
#> 15 2021-03-01   3329
#> 16 2021-04-01   3215
#> 17 2021-05-01   4735
#> 18 2021-06-01   1301
#> 19 2021-07-01  -2815
#> 20 2021-08-01  -2544
#> 21 2021-09-01  -3400
#> 22 2021-10-01   2106
#> 23 2021-11-01     22
#> 24 2021-12-01  -1748
#> 25 2022-01-01 -10899
#> 26 2022-02-01  -7112
#> 27 2022-03-01  -7384
#> 28 2022-04-01  -5840
#> 29 2022-05-01  -6255
#> 30 2022-06-01  -6375
#> 31 2022-07-01  -1380
#> 32 2022-08-01   1478
#> 33 2022-09-01   4942
#> 34 2022-10-01   7253
#> 35 2022-11-01   4556
#> 36 2022-12-01   -731
#> 37 2023-01-01  -1530
#> 38 2023-02-01  -1451
#> 39 2023-03-01  -1161
#> 40 2023-04-01   -616
#> 41 2023-05-01  -5454
#> 42 2023-06-01  -2953
#> 43 2023-07-01  -1748
#> 44 2023-08-01  -3289
#> 45 2023-09-01  -1628
#> 46 2023-10-01  -5735
#> 47 2023-11-01  -3343
#> 48 2023-12-01  -3233
#> 49 2024-01-01   -975
#> 50 2024-02-01  -1098
#> 51 2024-03-01  -2243
#> 52 2024-04-01  -5056
#> 53 2024-05-01  -2891
#> 54 2024-06-01  -3183
#> 55 2024-07-01  -1951
#> 56 2024-08-01   1582
#> 57 2024-09-01   1640
#> 58 2024-10-01  -2507
#> 59 2024-11-01  -3407
#> 60 2024-12-01   -925
#> 61 2025-01-01  -1530
#> 62 2025-02-01  -4778
#> 63 2025-03-01  -3113
#> 64 2025-04-01  -3792
#> 65 2025-05-01  -3254
#> 66 2025-06-01  -3943
#> 67 2025-07-01  -1188
#> 68 2025-08-01  -1169
#> 69 2025-09-01  -3478
#> 70 2025-10-01  -5879
#> 71 2025-11-01  -4622
#> 72 2025-12-01  -1660
#> 73 2026-01-01   3018
#> 74 2026-02-01   -720
options(op)
# }
```
