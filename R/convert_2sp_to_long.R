#' Convert 2-prey data to long format
#'
#' @param df data frame with first four columns named: N01, N02, NE1, NE2
#'
#' @return The transformed data frame
#' @export
convert_2sp_to_long = function(df){
  df = tidyr::pivot_longer(df, NE1:NE2, names_to="ID", values_to="NE")
  df$ID = as.integer(as.factor(df$ID))
  df$N0 = rep(NA, nrow(df))
  for(i in 1:nrow(df)){
    df$N0[i] = df[i, df$ID[i]]
  }
  df$N0 = as.numeric(df$N0)
  df = subset(df, N0>0)
  return(df)
}
