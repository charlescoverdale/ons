# Download retail sales index

Downloads the Retail Sales Index from the ONS. Returns volume (quantity)
or value (amount spent) indices.

## Usage

``` r
ons_retail_sales(
  type = c("volume", "value"),
  from = NULL,
  to = NULL,
  cache = TRUE
)
```

## Source

<https://www.ons.gov.uk>

## Arguments

- type:

  Character. One of `"volume"` (default, quantity bought, seasonally
  adjusted) or `"value"` (amount spent, not seasonally adjusted).

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

  Numeric. Retail sales index.

## See also

Other trade and prices:
[`ons_house_prices()`](https://charlescoverdale.github.io/ons/reference/ons_house_prices.md),
[`ons_trade()`](https://charlescoverdale.github.io/ons/reference/ons_trade.md)

## Examples

``` r
# \donttest{
op <- options(ons.cache_dir = tempdir())
try(ons_retail_sales(from = "2020-01-01"))
#> ℹ Fetching retail sales (volume)
#> ✔ Fetching retail sales (volume) [229ms]
#> 
#>          date value
#> 1  2020-01-01 104.3
#> 2  2020-02-01 103.7
#> 3  2020-03-01  97.3
#> 4  2020-04-01  80.0
#> 5  2020-05-01  90.6
#> 6  2020-06-01 101.7
#> 7  2020-07-01 106.7
#> 8  2020-08-01 108.5
#> 9  2020-09-01 110.1
#> 10 2020-10-01 111.0
#> 11 2020-11-01 106.0
#> 12 2020-12-01 106.9
#> 13 2021-01-01  98.9
#> 14 2021-02-01  99.8
#> 15 2021-03-01 103.9
#> 16 2021-04-01 112.8
#> 17 2021-05-01 110.2
#> 18 2021-06-01 110.9
#> 19 2021-07-01 108.5
#> 20 2021-08-01 108.8
#> 21 2021-09-01 109.0
#> 22 2021-10-01 108.6
#> 23 2021-11-01 108.4
#> 24 2021-12-01 108.4
#> 25 2022-01-01 107.6
#> 26 2022-02-01 106.3
#> 27 2022-03-01 105.5
#> 28 2022-04-01 104.7
#> 29 2022-05-01 103.0
#> 30 2022-06-01 102.9
#> 31 2022-07-01 103.2
#> 32 2022-08-01 101.5
#> 33 2022-09-01 100.3
#> 34 2022-10-01 101.5
#> 35 2022-11-01 100.6
#> 36 2022-12-01 100.7
#> 37 2023-01-01 100.8
#> 38 2023-02-01 101.2
#> 39 2023-03-01  99.9
#> 40 2023-04-01 101.3
#> 41 2023-05-01 100.0
#> 42 2023-06-01 100.9
#> 43 2023-07-01  99.6
#> 44 2023-08-01  99.5
#> 45 2023-09-01  98.6
#> 46 2023-10-01  99.1
#> 47 2023-11-01 100.6
#> 48 2023-12-01  97.0
#> 49 2024-01-01 100.2
#> 50 2024-02-01 100.3
#> 51 2024-03-01  99.7
#> 52 2024-04-01  98.6
#> 53 2024-05-01 100.9
#> 54 2024-06-01  99.4
#> 55 2024-07-01 100.2
#> 56 2024-08-01 100.4
#> 57 2024-09-01 100.7
#> 58 2024-10-01  99.9
#> 59 2024-11-01  99.9
#> 60 2024-12-01 100.0
#> 61 2025-01-01  98.8
#> 62 2025-02-01 101.0
#> 63 2025-03-01 101.9
#> 64 2025-04-01 101.8
#> 65 2025-05-01  99.9
#> 66 2025-06-01 100.4
#> 67 2025-07-01 101.9
#> 68 2025-08-01 101.0
#> 69 2025-09-01 102.4
#> 70 2025-10-01 101.5
#> 71 2025-11-01 101.0
#> 72 2025-12-01 101.0
#> 73 2026-01-01 102.9
#> 74 2026-02-01 102.1
#> 75 2026-03-01 102.5
#> 76 2026-04-01 101.5
#> 77 2026-05-01 102.9
#> 78 2026-06-01 103.4
#> 79 2026-07-01 103.0
#> 80 2026-08-01 103.7
#> 81 2026-09-01 103.3
options(op)
# }
```
