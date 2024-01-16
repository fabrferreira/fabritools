#' @title Função para realizar limpeza dos dados da `Web of Science`
#'
#' @description
#' A função que realiza a importação e limpeza dos dados da `Web of Science`
#' para realização de análises bibliométricas.
#'
#' @param path Caminho da pasta na qual os arquivos oriundas da Web of Science
#' estão localizados.
#' @param pattern Extensão do arquivo que será importado. Geralmente os arquivos
#' da `Web of Science` vêm na extensão `.xls` ou `.xlsx`, planilhas do Excel.
#' @param ... Relação de colunas que do arquivo da Web of Science que o usuário
#' deseja selecionar.
#'
#' @export

tidy_wb <- function(path, pattern, ...) {

  wb_files <- list.files(path = path,
                         full.names = TRUE,
                         pattern = glue::glue("\\w+", pattern)
                         )

  wb_data <- wb_files |>
    purrr::map(.x = _, .f = readxl::read_excel) |>
    purrr::map(.x = _, .f = janitor::clean_names) |>
    purrr::map(.x = _, .f = ~dplyr::select(.x, ...)) |>
    dplyr::bind_rows()

  return(wb_data)
}
