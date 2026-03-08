test_that("ons_cpi() returns expected structure", {
  skip_on_cran()
  skip_if_offline()

  out <- ons_cpi(from = "2024-01-01")

  expect_s3_class(out, "data.frame")
  expect_named(out, c("date", "value"))
  expect_s3_class(out$date, "Date")
  expect_type(out$value, "double")
  expect_true(nrow(out) > 0)
})

test_that("ons_cpi() cpih measure works", {
  skip_on_cran()
  skip_if_offline()

  out <- ons_cpi(measure = "cpih", from = "2024-01-01")
  expect_true(nrow(out) > 0)
})

test_that("ons_cpi() index type works", {
  skip_on_cran()
  skip_if_offline()

  out <- ons_cpi(type = "index", from = "2024-01-01")
  expect_true(nrow(out) > 0)
  expect_true(all(out$value > 0))
})

test_that("ons_cpi() rejects invalid measure", {
  expect_error(ons_cpi(measure = "invalid"))
})
