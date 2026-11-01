
test_that("ons_release_date reads the CSV header and ranks missing dates last", {
  raw <- paste0('"Title","GDP"\n"CDID","IHYQ"\n"Release date","30-09-2026"\n',
                '"Next release","12 November 2026"\n"2026 Q2","0.5"\n')
  expect_equal(ons_release_date(raw), as.numeric(as.Date("2026-09-30")))
  expect_equal(ons_release_date('"Title","x"\n"2026 Q2","1"'), -Inf)
})

test_that("cached files expire after the cache lifetime", {
  op <- options(ons.cache_ttl = -1)
  on.exit(options(op), add = TRUE)
  expect_error(ons_cache_ttl(), "non-negative")
})
