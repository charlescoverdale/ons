# ons 0.1.5

Data-correctness release.

* `ons_gdp()` read every measure from the first-estimate dataset (PN2),
  which is only updated at each first estimate. After the quarterly
  national accounts (QNA) are published it is out of date: in October
  2026 it still gave Q2 2026 GDP of GBP 712.5bn in the old chained-volume
  prices, where the national accounts give GBP 744.5bn after Blue Book
  2026, and growth of 0.4% rather than the revised 0.5%. Each series is
  now read from whichever of the two datasets the ONS released most
  recently.
* `ons_gdp(measure = "yoy")` returned annual figures (series IHYP), one
  row a year, from a quarterly function. It now returns the quarterly
  series (IHYR): growth on the same quarter a year earlier.
* `ons_wages(measure = "real")` failed with HTTP 404: the ONS moved the
  real earnings index (A2F8) from the LMS dataset to EMP. Both are now
  tried.
* The cache never expired, so a series downloaded once was returned
  unchanged on every later call, missing each new release. Cached copies
  are now re-fetched after 24 hours; set `options(ons.cache_ttl =
  <hours>)` to change this.

# ons 0.1.4

* Added rate limiting to `ons_search()` to match other API functions and
  prevent accidental 429 errors.

# ons 0.1.3

* Examples now wrapped in `try()` to handle transient ONS API failures
  gracefully during CRAN checks.

# ons 0.1.2

* Removed non-existent pkgdown URL from DESCRIPTION.

# ons 0.1.1

* Examples now cache to `tempdir()` instead of the user's home directory,
  fixing CRAN policy compliance for `\donttest` examples.
* Cache directory is now configurable via `options(ons.cache_dir = ...)`.

# ons 0.1.0

* Initial release.
* Data functions: `ons_gdp()`, `ons_monthly_gdp()`, `ons_cpi()`,
  `ons_unemployment()`, `ons_employment()`, `ons_inactivity()`,
  `ons_wages()`, `ons_trade()`, `ons_retail_sales()`,
  `ons_house_prices()`, `ons_productivity()`, `ons_population()`,
  `ons_public_finances()`.
* Generic fetch: `ons_get()` fetches any series by CDID code.
* Discovery: `ons_search()` searches the ONS catalogue by keyword.
* Caching: `clear_cache()` manages locally cached data.
