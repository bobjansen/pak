
# dev version

* `pkg_install()` now assumes that simple package names refer to standard
  (CRAN or Bioconductor) packages. I.e. `pkg_install("pak")` is quivalent to
  `pkg_install("cran::pak")` and `pkg_install("Biobase")` is equivalent to
  `pkg_install("bioc::Biobase")`.

# pak 0.1.2

First version on CRAN.
