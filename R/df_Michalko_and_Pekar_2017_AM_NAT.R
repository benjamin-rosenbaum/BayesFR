#' Feeding experiments with prey replacement
#'
#' Feeding experiment data from Michalko and Pekar (2017) downloaded from the
#' FoRAGE database (Uiterwaal et al. 2022). Eaten prey were replaced during the
#' experiment. Includes three predator-prey combinations with a top predator
#' (Philodromus buchari), a mesopredator (Dictyna spp.) and a pest (C. pyri).
#'
#' @format A data frame with 63 rows and 6 variables:
#' \describe{
#'   \item{N0}{Number of constant prey}
#'   \item{NE}{Number of eaten prey}
#'   \item{Time}{Duration (h)}
#'   \item{Predator}{Predator species}
#'   \item{Prey}{Prey species}
#'   \item{ID}{Predator-prey combination}
#' }
#'
#' @source
#'   Michalko R. and Pekar S. (2017).
#'   *The Behavioral Type of a Top Predator Drives the Short-Term Dynamic of Intraguild Predation.*
#'   American Naturalist, 189, 242-253.
#'   https://doi.org/10.1086/690501
#'
#'   Uiterwaal, S. F., Lagerstrom I. T., Lyon S. R., and DeLong, John P. (2022),
#'   *FoRAGE Database: A Compilation of Functional Responses for Consumers and Parasitoids.*
#'   Ecology 103(7): e3706.
#'   https://doi.org/10.1002/ecy.3706
#'
#'   FoRAGE database V5 (2024).
#'   https://doi.org/10.5063/F1RX99KB
#'
#' @usage data(df_Michalko_and_Pekar_2017_AM_NAT)
#'
#' @examples
#' data(df_Michalko_and_Pekar_2017_AM_NAT)
#' head(df_Michalko_and_Pekar_2017_AM_NAT)
"df_Michalko_and_Pekar_2017_AM_NAT"
