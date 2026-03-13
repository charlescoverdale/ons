# Search for ONS time series

Searches the ONS catalogue for time series matching a keyword or phrase.
Returns CDID codes, titles, and dataset information that can be used
with
[`ons_get()`](https://charlescoverdale.github.io/ons/reference/ons_get.md).

## Usage

``` r
ons_search(query, limit = 10L)
```

## Source

<https://www.ons.gov.uk>

## Arguments

- query:

  Character. Search term (e.g. `"GDP growth"`, `"unemployment"`).

- limit:

  Integer. Maximum number of results to return (default 10, maximum 50).

## Value

A data frame with columns:

- cdid:

  Character. The four-character CDID code.

- dataset_id:

  Character. The ONS dataset identifier.

- title:

  Character. Description of the series.

- release_date:

  Character. Date of the most recent release.

## Examples

``` r
# \donttest{
ons_search("GDP growth")
#>    cdid dataset_id                                         title
#> 1  KB82        PN2                 Revisions to GDP CVM growth %
#> 2  KB82        QNA                 Revisions to GDP CVM growth %
#> 3  MNF4        PN2 GDP Deflator: Quarter on quarter growth: SA %
#> 4  IHYS        QNA       GDP Deflator: Year on Year growth: SA %
#> 5  IHYS       UKEA       GDP Deflator: Year on Year growth: SA %
#> 6  IHYT        QNA GDP Deflator: Quarter on quarter growth: SA %
#> 7  MNF3        QNA       GDP Deflator: Year on Year growth: SA %
#> 8  IHYT        PN2 GDP Deflator: Quarter on quarter growth: SA %
#> 9  MNF4        QNA GDP Deflator: Quarter on quarter growth: SA %
#> 10 MNF3        PN2       GDP Deflator: Year on Year growth: SA %
#>                release_date
#> 1  2026-02-12T00:00:00.000Z
#> 2  2025-12-22T00:00:00.000Z
#> 3  2026-02-12T00:00:00.000Z
#> 4  2025-12-22T00:00:00.000Z
#> 5  2025-12-22T00:00:00.000Z
#> 6  2025-12-22T00:00:00.000Z
#> 7  2025-12-22T00:00:00.000Z
#> 8  2026-02-12T00:00:00.000Z
#> 9  2025-12-22T00:00:00.000Z
#> 10 2026-02-12T00:00:00.000Z
# }
```
