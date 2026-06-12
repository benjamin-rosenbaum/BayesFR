#' Convert 2-prey data to long format
#'
#' brms requires univariate response values here. Transforms one row with
#' bivariate (NE1,NE2) to two rows with NE=NE1 and NE=NE2, respectively. Species
#' identity of focal prey is saved in column ID, initial abundance of focal prey
#' in column N0, and initial abundance of non-focal, alternative prey in column
#' N0.alt
#'
#' @param df data frame with at least these columns named: N01, N02, NE1, NE2
#'
#' @return The transformed data frame
#' @export
convert_2sp_to_long = function(df){
  df = tidyr::pivot_longer(df, tidyr::all_of(c("NE1", "NE2")), names_to="ID", values_to="NE")
  df$ID = as.integer(as.factor(df$ID))
  df$N0 = rep(NA, nrow(df))
  df$N0.alt = rep(NA, nrow(df))
  for(i in 1:nrow(df)){
    df$N0[i] = df[i, paste0("N0",df$ID[i])]
    df$N0.alt[i] = df[i, paste0("N0",3-df$ID[i])]
  }
  df$N0 = as.numeric(df$N0)
  df$N0.alt = as.numeric(df$N0.alt)
  df = df[df$N0>0, ]
  return(df)
}
