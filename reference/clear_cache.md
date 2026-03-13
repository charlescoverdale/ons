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

## Examples

``` r
# \donttest{
clear_cache()
#> ℹ No cache directory found.
# }
```
