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


stats_picker <- function(df) {

  message('Initiating statistics picker class.
\n\nExpects a data_frame containing population data')

  factor_cols <- list_cats(df)
  # Generate a dataframe containing all the factor levels in each of the rows
  # This should be tested and go into utils.R

  levels_lookup <- purrr::map_df(factor_cols, function(x) levels_df(df, x))

  # Define the class here ----

  structure(
    list(
      df = df,
      factor_cols = factor_cols,
      levels_lookup = levels_lookup
    ),
    class = "stats_picker")
}
