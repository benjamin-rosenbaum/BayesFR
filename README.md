# BayesFR package

## Fitting functional responses in R

Easy application of Bayesian inference for functional responses via 
[brms](https://paulbuerkner.com/brms/). 

This package allows to fit various FR models for single- and multi-prey 
experiments. It uses dynamical prediction models to correct for prey depletion. 
The brms framework facilitates statistical modelling and enables users to 
conveniently incorporate covariates such as temperature gradients, experimental 
treatment variables, or random effects that account for grouping in 
experimental units. Default brms functions make it easy to perform model 
checking, model comparisons and hypothesis testing. Potential statistical issues 
with data from feeding trials, such as overdispersion or zero inflation, can be 
resolved by effortlessly switching between likelihood functions.

The BayesFR package, together with its tutorials, should provide students and 
researchers with a comprehensive and integrated statistical framework for easily 
testing their hypotheses on trophic interactions.

## Installation

```r
library(devtools)
install_github("benjamin-rosenbaum/BayesFR")
```

## Tutorials

to do

- [Minimal example: data with prey replacement](https://benjamin-rosenbaum.github.io/BayesFR/Tutorial_01.html)
- Minimal example: data without prey replacement
- Model testing, model comparison, hypothesis testing: type 2 vs. type 3
- Continuous predictors
- Categorical predictors
- Random effects
- Likelihood functions and distributions
- Prior distributions
- Prey mortality and growth
- Multi-species functional responses
