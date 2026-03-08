test_that("ons_trade() returns expected structure", {
  skip_on_cran()
  skip_if_offline()

  out <- ons_trade(from = "2024-01-01")

  expect_s3_class(out, "data.frame")
  expect_named(out, c("date", "value"))
  expect_s3_class(out$date, "Date")
  expect_type(out$value, "double")
  expect_true(nrow(out) > 0)
})

test_that("ons_trade() exports measure works", {
  skip_on_cran()
  skip_if_offline()

  out <- ons_trade(measure = "exports", from = "2024-01-01")
  expect_true(nrow(out) > 0)
  expect_true(all(out$value > 0))
})

test_that("ons_trade() rejects invalid measure", {
  expect_error(ons_trade(measure = "invalid"))
})
