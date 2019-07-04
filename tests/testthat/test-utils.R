
context("utils")

test_that("merge_new", {
  expect_identical(merge_new("x", "y"), "y")
  expect_identical(merge_new("x", "y", "replace"), "y")
  expect_identical(merge_new("x", "y", "prepend"), c("y", "x"))
  expect_identical(merge_new("x", "y", "append"), c("x", "y"))
  expect_error(merge_new("x", "y", "foobar"))

  ## Some special values
  expect_identical(merge_new("x", NULL), NULL)
  expect_identical(merge_new(NULL, "x"), "x")
  expect_identical(merge_new("x", NULL, "append"), "x")
  expect_identical(merge_new(NULL, "x", "append"), "x")
  expect_identical(merge_new("x", NULL, "prepend"), "x")
  expect_identical(merge_new(NULL, "x", "prepend"), "x")
})

test_that("qualify_package_names", {
  cx <- list(
    list(character(), character()),
    list("aa", "default::aa"),
    list("a1", "default::a1"),
    list(c("aa", "bb", "a1"), c("default::aa", "default::bb", "default::a1")),
    list("foo/bar", "foo/bar"),
    list(c("aa", "foo/bar", "a1"), c("default::aa", "foo/bar", "default::a1")),
    list(c("aa", "bb", "foo/bar"), c("default::aa", "default::bb", "foo/bar")),
    list(c("local::aa", "bb", "a1"), c("local::aa", "default::bb", "default::a1")))

  for (x in cx) {
    expect_identical(qualify_package_names(x[[1]]), x[[2]], info = x)
  }
})
