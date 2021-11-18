#' Produce a scatter plot
#'
#' This function produces a scatter plot with a linear regression based on two numeric variables
#'
#' @param data Dataframe containing the variables you would like to produce a graph for. I named this parameter data as it relates to the name dataframe which is what it uses. This allowed for the function to be more simple and readable.
#' @param x Variable you would like to apply on the x-axis. I named this parameter x as it is responsible for the values on the x-axis. This allowed for the function to be more straightforward and understandable.
#' @param y Variable you would like to apply on the y-axis. I named this parameter y as it is responsible for the values on the y-axis. This allowed for the function to be more straightforward and understandable.
#'
#' @return This function returns a scatter plot with a linear regression line as a result of utilizing ggplot2.
#'
#' @details The graph that is produced by this function places the x parameter on the x-axis, and the y parameter on the y-axis. These variables are determined based on the dataframe that is defined as the data parameter. The graph that is produced will contain an alpha transparency of 0.3, and a linear regression line will also be placed on the graph. The limits of the graph will be expended to an origin of (0,0), and a classic theme has been applied.
#'
#' @examples
#' scatter_graph(mtcars, mpg, hp)
#' scatter_graph(palmerpenguins::penguins, bill_length_mm, flipper_length_mm)
#' scatter_graph(palmerpenguins::penguins, body_mass_g, flipper_length_mm)
#'
#' @importFrom dplyr summarise
#' @importFrom ggplot2 ggplot aes geom_point expand_limits stat_smooth theme_classic
#'
#' @export
scatter_graph <-function(data,x,y) {
  calculations <- summarise(data,
                            is_numeric_x = is.numeric({{x}}),
                            class_x = class({{x}}),
                            is_numeric_y = is.numeric({{y}}),
                            class_y = class({{y}}))
  if(!(calculations$is_numeric_x && calculations$is_numeric_y)) {
    stop('I am so sorry, but this function only works for numeric input!\n',
         'The variables you have provided are of an object of the following classes: ',
         ' x = ', calculations$class_x,
         ', y = ' ,calculations$class_y)
  }

  graph <- data %>%
    ggplot(aes(x = {{ x }}, y = {{ y }})) +
    geom_point(alpha = 0.3) +
    expand_limits(x = 0, y = 0) +
    stat_smooth(method = 'lm', colour = "red", se = FALSE, fullrange=TRUE) +
    theme_classic()
  return(graph)
}
