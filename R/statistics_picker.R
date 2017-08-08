#' @title Statistics picker
#'
#' @description
#'
#' @details
#'
#' @param
#'
#' @return
#'
#' @examples
#'
#' @export


stats_picker <- function(x) {

  message('Initiating statistics picker class.
\n\nExpects a data_frame containing population data')

  # List categorical variables and sanitise names

  col_types = unlist(sapply(x, class))
  factor_cols = col_types[col_types == "factor"]
  factor_cols = gsub("\\d", "", names(factor_cols))

  # Generate a dataframe containing all the factor levels in each of the rows
  # This should be tested and go into utils.R

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

  levels_lookup = purrr::map_df(factor_cols, function(x) levels_df(Arthritis, x))

  # Define the class here ----

  structure(
    list(
      df = x,
      factor_cols = factor_cols,
      levels_lookup = levels_lookup
    ),
    class = "stats_picker")
}



pick <- function(x, var_levels) UseMethod('pick')

#' @describeIn year_sector_table Create wide table from year_sector_data() class
#' @export

pick.stats_picker <- function(x, var_levels) {

  # Enquo was introduced in dplyr 0.7 to deal with lazy evaluation.
  # Which column contains the stated level?

  cols = data.frame()

  for (i in var_levels) {

  i = enquo(i)

  column = x$levels_lookup %>%
    filter(
      levels == (!! i)
      )

  cols = bind_rows(cols, column)

  }

  return(cols)

}


