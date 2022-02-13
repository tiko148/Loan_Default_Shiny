#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


library(shiny)
library(bslib)
library(shinythemes)



ui <-navbarPage("That's BaLOANy INC.", collapsible = T, inverse = T, theme =bs_theme(
  bg = "#101010", 
  fg = "#FDF7F7", 
  primary = "#ED79F9", 
  base_font = font_google("Prompt"),
  code_font = font_google("JetBrains Mono")),
  tabPanel("About",
           sidebarLayout(
             sidebarPanel(img(src="~/Desktop/image.png",height = 300, width = 220)),
             mainPanel(tabsetPanel(type="tab",
                                   tabPanel("Summary"),
                                   tabPanel("Structure"),
                                   tabPanel("Data", tableOutput("data")),
                                   tabPanel("Plot")))
           ),
           
           
  ),
  
  
  
  tabPanel("Features",
           sidebarLayout(
             sidebarPanel(
               selectInput("slid",
                           "Select the X Variable:",
                           c("California", "Florida", "Texas", "NY", "Arizona"),
                           selected = "Texas",
                           selectize = T,
                           multiple = F)
               
               
               
             ),
             mainPanel(textOutput("state"))
           )),
  
  
  tabPanel("Status"),
  
  
  
  tabPanel("Forecast"),
  
  navbarMenu("More",
             tabPanel("Contact Us"),
             tabPanel("Learn More"),
             tabPanel("Outlook"),
             tabPanel("Help"))
  
  
  
  
)

shinyApp(ui = ui, server = server)