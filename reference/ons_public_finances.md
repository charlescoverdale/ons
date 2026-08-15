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
#> ✖ Fetching public sector net borrowing [95ms]
#> 
#> Error in download_cached_ons(url, cache = cache) : 
#>   ONS returned HTTP status 429.
options(op)
# }
```
