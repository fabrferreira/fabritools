#' @title Função para realizar limpeza dos dados do `Scopus`
#'
#' @description
#' A função que realiza a importação e limpeza dos dados do `Scopus`
#' para realização de análises bibliométricas.
#'
#' @param path Caminho da pasta na qual os arquivos oriundas do Scopus estão
#' localizados.
#' @param pattern Extensão do arquivo que será importado. Geralmente os arquivos
#' da `Scopus` vêm na extensão `.csv` (comma separated value).
#' @param ... Relação de colunas que do arquivo do Scopus que o usuário deseja
#' selecionar.
#'
#' @export

tidy_scopus <- function(path, pattern, ...) {

  scopus_files <- list.files(path = path,
                             full.names = TRUE,
                             pattern = glue::glue("\\w+", pattern)
                             )

  scopus_data <- scopus_files |>
    purrr::map(.x = _, .f = readr::read_csv) |>
    purrr::map(.x = _, .f = janitor::clean_names) |>
    purrr::map(.x = _, .f = ~dplyr::select(.x, ...)) |>
    dplyr::bind_rows()

  return(scopus_data)
}


#
