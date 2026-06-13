test_that("brm() fits Type3GenH model and predict() works", {
  # skip_on_cran()

  data(df_Sentis_et_al_2017_GLOBAL_CHANGE_BIOLOGY)
  df <- subset(df_Sentis_et_al_2017_GLOBAL_CHANGE_BIOLOGY, ID == "Figure 1e")

  FR.formula <- bf(
    NE | trials(N0) ~ Type3GenH_dyn(N0, 1.0, 1.0, b, h, q) / N0,
    b+h+q ~ 1,
    nl = TRUE
  )

  FR.priors <- c(
    prior(exponential(1.0), nlpar = "b", lb = 0),
    prior(exponential(1.0), nlpar = "h", lb = 0),
    prior(normal(0, 1),     nlpar = "q", lb = -1)
  )

  expect_no_error(
    fit <- brm(
      FR.formula,
      family   = binomial(link = "identity"),
      prior    = FR.priors,
      data     = df,
      chains   = 2,
      iter     = 500,
      warmup   = 250,
      stanvars = stanvar(scode = Type3GenH_dyn_code, block = "functions"),
      refresh  = 0,
      silent   = 2
    )
  )

  expect_s3_class(fit, "brmsfit")
#
  expose_functions(fit, vectorize = TRUE)

  preds <- predict(fit)
  expect_true(is.matrix(preds))
  expect_equal(nrow(preds), nrow(df))
  expect_equal(ncol(preds), 4)  # Estimate, Est.Error, Q2.5, Q97.5
})
