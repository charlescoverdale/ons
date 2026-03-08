test_that("ons_retail_sales() returns expected structure", {
  skip_on_cran()
  skip_if_offline()

  out <- ons_retail_sales(from = "2024-01-01")

  expect_s3_class(out, "data.frame")
  expect_named(out, c("date", "value"))
  expect_s3_class(out$date, "Date")
  expect_type(out$value, "double")
  expect_true(nrow(out) > 0)
})

test_that("ons_retail_sales() rejects invalid type", {
  expect_error(ons_retail_sales(type = "invalid"))
})
