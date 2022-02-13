  

library(shiny)


server <- function(input, output) {
  output$data <- renderTable({
    head(loan)
  })
}