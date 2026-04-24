# Changelog

## ons 0.1.4

- Added rate limiting to
  [`ons_search()`](https://charlescoverdale.github.io/ons/reference/ons_search.md)
  to match other API functions and prevent accidental 429 errors.

## ons 0.1.3

CRAN release: 2026-03-18

- Examples now wrapped in [`try()`](https://rdrr.io/r/base/try.html) to
  handle transient ONS API failures gracefully during CRAN checks.

## ons 0.1.2

- Removed non-existent pkgdown URL from DESCRIPTION.

## ons 0.1.1

- Examples now cache to
  [`tempdir()`](https://rdrr.io/r/base/tempfile.html) instead of the
  user’s home directory, fixing CRAN policy compliance for `\donttest`
  examples.
- Cache directory is now configurable via
  `options(ons.cache_dir = ...)`.

## ons 0.1.0

CRAN release: 2026-03-12

- Initial release.
- Data functions:
  [`ons_gdp()`](https://charlescoverdale.github.io/ons/reference/ons_gdp.md),
  [`ons_monthly_gdp()`](https://charlescoverdale.github.io/ons/reference/ons_monthly_gdp.md),
  [`ons_cpi()`](https://charlescoverdale.github.io/ons/reference/ons_cpi.md),
  [`ons_unemployment()`](https://charlescoverdale.github.io/ons/reference/ons_unemployment.md),
  [`ons_employment()`](https://charlescoverdale.github.io/ons/reference/ons_employment.md),
  [`ons_inactivity()`](https://charlescoverdale.github.io/ons/reference/ons_inactivity.md),
  [`ons_wages()`](https://charlescoverdale.github.io/ons/reference/ons_wages.md),
  [`ons_trade()`](https://charlescoverdale.github.io/ons/reference/ons_trade.md),
  [`ons_retail_sales()`](https://charlescoverdale.github.io/ons/reference/ons_retail_sales.md),
  [`ons_house_prices()`](https://charlescoverdale.github.io/ons/reference/ons_house_prices.md),
  [`ons_productivity()`](https://charlescoverdale.github.io/ons/reference/ons_productivity.md),
  [`ons_population()`](https://charlescoverdale.github.io/ons/reference/ons_population.md),
  [`ons_public_finances()`](https://charlescoverdale.github.io/ons/reference/ons_public_finances.md).
- Generic fetch:
  [`ons_get()`](https://charlescoverdale.github.io/ons/reference/ons_get.md)
  fetches any series by CDID code.
- Discovery:
  [`ons_search()`](https://charlescoverdale.github.io/ons/reference/ons_search.md)
  searches the ONS catalogue by keyword.
- Caching:
  [`clear_cache()`](https://charlescoverdale.github.io/ons/reference/clear_cache.md)
  manages locally cached data.
