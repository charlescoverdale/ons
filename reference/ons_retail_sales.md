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
#> Waiting 10s for retry backoff ■■■■                            
#> Waiting 10s for retry backoff ■■■■■■■■■■■■                    
#> Waiting 10s for retry backoff ■■■■■■■■■■■■■■■■■■■■■           
#> Waiting 10s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 
#> Waiting 10s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 
#> ℹ Fetching retail sales (volume)
#> ✖ Fetching retail sales (volume) [10.3s]
#> 
#> Error in download_cached_ons(url, cache = cache) : 
#>   ONS returned HTTP status 429.
options(op)
# }
```
