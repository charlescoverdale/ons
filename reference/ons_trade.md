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
#> Waiting 10s for retry backoff ■■■■■■                          
#> Waiting 10s for retry backoff ■■■■■■■■■■■■■■■                 
#> Waiting 10s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■        
#> Waiting 10s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 
#> ℹ Fetching trade (balance)

#> ✔ Fetching trade (balance) [10.3s]
#> 
#>          date  value
#> 1  2020-01-01   2502
#> 2  2020-02-01  -1483
#> 3  2020-03-01   1279
#> 4  2020-04-01   8747
#> 5  2020-05-01   9272
#> 6  2020-06-01   3950
#> 7  2020-07-01   1589
#> 8  2020-08-01   1553
#> 9  2020-09-01  -2299
#> 10 2020-10-01  -1510
#> 11 2020-11-01  -3955
#> 12 2020-12-01  -6299
#> 13 2021-01-01  -2746
#> 14 2021-02-01   -940
#> 15 2021-03-01   3507
#> 16 2021-04-01   3480
#> 17 2021-05-01   4916
#> 18 2021-06-01   1262
#> 19 2021-07-01  -3079
#> 20 2021-08-01  -3028
#> 21 2021-09-01  -3781
#> 22 2021-10-01   2162
#> 23 2021-11-01    -75
#> 24 2021-12-01  -2720
#> 25 2022-01-01 -11362
#> 26 2022-02-01  -7584
#> 27 2022-03-01  -7382
#> 28 2022-04-01  -5926
#> 29 2022-05-01  -7384
#> 30 2022-06-01  -6319
#> 31 2022-07-01  -1902
#> 32 2022-08-01    987
#> 33 2022-09-01   4210
#> 34 2022-10-01   7629
#> 35 2022-11-01   5306
#> 36 2022-12-01   -706
#> 37 2023-01-01  -1318
#> 38 2023-02-01  -1297
#> 39 2023-03-01   -241
#> 40 2023-04-01    148
#> 41 2023-05-01  -5170
#> 42 2023-06-01  -2123
#> 43 2023-07-01   -840
#> 44 2023-08-01  -2693
#> 45 2023-09-01  -1259
#> 46 2023-10-01  -3966
#> 47 2023-11-01  -1720
#> 48 2023-12-01   -187
#> 49 2024-01-01     25
#> 50 2024-02-01   -314
#> 51 2024-03-01  -1420
#> 52 2024-04-01  -4305
#> 53 2024-05-01  -2914
#> 54 2024-06-01  -2462
#> 55 2024-07-01  -3742
#> 56 2024-08-01   1866
#> 57 2024-09-01   2176
#> 58 2024-10-01  -4103
#> 59 2024-11-01  -4614
#> 60 2024-12-01  -1290
#> 61 2025-01-01  -1300
#> 62 2025-02-01  -3947
#> 63 2025-03-01  -2399
#> 64 2025-04-01  -3520
#> 65 2025-05-01  -3572
#> 66 2025-06-01  -3822
#> 67 2025-07-01  -2174
#> 68 2025-08-01  -2110
#> 69 2025-09-01  -4282
#> 70 2025-10-01  -6108
#> 71 2025-11-01  -4863
#> 72 2025-12-01  -1350
#> 73 2026-01-01    852
#> 74 2026-02-01  -6573
#> 75 2026-03-01 -10433
#> 76 2026-04-01  -6059
#> 77 2026-05-01  -2494
#> 78 2026-06-01  -4221
#> 79 2026-07-01  -2322
#> 80 2026-08-01   -920
options(op)
# }
```
