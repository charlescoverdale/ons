test_that("ons_productivity() returns expected structure", {
  skip_on_cran()
  skip_if_offline()

  out <- ons_productivity(from = "2020-01-01")

  expect_s3_class(out, "data.frame")
  expect_named(out, c("date", "value"))
  expect_s3_class(out$date, "Date")
  expect_type(out$value, "double")
  expect_true(nrow(out) > 0)
})

test_that("ons_productivity() per_worker measure works", {
  skip_on_cran()
  skip_if_offline()

  out <- ons_productivity(measure = "per_worker", from = "2020-01-01")
  expect_true(nrow(out) > 0)
})

test_that("ons_productivity() rejects invalid measure", {
  expect_error(ons_productivity(measure = "invalid"))
})
