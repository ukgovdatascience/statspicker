#' @title Pick a subset from the stats_picker class
#' @description
#' @details
#' @param
#' @return
#' @examples
#' @export


pick <- function(x, var_levels) UseMethod('pick')

#' @describeIn stats_picker Output a given crosstab
#' @export

pick.stats_picker <- function(cls, var_levels) {

  # Which column contains the stated level?

  cols = data.frame()

  for (i in var_levels) {

  # Enquo was introduced in dplyr 0.7 to deal with lazy evaluation.

  j = dplyr::enquo(i)

  column = dplyr::filter(cls$levels_lookup, levels == (!! j))

  k = column$column

  # .data[[var]] allows quoting of vars (filter_ was deprecated
  # in dplyr 0.7.

  cols = dplyr::filter(cls$df, .data[[k]] == i)

  }

  return(cols)

}


