# ons

[![CRAN status](https://www.r-pkg.org/badges/version/ons)](https://CRAN.R-project.org/package=ons) [![CRAN downloads](https://cranlogs.r-pkg.org/badges/ons)](https://cran.r-project.org/package=ons) [![Total Downloads](https://cranlogs.r-pkg.org/badges/grand-total/ons)](https://CRAN.R-project.org/package=ons) [![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable) [![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

An R package for downloading data from the [Office for National Statistics](https://www.ons.gov.uk).

## What is the ONS?

The Office for National Statistics is the UK's national statistical authority. It produces the headline economic data that drives policy and markets - GDP, inflation, unemployment, wages, trade, house prices, retail sales, and population estimates. Its releases move sterling, set the agenda for the Bank of England's Monetary Policy Committee, and underpin economic research across the UK.

The ONS publishes thousands of time series through its [website](https://www.ons.gov.uk), each identified by a four-character CDID code. The data is freely available, but using it programmatically requires knowing these codes, constructing download URLs with topic paths and dataset identifiers, parsing CSV files with metadata headers, and handling mixed-frequency data where annual, quarterly, and monthly observations appear in a single file.

This package replaces all of that with named functions that return clean data frames.

## How is this different from existing packages?

The [`onsr`](https://cran.r-project.org/package=onsr) package on CRAN wraps the ONS Beta API - but that API does not host most headline economic time series. GDP, CPI, unemployment, wages, and trade data are not available through it. `onsr` is useful for Census data and regional breakdowns, but cannot access the series most people actually want. It was last actively developed in 2021.

This package takes a different approach. It fetches data directly from the ONS website's CSV time series endpoint, which covers every published CDID. You get named functions - `ons_gdp()`, `ons_cpi()`, `ons_unemployment()` - that handle series codes, URL construction, frequency filtering, and caching internally.

## Why does this package exist?

The data is freely available, but using it programmatically requires knowing obscure CDID codes (GDP growth is `IHYQ`, the CPI annual rate is `D7G7`), constructing URLs with topic paths and dataset identifiers, parsing CSV files that mix metadata headers with data rows, and filtering out duplicate observations where annual, quarterly, and monthly data appear in the same file. Every analyst who works with ONS data writes the same boilerplate.

```r
# Without this package
url <- paste0(
  "https://www.ons.gov.uk/generator?format=csv",
  "&uri=/economy/grossdomesticproductgdp/timeseries/ihyq/pn2"
)
raw <- readLines(url)
# ... skip metadata rows, parse periods, filter frequency, handle errors ...

# With this package
library(ons)
ons_gdp(from = "2020-01-01")
```

---

## Installation

```r
install.packages("ons")

# Or install the development version from GitHub
# install.packages("devtools")
devtools::install_github("charlescoverdale/ons")
```

---

## Functions

| Function | Description | From |
|---|---|---|
| `ons_gdp()` | Quarterly GDP (growth, YoY, level, nominal) | 1948 |
| `ons_monthly_gdp()` | Monthly GDP index | 1997 |
| `ons_cpi()` | Consumer price inflation (CPI, CPIH, RPI; rate or index) | 1987 |
| `ons_unemployment()` | Unemployment rate (16+, seasonally adjusted) | 1971 |
| `ons_employment()` | Employment rate (total, male, female) | 1971 |
| `ons_inactivity()` | Economic inactivity (thousands) | 1971 |
| `ons_wages()` | Average weekly earnings (level, growth, real) | 2000 |
| `ons_trade()` | Trade balance, exports, imports (GBP millions) | 1948 |
| `ons_retail_sales()` | Retail sales index (volume or value) | 1988 |
| `ons_house_prices()` | UK average house price (GBP) | 1968 |
| `ons_productivity()` | Output per hour or per worker (index) | 1971 |
| `ons_population()` | Mid-year population estimates | 1971 |
| `ons_public_finances()` | Public sector net borrowing (GBP millions) | 1993 |
| `ons_get()` | Fetch any series by CDID code | Any |
| `ons_search()` | Search the ONS catalogue by keyword | - |
| `clear_cache()` | Delete locally cached data files | - |

---

## Examples

### How fast is the UK economy growing?

```r
library(ons)

# Quarterly GDP growth
gdp <- ons_gdp(from = "2000-01-01")
tail(gdp, 6)
#>        date value
#>  2025-01-01   0.6
#>  2025-04-01   0.0
#>  2025-07-01   0.2
#>  2025-10-01   0.0
#>  2026-01-01   0.6
#>  2026-04-01   0.5
```

---

### How has inflation changed over time?

```r
# CPI annual rate
cpi <- ons_cpi(from = "2024-01-01")
tail(cpi, 6)
#>        date value
#>  2026-04-01   2.8
#>  2026-05-01   2.8
#>  2026-06-01   2.6
#>  2026-07-01   2.9
#>  2026-08-01   3.1
#>  2026-09-01   3.5

# CPIH or RPI
ons_cpi(measure = "cpih", from = "2024-01-01")
ons_cpi(measure = "rpi", type = "index", from = "2024-01-01")
```

---

### What is the UK unemployment rate?

```r
# Unemployment rate (16+, SA)
unemp <- ons_unemployment(from = "2020-01-01")
tail(unemp, 6)
#>        date value
#>  2026-02-01   5.0
#>  2026-03-01   4.9
#>  2026-04-01   4.9
#>  2026-05-01   4.9
#>  2026-06-01   4.9
#>  2026-07-01   4.7
```

---

### How have wages changed over time?

```r
# Average weekly earnings (GBP)
wages <- ons_wages(from = "2024-01-01")
tail(wages, 6)
#>        date value
#>  2026-03-01   756
#>  2026-04-01   753
#>  2026-05-01   751
#>  2026-06-01   756
#>  2026-07-01   757
#>  2026-08-01   757

# Year-on-year growth or real terms
ons_wages(measure = "growth", from = "2024-01-01")
ons_wages(measure = "real", from = "2024-01-01")
```

---

### What is the average UK house price?

```r
# UK average house price
hp <- ons_house_prices(from = "2024-01-01")
tail(hp, 6)
#>        date average_price_gbp annual_change_pct
#>  2026-03-01            268631               0.2
#>  2026-04-01            270966               4.2
#>  2026-05-01            272221               3.1
#>  2026-06-01            270690               1.5
#>  2026-07-01            272146               1.2
#>  2026-08-01            273037               0.9
```

---

### What is the UK's trade balance?

```r
# Trade balance (GBP millions, negative = deficit)
trade <- ons_trade(from = "2024-01-01")
tail(trade, 6)
#>        date  value
#>  2026-03-01 -10433
#>  2026-04-01  -6059
#>  2026-05-01  -2494
#>  2026-06-01  -4221
#>  2026-07-01  -2322
#>  2026-08-01   -920

# Exports or imports separately
ons_trade(measure = "exports", from = "2024-01-01")
```

---

### How much is the UK government borrowing?

```r
# Public sector net borrowing (GBP millions)
pf <- ons_public_finances(from = "2024-01-01")
tail(pf, 6)
#>        date value
#>  2026-04-01 23132
#>  2026-05-01 19274
#>  2026-06-01 13289
#>  2026-07-01   374
#>  2026-08-01 17252
#>  2026-09-01 24520
```

---

### Fetching any series by CDID code

```r
# If you know the ONS CDID code, use ons_get() directly
# Find codes at https://www.ons.gov.uk/timeseriestool

# GDP growth vs CPI inflation
ons_get(c("IHYQ", "D7G7"), from = "2024-01-01", to = "2024-06-30")
#>        date cdid value
#>  2024-01-01 IHYQ   0.7
#>  2024-04-01 IHYQ   0.6
#>  2024-01-01 D7G7   4.0
#>  2024-02-01 D7G7   3.4
#>  2024-03-01 D7G7   3.2
#>  2024-04-01 D7G7   2.3
#>  2024-05-01 D7G7   2.0
#>  2024-06-01 D7G7   2.0

# Search for series by keyword
ons_search("GDP growth")
```

---

## Caching

All downloads are cached locally in your user cache directory. Calls within 24 hours return the cached copy without a network request; after that the series is fetched again, so new releases and revisions come through. Set `options(ons.cache_ttl = 168)` to keep cached data for a week, or any other number of hours.

```r
# Force a fresh download
ons_gdp(from = "2020-01-01", cache = FALSE)

# Remove files older than 7 days
clear_cache(max_age_days = 7)

# Remove all cached files
clear_cache()
```

---

## Related packages

| Package | Description |
|---|---|
| [`boe`](https://github.com/charlescoverdale/boe) | Bank of England data (rates, monetary policy, financial markets) |
| [`hmrc`](https://github.com/charlescoverdale/hmrc) | HM Revenue & Customs tax data |
| [`obr`](https://github.com/charlescoverdale/obr) | Office for Budget Responsibility fiscal forecasts |
| [`ukhousing`](https://github.com/charlescoverdale/ukhousing) | UK Land Registry, EPC, and planning data |
| [`fred`](https://github.com/charlescoverdale/fred) | US Federal Reserve (FRED) data |
| [`readecb`](https://github.com/charlescoverdale/readecb) | European Central Bank data |
| [`readoecd`](https://github.com/charlescoverdale/readoecd) | OECD international data |
| [`inflateR`](https://github.com/charlescoverdale/inflateR) | Inflation adjustment for UK price series |
| [`inflationkit`](https://github.com/charlescoverdale/inflationkit) | Inflation analysis (decomposition, persistence, Phillips curve) |
| [`nowcast`](https://github.com/charlescoverdale/nowcast) | Economic nowcasting (bridge, MIDAS, DFM) |
| [`debtkit`](https://github.com/charlescoverdale/debtkit) | Debt sustainability analysis |
| [`inequality`](https://github.com/charlescoverdale/inequality) | Inequality and poverty measurement |

---

## Issues

Please report bugs or requests at <https://github.com/charlescoverdale/ons/issues>.

## Keywords

UK economic data, Office for National Statistics, ONS, GDP, CPI, inflation, unemployment, employment, wages, trade, retail sales, house prices, productivity, population, public finances, R package, open data
