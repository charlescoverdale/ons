# Download population estimates

Downloads mid-year population estimates for the United Kingdom from the
ONS. Returns annual estimates.

## Usage

``` r
ons_population(from = NULL, to = NULL, cache = TRUE)
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

  Date. Mid-year date (represented as 1 January).

- value:

  Numeric. Population estimate (thousands).

## See also

Other economic indicators:
[`ons_cpi()`](https://charlescoverdale.github.io/ons/reference/ons_cpi.md),
[`ons_gdp()`](https://charlescoverdale.github.io/ons/reference/ons_gdp.md),
[`ons_monthly_gdp()`](https://charlescoverdale.github.io/ons/reference/ons_monthly_gdp.md),
[`ons_productivity()`](https://charlescoverdale.github.io/ons/reference/ons_productivity.md)

## Examples

``` r
# \donttest{
op <- options(ons.cache_dir = tempdir())
try(ons_population(from = "2000-01-01"))
#> ℹ Fetching population estimates
#> ✔ Fetching population estimates [122ms]
#> 
#>          date    value
#> 1  2000-01-01 58886100
#> 2  2001-01-01 59113000
#> 3  2002-01-01 59365700
#> 4  2003-01-01 59636700
#> 5  2004-01-01 59950400
#> 6  2005-01-01 60413300
#> 7  2006-01-01 60827000
#> 8  2007-01-01 61319100
#> 9  2008-01-01 61823800
#> 10 2009-01-01 62260500
#> 11 2010-01-01 62759500
#> 12 2011-01-01 63285100
#> 13 2012-01-01 63710500
#> 14 2013-01-01 64138200
#> 15 2014-01-01 64618700
#> 16 2015-01-01 65087000
#> 17 2016-01-01 65605800
#> 18 2017-01-01 65964300
#> 19 2018-01-01 66286700
#> 20 2019-01-01 66627500
#> 21 2020-01-01 66739900
#> 22 2021-01-01 66978000
#> 23 2022-01-01 67636100
#> 24 2023-01-01 68526200
#> 25 2024-01-01 69281400
#> 26 2025-01-01 69487000
options(op)
# }
```
