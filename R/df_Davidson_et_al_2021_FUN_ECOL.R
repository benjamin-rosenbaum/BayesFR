#' Example dataset for continuous predictors
#'
#' Feeding experiment data from Davidson et al. (2021) were downloaded from
#' Dryad (Davidson et al. 2020). Eaten prey were not replaced during the
#' experiment. Includes data for two dragonfly nymph species (Pachydiplax and Erythemis)
#' feeding on mosquito larvae. Experiments were performed on a temperature gradient,
#' and predator size was measured, too.
#'
#' @format A data frame with 91 rows and 7 variables:
#' \describe{
#'   \item{N0}{Number of initial prey}
#'   \item{NE}{Number of eaten prey}
#'   \item{Time}{Duration (h)}
#'   \item{Predator}{Predator species}
#'   \item{Prey}{Prey species}
#'   \item{Temperature}{Experimental temperature}
#'   \item{HeadWidth}{Predator size}
#' }
#'
#' @source
#'   Davidson A. T., Hamman, E. A., McCoy M. W., and Vonesh J. R. (2021).
#'   *Asymmetrical effects of temperature on stage-structured predator–prey interactions.*
#'   Functional Ecology 35: 1041–1054.
#'   https://doi.org/10.1111/1365-2435.13777
#'
#'   Davidson A. T., Hamman, E. A., McCoy M. W., and Vonesh J. R. (2020).
#'   *Asymmetrical effects of temperature on stage-structured predator–prey interactions.*
#'   Dryad Digital Repository.
#'   https://doi.org/10.5061/dryad.j6q573nd4
#'
#' @usage data(df_Davidson_et_al_2021_FUN_ECOL)
#'
#' @examples
#' data(df_Davidson_et_al_2021_FUN_ECOL)
#' head(df_Davidson_et_al_2021_FUN_ECOL)
"df_Davidson_et_al_2021_FUN_ECOL"
