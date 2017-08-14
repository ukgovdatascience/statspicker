#' @title Pick a subset from the stats_picker class
#' @description
#' @details
#' @param cls Object of the statspicker class.
#' @param var_levels List or vector containing quoted factor levels on which to
#'   subset the data.
#' @return
#' @examples
#' @export


pick <- function(cls, var_levels) UseMethod('pick')

#' @describeIn statspicker Output a given crosstab
#' @export

pick.statspicker <- function(cls, var_levels) {

  df = cls$df

  # Identify columns for which we have been passes levels

  columns_to_subset_by <- cls$levels_lookup[cls$levels_lookup$levels %in% var_levels, 'column']
  columns_to_subset_by <- unique(columns_to_subset_by)

  # Iterate through these columns, and use the levels that are present in those
  # columns to subset

  for (i in columns_to_subset_by) {

    mask <- cls$levels_lookup$column == i & cls$levels_lookup$levels %in% var_levels

    levels_to_subset_by <- cls$levels_lookup[mask, 'levels']

  # Enquo was introduced in dplyr 0.7 to deal with lazy evaluation.l

  j = dplyr::enquo(i)

  column = dplyr::filter(cls$levels_lookup, levels == (!! j))

  # .data[[var]] allows quoting of vars (filter_ was deprecated
  # in dplyr 0.7.

  df <- dplyr::filter(df, .data[[i]] %in% levels_to_subset_by)

  }

  return(df)

}


