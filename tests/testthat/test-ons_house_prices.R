test_that("ons_house_prices() returns expected structure", {
  skip_on_cran()
  skip_if_offline()

  out <- ons_house_prices(from = "2024-01-01")

  expect_s3_class(out, "data.frame")
  expect_named(out, c("date", "average_price_gbp", "annual_change_pct"))
  expect_s3_class(out$date, "Date")
  expect_type(out$average_price_gbp, "double")
  expect_type(out$annual_change_pct, "double")
  expect_true(nrow(out) > 0)
})

test_that("ons_house_prices() date filtering works", {
  skip_on_cran()
  skip_if_offline()

  out <- ons_house_prices(from = "2023-01-01", to = "2023-12-31")

  expect_true(all(out$date >= as.Date("2023-01-01")))
  expect_true(all(out$date <= as.Date("2023-12-31")))
  expect_equal(nrow(out), 12)
})

test_that("ons_house_prices() returns data back to 1968", {
  skip_on_cran()
  skip_if_offline()

  out <- ons_house_prices()

  expect_true(min(out$date) <= as.Date("1970-01-01"))
  expect_true(nrow(out) > 600)
})

test_that("ons_house_prices() prices are reasonable", {
  skip_on_cran()
  skip_if_offline()

  out <- ons_house_prices(from = "2024-01-01")

  # UK average house prices should be between 100k and 500k
  expect_true(all(out$average_price_gbp > 100000))
  expect_true(all(out$average_price_gbp < 500000))
})

test_that("find_hpi_url_by_probe() finds a valid URL", {
  skip_on_cran()
  skip_if_offline()

  base_url <- paste0(
    "https://publicdata.landregistry.gov.uk/market-trend-data/",
    "house-price-index-data/Average-prices-"
  )
  url <- find_hpi_url_by_probe(base_url)

  expect_type(url, "character")
  expect_match(url, "Average-prices-\\d{4}-\\d{2}\\.csv$")
})

test_that("find_hpi_url_by_probe() fails gracefully with bad base URL", {
  skip_on_cran()
  skip_if_offline()

  expect_error(
    find_hpi_url_by_probe("https://publicdata.landregistry.gov.uk/nonexistent/file-"),
    "Could not find"
  )
})
