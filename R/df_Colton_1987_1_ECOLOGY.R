#' Example dataset for multi-species FR with 2 prey
#'
#' Feeding experiment data from Colton (1987) were downloaded from
#' Figshare (Novak & Stouffer 2020). Eaten prey were not replaced during the
#' experiment. Includes data for 10th???instar naiads of a damselfly feeding on a
#' cladoceran (Simocephalus serrulatus, species 1) and a copepod (Diaptomus
#' spatulocrenatus, species 2).
#'
#' A single typo (720) was corrected (120).
#'
#' @format A data frame with 108 rows and 6 variables:
#' \describe{
#'   \item{N01}{Number of initial prey, species 1}
#'   \item{N02}{Number of initial prey, species 2}
#'   \item{NE1}{Number of eaten prey, species 1}
#'   \item{NE2}{Number of eaten prey, species 2}
#'   \item{P0}{Number of predators (1)}
#'   \item{Time}{Duration (h)}
#' }
#'
#' @source
#'   Colton, T.F. (1987).
#'   Extending functional response models to include a second prey type: an experimental test.
#'   *Ecology*, 68: 900-912.
#'   https://doi.org/10.2307/1938361
#'
#'   Novak, M., & Stouffer, D. (2020).
#'   Data extracted for "Hidden layers of density dependence in consumer feeding rates."
#'   *Figshare*.
#'   https://doi.org/10.6084/m9.figshare.12830792
#'
#'
#' @usage data(df_Colton_1987_1_ECOLOGY)
#'
#' @examples
#' data(df_Colton_1987_1_ECOLOGY)
#' head(df_Colton_1987_1_ECOLOGY)
"df_Colton_1987_1_ECOLOGY"
