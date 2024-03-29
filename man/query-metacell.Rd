% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mod_query_metacell.R
\name{query-metacell}
\alias{query-metacell}
\alias{mod_query_metacell_ui}
\alias{mod_query_metacell_server}
\title{xxxx}
\usage{
mod_query_metacell_ui(id)

mod_query_metacell_server(
  id,
  obj = reactive({
     NULL
 }),
  filters = reactive({
     NULL
 }),
  val_vs_percent = reactive({
     NULL
 }),
  operator = reactive({
     NULL
 }),
  reset = reactive({
     NULL
 }),
  op_names = reactive({
     NULL
 })
)
}
\arguments{
\item{id}{xxx}

\item{obj}{xxx}

\item{filters}{xxx}

\item{val_vs_percent}{xxx}

\item{operator}{xxx}

\item{reset}{xxx}

\item{op_names}{xxx}
}
\value{
NA
}
\description{
xxxx
}
\examples{

library(shiny)
library(shinyBS)

ui <- fluidPage(
  tagList(
    shinyjs::useShinyjs(),
    actionButton('external_reset', 'Reset'),
    mod_query_metacell_ui('query'),
    uiOutput('res'),
    shinyjs::disabled(actionButton('perform', 'Perform')),
    
  )
)

server <- function(input, output) {
  
  
  
  utils::data("Exp1_R25_prot", package='DaparToolshedData')
  
  tmp <- mod_query_metacell_server('query', 
                                   obj = reactive({Exp1_R25_prot}),
                                   reset = reactive({input$external_reset + input$perform}),
                                   op_names = reactive({c('Push p-value', 'Keep original p-value')})
  )
  
  observeEvent(tmp()$trigger, {
    #print(tmp()$indices)
    shinyjs::toggleState("perform",
                         condition = length(tmp()$indices) > 0
    )
    
  })
  
  output$res <- renderUI({
    p(paste0(tmp()$params$MetacellTag, collapse='\n'))
  })
}

shinyApp(ui = ui, server = server)

}
