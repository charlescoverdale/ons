
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

test_that("ons_request sets connect and stall timeouts", {
  req <- ons_request("https://www.ons.gov.uk/generator?format=csv")
  expect_equal(req$options$connecttimeout, 20L)
  expect_equal(req$options$low_speed_limit, 1L)
  expect_equal(req$options$low_speed_time, 60L)
  expect_null(req$options$timeout_ms)
  expect_match(req$options$useragent, "ons R package")
})

test_that("ons.timeout adds a hard cap and is validated", {
  op <- options(ons.timeout = 90)
  on.exit(options(op), add = TRUE)
  req <- ons_request("https://www.ons.gov.uk/generator?format=csv")
  expect_equal(req$options$timeout_ms, 90000)

  options(ons.timeout = "soon")
  expect_error(ons_request("https://example.org"), "ons.timeout")
})

test_that("a stalled transfer surfaces as the informative connection error", {
  op <- options(ons.cache_dir = tempfile("ons-cache-"))
  on.exit(options(op), add = TRUE)
  httr2::local_mocked_responses(function(req) {
    stop("Timeout was reached [www.ons.gov.uk]: Operation too slow")
  })
  expect_error(
    download_cached_ons("https://www.ons.gov.uk/generator?format=csv", cache = FALSE),
    "Failed to connect to ONS"
  )
})
