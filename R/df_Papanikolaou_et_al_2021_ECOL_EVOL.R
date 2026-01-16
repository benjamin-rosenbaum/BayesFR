#' Example dataset for testing predator interference models
#'
#' Feeding experiment data from Papanikolaou et al. (2021a) downloaded from Dryad
#' (Papanikolaou et al. 2021b). Eaten prey were not replaced during the
#' experiment. Includes data for two mirid predators (1st and 5th instar nymphs)
#' feeding on Pyralidae eggs. Includes four predator treatments with 1,2,3 or 4
#' predators, each.
#'
#' @format A data frame with 327 rows and 7 variables:
#' \describe{
#'   \item{N0}{Number of initial prey}
#'   \item{NE}{Number of eaten prey}
#'   \item{P0}{Number of predator individuals}
#'   \item{Time}{Duration (h)}
#'   \item{Predator}{Predator species}
#'   \item{Prey}{Prey species}
#'   \item{ID}{1st or 5th instar nymphs}
#' }
#'
#' @source
#'   Papanikolaou N.E., Dervisoglou S., Fantinou A., Kypraios T., Giakoumaki V.,
#'   Perdikis D. (2021a).
#'   *Predator size affects the intensity of mutual interference in a predatory mirid.*
#'   Ecology and Evolution 2021(11): 1342–1351.
#'   https://doi.org/10.1002/ece3.7137
#'
#'   Papanikolaou N.E., Dervisoglou S., Fantinou A., Kypraios T., Giakoumaki V.,
#'   Perdikis D. (2021b).
#'   *Data from: Predator size affects the intensity of mutual interference in a predatory mirid.*
#'   Dryad
#'   https://doi.org/10.5061/dryad.2ngf1vhmj
#'
#' @usage data(df_Papanikolaou_et_al_2021_ECOL_EVOL)
#'
#' @examples
#' data(df_Papanikolaou_et_al_2021_ECOL_EVOL)
#' head(df_Papanikolaou_et_al_2021_ECOL_EVOL)
"df_Papanikolaou_et_al_2021_ECOL_EVOL"
