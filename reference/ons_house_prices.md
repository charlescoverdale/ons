# Download UK house prices

Downloads UK average house prices from the HM Land Registry UK House
Price Index. Available from 1968. Data is jointly produced by the ONS
and HM Land Registry.

## Usage

``` r
ons_house_prices(from = NULL, to = NULL, cache = TRUE)
```

## Source

<https://www.gov.uk/government/collections/uk-house-price-index-reports>

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

- average_price_gbp:

  Numeric. Average house price (GBP).

- annual_change_pct:

  Numeric. Annual percentage change.

## Details

The function automatically finds the latest available monthly file from
HM Land Registry, working backwards from the current month.

## See also

Other trade and prices:
[`ons_retail_sales()`](https://charlescoverdale.github.io/ons/reference/ons_retail_sales.md),
[`ons_trade()`](https://charlescoverdale.github.io/ons/reference/ons_trade.md)

## Examples

``` r
# \donttest{
op <- options(ons.cache_dir = tempdir())
try(ons_house_prices(from = "2020-01-01"))
#> ℹ Fetching house prices
#> ✔ Fetching house prices [1.5s]
#> 
#>          date average_price_gbp annual_change_pct
#> 1  2020-01-01            213657               1.6
#> 2  2020-02-01            212429               1.3
#> 3  2020-03-01            214344               2.5
#> 4  2020-04-01            212160               0.7
#> 5  2020-05-01            213258               1.1
#> 6  2020-06-01            216208               2.0
#> 7  2020-07-01            218030               1.7
#> 8  2020-08-01            220163               2.4
#> 9  2020-09-01            222511               3.4
#> 10 2020-10-01            224377               4.6
#> 11 2020-11-01            226675               6.0
#> 12 2020-12-01            228446               7.0
#> 13 2021-01-01            228417               6.9
#> 14 2021-02-01            229067               7.8
#> 15 2021-03-01            232463               8.5
#> 16 2021-04-01            228979               7.9
#> 17 2021-05-01            230532               8.1
#> 18 2021-06-01            242777              12.3
#> 19 2021-07-01            231386               6.1
#> 20 2021-08-01            238403               8.3
#> 21 2021-09-01            245371              10.3
#> 22 2021-10-01            239236               6.6
#> 23 2021-11-01            243930               7.6
#> 24 2021-12-01            245189               7.3
#> 25 2022-01-01            248031               8.6
#> 26 2022-02-01            248309               8.4
#> 27 2022-03-01            249232               7.2
#> 28 2022-04-01            252167              10.1
#> 29 2022-05-01            255040              10.6
#> 30 2022-06-01            258118               6.3
#> 31 2022-07-01            262904              13.6
#> 32 2022-08-01            265124              11.2
#> 33 2022-09-01            265727               8.3
#> 34 2022-10-01            265693              11.1
#> 35 2022-11-01            265299               8.8
#> 36 2022-12-01            263190               7.3
#> 37 2023-01-01            260941               5.2
#> 38 2023-02-01            258788               4.2
#> 39 2023-03-01            255885               2.7
#> 40 2023-04-01            256479               1.7
#> 41 2023-05-01            257330               0.9
#> 42 2023-06-01            258275               0.1
#> 43 2023-07-01            261182              -0.7
#> 44 2023-08-01            262602              -1.0
#> 45 2023-09-01            261318              -1.7
#> 46 2023-10-01            260129              -2.1
#> 47 2023-11-01            258368              -2.6
#> 48 2023-12-01            256177              -2.7
#> 49 2024-01-01            255972              -1.9
#> 50 2024-02-01            254633              -1.6
#> 51 2024-03-01            255082              -0.3
#> 52 2024-04-01            256478               0.0
#> 53 2024-05-01            258565               0.5
#> 54 2024-06-01            259585               0.5
#> 55 2024-07-01            262479               0.5
#> 56 2024-08-01            265085               0.9
#> 57 2024-09-01            264750               1.3
#> 58 2024-10-01            265252               2.0
#> 59 2024-11-01            264515               2.4
#> 60 2024-12-01            263991               3.1
#> 61 2025-01-01            264936               3.5
#> 62 2025-02-01            264771               4.0
#> 63 2025-03-01            268205               5.1
#> 64 2025-04-01            260615               1.6
#> 65 2025-05-01            263981               2.1
#> 66 2025-06-01            267004               2.9
#> 67 2025-07-01            269373               2.6
#> 68 2025-08-01            271690               2.5
#> 69 2025-09-01            270774               2.3
#> 70 2025-10-01            271932               2.5
#> 71 2025-11-01            272390               3.0
#> 72 2025-12-01            269112               1.9
#> 73 2026-01-01            267653               1.0
#> 74 2026-02-01            267957               1.2
options(op)
# }
```
