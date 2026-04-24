# Clear the local download cache

Removes cached data files stored by this package. By default all cached
files are deleted. Use `max_age_days` to remove only files older than a
given number of days.

## Usage

``` r
clear_cache(max_age_days = NULL)
```

## Arguments

- max_age_days:

  Numeric. If supplied, only files older than this many days are
  removed. If `NULL` (the default), all cached files are removed.

## Value

Invisibly returns `NULL`. Called for its side effect of deleting cached
files.

## See also

Other data access:
[`ons_get()`](https://charlescoverdale.github.io/ons/reference/ons_get.md),
[`ons_search()`](https://charlescoverdale.github.io/ons/reference/ons_search.md)

## Examples

``` r
# \donttest{
op <- options(ons.cache_dir = tempdir())
clear_cache()
#> Warning: cannot remove file '/tmp/RtmpOwOkOp/bslib-246362e7e3ff6191071d5f9b40ba8d62', reason 'Directory not empty'
#> Warning: cannot remove file '/tmp/RtmpOwOkOp/downlit', reason 'Directory not empty'
#> ✔ Removed 2 cached files.
options(op)
# }
```
