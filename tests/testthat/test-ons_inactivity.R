test_that("ons_inactivity() returns expected structure", {
  skip_on_cran()
  skip_if_offline()

  out <- ons_inactivity(from = "2024-01-01")

  expect_s3_class(out, "data.frame")
  expect_named(out, c("date", "value"))
  expect_s3_class(out$date, "Date")
  expect_type(out$value, "double")
  expect_true(nrow(out) > 0)
})
