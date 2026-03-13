# ons

[![R-CMD-check](https://github.com/charlescoverdale/ons/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/charlescoverdale/ons/actions/workflows/R-CMD-check.yaml)
[![CRAN status](https://www.r-pkg.org/badges/version/ons)](https://CRAN.R-project.org/package=ons) [![CRAN downloads](https://cranlogs.r-pkg.org/badges/ons)](https://cran.r-project.org/package=ons) [![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable) [![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

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
#>         date value
#>   2024-07-01   0.2
#>   2024-10-01   0.3
#>   2025-01-01   0.7
#>   2025-04-01   0.2
#>   2025-07-01   0.1
#>   2025-10-01   0.1
```

---

### How has inflation changed over time?

```r
# CPI annual rate
cpi <- ons_cpi(from = "2024-01-01")
tail(cpi, 6)
#>         date value
#>   2025-08-01   3.8
#>   2025-09-01   3.8
#>   2025-10-01   3.6
#>   2025-11-01   3.2
#>   2025-12-01   3.4
#>   2026-01-01   3.0

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
#>         date value
#>   2025-06-01   4.7
#>   2025-07-01   4.8
#>   2025-08-01   5.0
#>   2025-09-01   5.1
#>   2025-10-01   5.1
#>   2025-11-01   5.2
```

---

### How have wages changed over time?

```r
# Average weekly earnings (GBP)
wages <- ons_wages(from = "2024-01-01")
tail(wages, 6)
#>         date value
#>   2025-07-01   728
#>   2025-08-01   733
#>   2025-09-01   734
#>   2025-10-01   740
#>   2025-11-01   740
#>   2025-12-01   735

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
#>         date average_price_gbp annual_change_pct
#>   2025-07-01            270432               3.0
#>   2025-08-01            271808               2.5
#>   2025-09-01            270827               2.3
#>   2025-10-01            270548               2.0
#>   2025-11-01            272043               2.8
#>   2025-12-01            270259               2.4
```

---

### What is the UK's trade balance?

```r
# Trade balance (GBP millions, negative = deficit)
trade <- ons_trade(from = "2024-01-01")
tail(trade, 6)
#>         date value
#>   2025-07-01 -2152
#>   2025-08-01 -2151
#>   2025-09-01 -4530
#>   2025-10-01 -5790
#>   2025-11-01 -5564
#>   2025-12-01 -4340

# Exports or imports separately
ons_trade(measure = "exports", from = "2024-01-01")
```

---

### How much is the UK government borrowing?

```r
# Public sector net borrowing (GBP millions)
pf <- ons_public_finances(from = "2024-01-01")
tail(pf, 6)
#>         date  value
#>   2025-08-01  15239
#>   2025-09-01  22471
#>   2025-10-01  16183
#>   2025-11-01  10380
#>   2025-12-01  13355
#>   2026-01-01 -30366
```

---

### Fetching any series by CDID code

```r
# If you know the ONS CDID code, use ons_get() directly
# Find codes at https://www.ons.gov.uk/timeseriestool

# GDP growth vs CPI inflation
ons_get(c("IHYQ", "D7G7"), from = "2024-01-01", to = "2024-06-30")
#>         date cdid value
#>   2024-01-01 IHYQ   0.8
#>   2024-04-01 IHYQ   0.6
#>   2024-01-01 D7G7   4.0
#>   2024-02-01 D7G7   3.4
#>   2024-03-01 D7G7   3.2
#>   2024-04-01 D7G7   2.3
#>   2024-05-01 D7G7   2.0
#>   2024-06-01 D7G7   2.0

# Search for series by keyword
ons_search("GDP growth")
```

---

## Caching

All downloads are cached locally in your user cache directory. Subsequent calls return the cached copy instantly - no network request is made.

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

This package is part of a family of R packages for UK economic and fiscal data. They share a consistent interface - named functions, tidy data frames, local caching - and are designed to work together. All outputs join cleanly on date columns.

| Package | What it covers |
|---|---|
| [`boe`](https://github.com/charlescoverdale/boe) | Bank of England data (Bank Rate, SONIA, gilt yields, exchange rates, mortgage rates) |
| [`hmrc`](https://github.com/charlescoverdale/hmrc) | HMRC tax receipts, corporation tax, stamp duty, R&D credits, and tax gap data |
| [`obr`](https://github.com/charlescoverdale/obr) | OBR fiscal forecasts and the Public Finances Databank |
| [`readecb`](https://github.com/charlescoverdale/readecb) | European Central Bank data (policy rates, HICP, exchange rates, yield curves) |
| [`readoecd`](https://github.com/charlescoverdale/readoecd) | OECD data (GDP, unemployment, inflation, trade across 38 member countries) |
| [`fred`](https://github.com/charlescoverdale/fred) | US Federal Reserve (FRED) data (800,000+ economic time series) |
| [`inflateR`](https://github.com/charlescoverdale/inflateR) | Adjust values for inflation using CPI or GDP deflator data |

---

## Issues

Please report bugs or requests at <https://github.com/charlescoverdale/ons/issues>.

## Keywords

UK economic data, Office for National Statistics, ONS, GDP, CPI, inflation, unemployment, employment, wages, trade, retail sales, house prices, productivity, population, public finances, R package, open data
