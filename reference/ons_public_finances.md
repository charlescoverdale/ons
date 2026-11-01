# Download public sector finances

Downloads public sector net borrowing (excluding public sector banks)
from the ONS. Available from 1993.

## Usage

``` r
ons_public_finances(from = NULL, to = NULL, cache = TRUE)
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

  Numeric. Public sector net borrowing (GBP millions).

## Examples

``` r
# \donttest{
op <- options(ons.cache_dir = tempdir())
try(ons_public_finances(from = "2020-01-01"))
#> ℹ Fetching public sector net borrowing
#> Warning: unable to translate 'HTTP/2 200 

#> date: Sun, 01 Nov 2026 14:08:43 GMT

#> content-type: application/octet-stream;charset=utf-8

#> cache-control: public, s-maxage=900, max-age=900, stale-while-revalidate=10

#> content-disposition: attachment; filename="Public sector net borrowing,...' to a wide string
#> Warning: input string 1 is invalid
#> ✔ Fetching public sector net borrowing [329ms]
#> 
#>          date  value
#> 1  2020-01-01  -8160
#> 2  2020-02-01   1971
#> 3  2020-03-01   6879
#> 4  2020-04-01  48983
#> 5  2020-05-01  51103
#> 6  2020-06-01  32143
#> 7  2020-07-01  21821
#> 8  2020-08-01  23998
#> 9  2020-09-01  27968
#> 10 2020-10-01  17902
#> 11 2020-11-01  21404
#> 12 2020-12-01  23915
#> 13 2021-01-01   1263
#> 14 2021-02-01  15491
#> 15 2021-03-01  24843
#> 16 2021-04-01  23167
#> 17 2021-05-01  16776
#> 18 2021-06-01  18358
#> 19 2021-07-01   3947
#> 20 2021-08-01  13543
#> 21 2021-09-01  16422
#> 22 2021-10-01   7663
#> 23 2021-11-01   7009
#> 24 2021-12-01   9467
#> 25 2022-01-01 -12309
#> 26 2022-02-01   6745
#> 27 2022-03-01   5190
#> 28 2022-04-01  13159
#> 29 2022-05-01   8459
#> 30 2022-06-01  18602
#> 31 2022-07-01    285
#> 32 2022-08-01   7549
#> 33 2022-09-01  15036
#> 34 2022-10-01  10771
#> 35 2022-11-01  15241
#> 36 2022-12-01  15627
#> 37 2023-01-01  -8884
#> 38 2023-02-01  10660
#> 39 2023-03-01  17311
#> 40 2023-04-01  20233
#> 41 2023-05-01  15615
#> 42 2023-06-01  19322
#> 43 2023-07-01   3218
#> 44 2023-08-01  11964
#> 45 2023-09-01  15969
#> 46 2023-10-01  16637
#> 47 2023-11-01  15172
#> 48 2023-12-01   8264
#> 49 2024-01-01 -15131
#> 50 2024-02-01  10533
#> 51 2024-03-01  13438
#> 52 2024-04-01  19376
#> 53 2024-05-01  17544
#> 54 2024-06-01  14627
#> 55 2024-07-01   3888
#> 56 2024-08-01  14799
#> 57 2024-09-01  18713
#> 58 2024-10-01  19092
#> 59 2024-11-01  13263
#> 60 2024-12-01  18418
#> 61 2025-01-01 -14973
#> 62 2025-02-01  11632
#> 63 2025-03-01  13430
#> 64 2025-04-01  20158
#> 65 2025-05-01  18245
#> 66 2025-06-01  24273
#> 67 2025-07-01   1489
#> 68 2025-08-01  15361
#> 69 2025-09-01  22764
#> 70 2025-10-01  16177
#> 71 2025-11-01   9921
#> 72 2025-12-01  12930
#> 73 2026-01-01 -31960
#> 74 2026-02-01  12827
#> 75 2026-03-01  12026
#> 76 2026-04-01  23132
#> 77 2026-05-01  19274
#> 78 2026-06-01  13289
#> 79 2026-07-01    374
#> 80 2026-08-01  17252
#> 81 2026-09-01  24520
options(op)
# }
```
