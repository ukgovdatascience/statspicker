#' @title Easily cross-tabulate categorical data
#' @description
#' @details
#' @param df Target dataframe containing categorical data.
#' @return
#' @examples
#' @export

statspicker <- function(df) {

  message('Initiating statistics picker class.
\n\nExpects a data_frame containing population data')

  factor_cols <- names(df)[sapply(df, is.factor)]

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
    class = "statspicker")
}
