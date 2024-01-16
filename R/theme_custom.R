#' @title Tema personalizado com definições para utilizar em gráficos no R
#'
#' @description Tema do `ggplot2` que particularmente gosto de utilizar quando estou
#' construindo gráficos.
#'
#' @param ... Elementos do `ggplot2` que podem ser passados dentro da função
#' `ggplot2::theme()`
#'
#' @export

theme_fabr <- function(...) {

  `%+replace%` <- ggplot2::`%+replace%`

  ggplot2::theme_bw(...) %+replace%
    ggplot2::theme(
      plot.title = element_text(hjust = 0.5, face = "bold"),
      legend.title = element_text(hjust = 0.5),
      legend.text = element_text(colour = "black"),
      axis.text = element_text(colour = "black"),
      strip.text = element_text(color = "black"),
      panel.grid.major = element_blank(),
      strip.background = element_blank()
    )
}
