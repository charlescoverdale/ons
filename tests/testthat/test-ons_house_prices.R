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
