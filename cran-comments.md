## R CMD check results

0 errors | 0 warnings | 0 notes

## Test environments
- Local Ubuntu 24.04, R 4.6.0
- win-builder (R-devel)
- rhub (linux, windows, macos)

## Notes
- Tests that call brm() are skipped on CRAN via skip_on_cran() 
  as they require Stan which is not available on CRAN servers.
- Vignette chunks that call brm() use eval=FALSE for the same reason.

## Spell check notes
- 'BayesFR' is the package name
- 'brms' is a well-known R package on CRAN
- 'trophic' is standard ecological terminology

