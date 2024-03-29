#' @title mod_dl
#'
#' @description  A shiny Module.
#'
#' @name dl
#' @example inst/extdata/examples/test_dl.R
#'
NULL


#' @param id xxx
#'
#' @rdname dl
#'
#' @export
#'
dl_ui <- function(id) {
  ns <- NS(id)
  tagList(
    shinyjs::useShinyjs(),
    uiOutput(ns('dl_xl')),
    uiOutput(ns('dl_csv')),
    uiOutput(ns('dl_raw'))
  )
}

#' @rdname dl
#' 
#' @param id internal
#' @param dataIn internal
#' @param extension Available values are `csv` (default), `RData` and `Excel`.
#' @param widget.type Available values are `Button` and `Link` (default).
#' @param name internal
#' @param excel.style xxx
#'
#' @return NA
#'
#' @export
#'
dl_server <- function(id,
                      dataIn = reactive({NULL}),
                      extension = 'csv',
                      widget.type = 'Link',
                      name = 'foo', 
                      excel.style = NULL) {
  moduleServer(
    id, function(input, output, session) {
      ns <- session$ns
      
      rv <- reactiveValues(
        UI_type = NULL
      )
      
      GetType <- reactive({
        if(length(extension) != length(widget.type)){
          warning("Widget.type is not correctly configured. As one cannot decide, 
            all values are set to default ('Link')")
          rv$UI_type <- rep('Link', length(extension))
        } else {
          rv$UI_type <- widget.type
        }
        
        rv$UI_type
      })
      
      output$dl_csv <- renderUI({
        req('csv' %in% extension)
        type <- GetType()[which(extension == 'csv')]
        do.call(paste0('download', type),
                list(
                  ns("downloadDatacsv"), 
                  "csv",
                  class = if (type=='Button') GlobalSettings$actionBtnClass else ''
                )
        )
      })
      
      
      output$dl_xl <- renderUI({
        req('xlsx' %in% extension)
        type <- GetType()[which(extension == 'xlsx')]
        do.call(paste0('download', type),
                list(
                  ns("downloadDataExcel"), 
                  "xlsx",
                  class = if (type=='Button') GlobalSettings$actionBtnClass else ''
                )
        )
      })
      
      output$dl_raw <- renderUI({
        req('RData' %in% extension)
        type <- GetType()[which(extension == 'RData')]
        do.call(paste0('download', type),
                list(
                  ns("downloadDataRData"), 
                  "RData",
                  class = if (type=='Button') GlobalSettings$actionBtnClass else ''
                )
        )
      })
      
      output$downloadDatacsv <- downloadHandler(
        filename = function() {
          paste(name, "-", Sys.Date(), ".csv", sep = "")
        },
        content = function(fname) {
          utils::write.table(dataIn(), fname, sep = ";", row.names = FALSE)
        }
      )
      
      output$downloadDataRData <- downloadHandler(
        filename = function() {
          paste ("data-", Sys.Date(), ".RData", sep = "")
        },
        content = function(fname) {
          saveRDS(dataIn(), file=fname)
        }
      )
      
      output$downloadDataExcel <- downloadHandler(
        filename = function() {
          paste(name, "-", Sys.Date(), ".xlsx", sep = "")
        },
        content = function(fname) {
          write.excel(df = dataIn(), style = excel.style, filename = fname)
        }
      )
    }
  )
}





ui <- dl_ui("dl")

    server <- function(input, output, session) {
        data(Exp1_R25_prot, package='DaparToolshedData')
      
      dl_server("dl",
            dataIn = reactive({Exp1_R25_prot}),
            extension = c('csv', 'xlsx', 'RData')
        )
    }

    shinyApp(ui = ui, server = server)