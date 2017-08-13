#' @title Pick a subset from the stats_picker class
#' @description
#' @details
#' @param
#' @return
#' @examples
#' @export


pick <- function(cls, var_levels) UseMethod('pick')

#' @describeIn stats_picker Output a given crosstab
#' @export

pick.stats_picker <- function(cls, var_levels) {

  # Which column contains the stated level?

  df = cls$df

  for (i in var_levels) {

  # Enquo was introduced in dplyr 0.7 to deal with lazy evaluation.l

  j = dplyr::enquo(i)

  column = dplyr::filter(cls$levels_lookup, levels == (!! j))

  k = column$column

  # .data[[var]] allows quoting of vars (filter_ was deprecated
  # in dplyr 0.7.

  df <- dplyr::filter(df, .data[[k]] == i)

  }

  return(df)

}


