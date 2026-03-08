test_that("ons_search() returns expected structure", {
  skip_on_cran()
  skip_if_offline()

  out <- ons_search("GDP growth", limit = 5)

  expect_s3_class(out, "data.frame")
  expect_named(out, c("cdid", "dataset_id", "title", "release_date"))
  expect_true(nrow(out) > 0)
})

test_that("ons_search() rejects empty query", {
  expect_error(ons_search(""))
})

test_that("ons_search() rejects non-string query", {
  expect_error(ons_search(123))
})
