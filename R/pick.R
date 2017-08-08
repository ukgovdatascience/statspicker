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


pick <- function(x, var_levels) UseMethod('pick')

#' @describeIn stats_picker Output a given crosstab
#' @export

pick.stats_picker <- function(x, var_levels) {

  # Which column contains the stated level?

  cols = data.frame()

  for (i in var_levels) {

  # Enquo was introduced in dplyr 0.7 to deal with lazy evaluation.

  j = enquo(i)

  column = x$levels_lookup %>% filter(levels == (!! j))

  #print(paste(column$column, " == ", i))
  #cols = x$df %>% filter_(column$column == i)

  cols = bind_rows(cols, column)

  }

  return(cols)

}


