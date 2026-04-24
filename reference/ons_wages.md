# Download average weekly earnings

Downloads average weekly earnings (AWE) for the whole economy from the
ONS Labour Market Statistics. Available from 2000.

## Usage

``` r
ons_wages(
  measure = c("level", "growth", "real"),
  from = NULL,
  to = NULL,
  cache = TRUE
)
```

## Source

<https://www.ons.gov.uk>

## Arguments

- measure:

  Character. One of `"level"` (default, GBP per week), `"growth"`
  (year-on-year 3-month average percentage change), or `"real"` (real
  terms index, seasonally adjusted regular pay).

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

  Numeric. Earnings level (GBP), growth rate (percent), or real index.

## See also

Other labour market:
[`ons_employment()`](https://charlescoverdale.github.io/ons/reference/ons_employment.md),
[`ons_inactivity()`](https://charlescoverdale.github.io/ons/reference/ons_inactivity.md),
[`ons_unemployment()`](https://charlescoverdale.github.io/ons/reference/ons_unemployment.md)

## Examples

``` r
# \donttest{
op <- options(ons.cache_dir = tempdir())
try(ons_wages(from = "2020-01-01"))
#> ℹ Fetching average weekly earnings (level)
#> ✔ Fetching average weekly earnings (level) [239ms]
#> 
#>          date value
#> 1  2020-01-01   546
#> 2  2020-02-01   547
#> 3  2020-03-01   529
#> 4  2020-04-01   529
#> 5  2020-05-01   532
#> 6  2020-06-01   532
#> 7  2020-07-01   541
#> 8  2020-08-01   552
#> 9  2020-09-01   558
#> 10 2020-10-01   563
#> 11 2020-11-01   568
#> 12 2020-12-01   570
#> 13 2021-01-01   570
#> 14 2021-02-01   569
#> 15 2021-03-01   551
#> 16 2021-04-01   576
#> 17 2021-05-01   582
#> 18 2021-06-01   577
#> 19 2021-07-01   580
#> 20 2021-08-01   584
#> 21 2021-09-01   585
#> 22 2021-10-01   589
#> 23 2021-11-01   590
#> 24 2021-12-01   606
#> 25 2022-01-01   602
#> 26 2022-02-01   603
#> 27 2022-03-01   608
#> 28 2022-04-01   606
#> 29 2022-05-01   607
#> 30 2022-06-01   614
#> 31 2022-07-01   614
#> 32 2022-08-01   620
#> 33 2022-09-01   619
#> 34 2022-10-01   628
#> 35 2022-11-01   633
#> 36 2022-12-01   635
#> 37 2023-01-01   639
#> 38 2023-02-01   643
#> 39 2023-03-01   644
#> 40 2023-04-01   652
#> 41 2023-05-01   655
#> 42 2023-06-01   670
#> 43 2023-07-01   665
#> 44 2023-08-01   665
#> 45 2023-09-01   670
#> 46 2023-10-01   665
#> 47 2023-11-01   670
#> 48 2023-12-01   672
#> 49 2024-01-01   676
#> 50 2024-02-01   680
#> 51 2024-03-01   684
#> 52 2024-04-01   688
#> 53 2024-05-01   691
#> 54 2024-06-01   692
#> 55 2024-07-01   693
#> 56 2024-08-01   697
#> 57 2024-09-01   704
#> 58 2024-10-01   705
#> 59 2024-11-01   707
#> 60 2024-12-01   714
#> 61 2025-01-01   710
#> 62 2025-02-01   719
#> 63 2025-03-01   725
#> 64 2025-04-01   720
#> 65 2025-05-01   723
#> 66 2025-06-01   725
#> 67 2025-07-01   728
#> 68 2025-08-01   733
#> 69 2025-09-01   734
#> 70 2025-10-01   740
#> 71 2025-11-01   740
#> 72 2025-12-01   735
#> 73 2026-01-01   743
#> 74 2026-02-01   745
options(op)
# }
```
