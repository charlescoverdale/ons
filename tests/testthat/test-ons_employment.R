test_that("ons_employment() returns expected structure", {
  skip_on_cran()
  skip_if_offline()

  out <- ons_employment(from = "2024-01-01")

  expect_s3_class(out, "data.frame")
  expect_named(out, c("date", "value"))
  expect_s3_class(out$date, "Date")
  expect_type(out$value, "double")
  expect_true(nrow(out) > 0)
})

test_that("ons_employment() group parameter works", {
  skip_on_cran()
  skip_if_offline()

  out <- ons_employment(group = "female", from = "2024-01-01")
  expect_true(nrow(out) > 0)
})

test_that("ons_employment() rejects invalid group", {
  expect_error(ons_employment(group = "invalid"))
})
