#' @title Extract levels from categorical columns
#' @description
#' @details
#' @param
#' @return
#' @examples
#' @export


list_cats = function(df) {

  col_types = unlist(sapply(df, class))
  factor_cols = col_types[col_types == "factor"]
  factor_cols = names(factor_cols)
  #gsub("\\d", "", names(factor_cols))
  return(factor_cols)

}

levels_df = function(df, factor_col) {

  col_levels = unname(unique(df[factor_col]))

  out = data.frame(
    column = factor_col,
    levels = col_levels
  )

  # Convert columns to character to squash character coercion warning

  out$column = as.character(out$column)
  out$levels = as.character(out$levels)

  return(out)

}

