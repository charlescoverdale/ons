test_that("ons_get() returns expected structure", {
  skip_on_cran()
  skip_if_offline()

  out <- ons_get("IHYQ", from = "2024-01-01")

  expect_s3_class(out, "data.frame")
  expect_named(out, c("date", "cdid", "value"))
  expect_s3_class(out$date, "Date")
  expect_equal(unique(out$cdid), "IHYQ")
  expect_type(out$value, "double")
  expect_true(nrow(out) > 0)
})

test_that("ons_get() handles multiple CDIDs", {
  skip_on_cran()
  skip_if_offline()

  out <- ons_get(c("IHYQ", "D7G7"), from = "2024-01-01")
  expect_true(all(c("IHYQ", "D7G7") %in% out$cdid))
})

test_that("ons_get() rejects non-character input", {
  expect_error(ons_get(123))
})

test_that("ons_get() rejects empty input", {
  expect_error(ons_get(character(0)))
})
