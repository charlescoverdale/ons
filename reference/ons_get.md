# Download any ONS time series by CDID code

Fetches a time series from the ONS website using its CDID
(four-character series identifier). The function uses the ONS Search API
to discover the download path, then retrieves the CSV.

## Usage

``` r
ons_get(cdid, from = NULL, to = NULL, cache = TRUE)
```

## Source

<https://www.ons.gov.uk>

## Arguments

- cdid:

  Character vector. One or more ONS CDID codes (e.g. `"IHYQ"` for
  quarterly GDP growth). Maximum 50 codes per call.

- from:

  Date or character (YYYY-MM-DD). Start date filter. Defaults to `NULL`
  (all available data).

- to:

  Date or character (YYYY-MM-DD). End date filter. Defaults to `NULL`
  (up to the latest observation).

- cache:

  Logical. Use cached data if available (default `TRUE`).

## Value

A data frame with columns:

- date:

  Date. Observation date (first day of the period).

- cdid:

  Character. The CDID code.

- value:

  Numeric. Observation value.

## Details

CDID codes can be found by browsing the ONS time series explorer at
<https://www.ons.gov.uk/timeseriestool> or by using
[`ons_search()`](https://charlescoverdale.github.io/ons/reference/ons_search.md).

## See also

Other data access:
[`clear_cache()`](https://charlescoverdale.github.io/ons/reference/clear_cache.md),
[`ons_search()`](https://charlescoverdale.github.io/ons/reference/ons_search.md)

## Examples

``` r
# \donttest{
op <- options(ons.cache_dir = tempdir())
try(ons_get("IHYQ", from = "2020-01-01"))
#> ℹ Fetching "IHYQ"
#> ✔ Fetching "IHYQ" [1.2s]
#> 
#>          date cdid value
#> 1  2020-01-01 IHYQ  -2.7
#> 2  2020-04-01 IHYQ -19.9
#> 3  2020-07-01 IHYQ  17.0
#> 4  2020-10-01 IHYQ   1.4
#> 5  2021-01-01 IHYQ  -1.1
#> 6  2021-04-01 IHYQ   7.0
#> 7  2021-07-01 IHYQ   1.7
#> 8  2021-10-01 IHYQ   1.4
#> 9  2022-01-01 IHYQ   1.0
#> 10 2022-04-01 IHYQ   0.6
#> 11 2022-07-01 IHYQ   0.1
#> 12 2022-10-01 IHYQ   0.3
#> 13 2023-01-01 IHYQ   0.1
#> 14 2023-04-01 IHYQ   0.0
#> 15 2023-07-01 IHYQ  -0.2
#> 16 2023-10-01 IHYQ  -0.3
#> 17 2024-01-01 IHYQ   0.8
#> 18 2024-04-01 IHYQ   0.6
#> 19 2024-07-01 IHYQ   0.2
#> 20 2024-10-01 IHYQ   0.3
#> 21 2025-01-01 IHYQ   0.7
#> 22 2025-04-01 IHYQ   0.2
#> 23 2025-07-01 IHYQ   0.1
#> 24 2025-10-01 IHYQ   0.1
options(op)
# }
```
