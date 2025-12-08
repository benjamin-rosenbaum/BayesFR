# BayesFR package

```r
# Example code for fitting a Type 3 FR dynamical model:
FR.formula = bf( NE | trials(N0) ~ Type3H_dyn(N0,P0,Time,b,h)/N0,
                 b~1, h~1, nl = TRUE)
FR.priors  = c(prior(exponential(1.0), nlpar="b", lb=0),
               prior(exponential(1.0), nlpar="h", lb=0) )
fit.1      = brm(FR.formula,
                 family   = binomial(link="identity"),
                 prior    = FR.priors,
                 stanvars = stanvar(scode=Type3H_dyn_code, block="functions"),
                 data     = df )
```

## Fitting functional responses in 1- and 2-prey systems

Easy application of Bayesian inference for functional responses via 
[brms](https://paulbuerkner.com/brms/). 

This package allows to fit various FR models for single- and multi-prey 
experiments. It uses dynamical prediction models to correct for prey depletion. 
The brms framework facilitates statistical modelling and enables users to 
conveniently incorporate covariates such as temperature gradients, experimental 
treatment variables, or random effects that account for grouping in 
experimental units. Default brms functions make it easy to perform model 
checking, model comparison and hypothesis testing. Potential statistical issues 
with data from feeding trials, such as overdispersion or zero inflation, can be 
resolved by effortlessly switching between likelihood functions.

The BayesFR package, together with its tutorials, provides students and 
researchers with a comprehensive and integrated statistical framework for easily 
testing their hypotheses on trophic interactions.

For an introduction to [brms](https://paulbuerkner.com/brms/), see for example 
[here](https://github.com/benjamin-rosenbaum/bayesian-intro). 


## Installation

```r
library(remotes)
install_github("benjamin-rosenbaum/BayesFR")
```

## Tutorials

- [Minimal example: data with prey replacement](https://benjamin-rosenbaum.github.io/BayesFR/Tutorial_01.html)
- [Minimal example: data without prey replacement](https://benjamin-rosenbaum.github.io/BayesFR/Tutorial_02.html)
- [Model testing, model comparison, hypothesis testing: type 2 vs. type 3](https://benjamin-rosenbaum.github.io/BayesFR/Tutorial_03.html)
- [Categorical predictors: predator and prey size classes](https://benjamin-rosenbaum.github.io/BayesFR/Tutorial_04.html)
- [Continuous predictors: size and temperature gradients](https://benjamin-rosenbaum.github.io/BayesFR/Tutorial_05.html)
- Random effects
- Prey mortality
- Likelihood functions and distributions
- Prior distributions
- Multi-species functional responses

## References

While a publication is in progress, please cite Rosenbaum & Rall (2018) for single-prey 
systems, or Rosenbaum et al. (2024) for multi-prey systems. The FoRAGE database 
(Uiterwaal et al. 2022) was searched for suitable example datasets, and data was 
downloaded from original sources when available.

Rosenbaum B. & Rall B. C. (2018). *Fitting functional responses: Direct parameter 
estimation by simulating differential equations.* Methods in Ecology and Evolution, 
9(10), 2076–2090. [https://doi.org/10.1111/2041-210X.13039](https://doi.org/10.1111/2041-210X.13039)

Rosenbaum B., Li J., Hirt M. R., Ryser R. & Brose, U. (2024). *Towards understanding 
interactions in a complex world: Design and analysis of multi‐species functional 
response experiments.* Methods in Ecology and Evolution, 15(9), 1704–1719. 
[https://doi.org/10.1111/2041-210x.14372](https://doi.org/10.1111/2041-210x.14372)

Uiterwaal S. F., Lagerstrom I. T., Lyon S. R. & DeLong J. P. (2022). *FoRAGE 
Database: A Compilation of Functional Responses for Consumers and Parasitoids.* 
Ecology 103(7): e3706. [https://doi.org/10.1002/ecy.3706](https://doi.org/10.1002/ecy.3706)

