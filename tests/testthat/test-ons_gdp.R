test_that("ons_gdp() returns expected structure", {
  skip_on_cran()
  skip_if_offline()

  out <- ons_gdp(from = "2024-01-01")

  expect_s3_class(out, "data.frame")
  expect_named(out, c("date", "value"))
  expect_s3_class(out$date, "Date")
  expect_type(out$value, "double")
  expect_true(nrow(out) > 0)
})

test_that("ons_gdp() level measure works", {
  skip_on_cran()
  skip_if_offline()

  out <- ons_gdp(measure = "level", from = "2024-01-01")
  expect_true(nrow(out) > 0)
  expect_true(all(out$value > 0))
})

test_that("ons_gdp() rejects invalid measure", {
  expect_error(ons_gdp(measure = "invalid"))
})

test_that("ons_gdp yoy is quarterly and uses the most recent release", {
  skip_on_cran()
  skip_if_offline()
  yoy <- ons_gdp(measure = "yoy", from = "2024-01-01")
  # IHYP, used before 0.1.5, is annual and returned one row a year.
  expect_true(all(format(yoy$date, "%m") %in% c("01", "04", "07", "10")))
  expect_gte(nrow(yoy), 8L)
})
