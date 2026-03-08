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
