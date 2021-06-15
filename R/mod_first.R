#' first UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_first_ui <- function(id){
  ns <- NS(id)
  tagList(
    
    echarts4r::echarts4rOutput({ns("chart")})
 
  )
}
    
#' first Server Function
#'
#' @noRd 
mod_first_server <- function(input, output, session){
  ns <- session$ns
  
  output$chart <- echarts4r::renderEcharts4r({
    
    mtcars %>%
      echarts4r::e_charts(cyl) %>%
      echarts4r::e_bar(disp)
    
  })
 
}
    
## To be copied in the UI
# mod_first_ui("first_ui_1")
    
## To be copied in the server
# callModule(mod_first_server, "first_ui_1")
 
