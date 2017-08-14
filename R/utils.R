#' @title Extract levels from categorical columns
#' @description
#' @details
#' @param
#' @return
#' @examples
#' @export


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

