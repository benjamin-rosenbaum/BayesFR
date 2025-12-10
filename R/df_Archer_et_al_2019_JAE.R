#' Example dataset for prey mortality
#'
#' Feeding experiment data from Archer et al. (2019a) were downloaded from
#' Dryad (Archer et al. 2019b). Eaten prey were not replaced during the
#' experiment. Includes data for housefly larvae (Limnophora riparia) and
#' caddisfly larva (Potamophylax cingulatus) feeding on blackfly larvae (Simuliidae).
#' Due to prey background mortality, control experiments without predators were
#' performed, too. Includes a temperature gradient and data from 2 settings (lab/field)
#' and from 2 years.
#'
#' @format A data frame with 580 rows and 9 variables:
#' \describe{
#'   \item{N0}{Number of initial prey}
#'   \item{NE}{Number of eaten prey}
#'   \item{P0}{Number of predators (0 or 1)}
#'   \item{Time}{Duration (h)}
#'   \item{Predator}{Predator species or control}
#'   \item{Prey}{Prey species}
#'   \item{Temperature}{Experimental temperature}
#'   \item{Setting}{laboratory or field}
#'   \item{Year}{2013 or 2015}
#' }
#'
#' @source
#'   Archer L. C., Sohlström E. H., Gallo B., Jochum M., Woodward G., Kordas R. L., Rall B. C. & O'Gorman E. J. (2019a).
#'   *Consistent temperature dependence of functional response parameters and their use in predicting population abundance.*
#'   Journal of Animal Ecology, 88:1670–1683.
#'   https://doi.org/10.1111/1365-2656.13060
#'
#'   Archer L. C., Sohlström E. H., Gallo B., Jochum M., Woodward G., Kordas R. L., Rall B. C. & O'Gorman E. J. (2019b).
#'   *Consistent temperature dependence of functional response parameters and their use in predicting population abundance.*
#'   Dryad Digital Repository.
#'   https://doi.org/10.5061/dryad.tr4v447
#'
#' @usage data(df_Archer_et_al_2019_JAE)
#'
#' @examples
#' data(df_Archer_et_al_2019_JAE)
#' head(df_Archer_et_al_2019_JAE)
"df_Archer_et_al_2019_JAE"
