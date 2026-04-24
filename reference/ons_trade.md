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
#> Waiting 10s for retry backoff ■■■■                            
#> Waiting 10s for retry backoff ■■■■■■■■■■                      
#> Waiting 10s for retry backoff ■■■■■■■■■■■■■■■■■■■             
#> Waiting 10s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■■    
#> Waiting 10s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 
#> ℹ Fetching trade (balance)
#> ✖ Fetching trade (balance) [10.4s]
#> 
#> Error in download_cached_ons(url, cache = cache) : 
#>   ONS returned HTTP status 429.
options(op)
# }
```
