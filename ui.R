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
             sidebarPanel(img(src="image.png",height = 460, width = 430),
                          br(),
                          helpText("Dowload Dataset"),
                          radioButtons("type", "Format Type:",
                                       choices = c("CSV", "Text (TSV)", "Text (Space Seperated)")),
                          br(),
                          helpText("Click on the Download button to download the full dataset"),
                          downloadButton("downloaddata", "Download")),
             mainPanel(tabsetPanel(type="tab",
                                   tabPanel("Data", tableOutput("data"), icon = icon("database")),
                                   tabPanel("Summary", verbatimTextOutput('summary'),icon = icon("table")),
                                   tabPanel("Structure", verbatimTextOutput("str"), icon = icon("receipt")),
                                   tabPanel("Plot", plotOutput('stplot'), icon = icon("images")),
                                   tabPanel("Missing Data",tableOutput("missing"),icon = icon("exclamation")),
                                   tabPanel("Missing Data Visualized", plotOutput("vismissing"),icon = icon("images"))))
           ),
           
           
  ),
  
  
  
  tabPanel("Features",
           sidebarLayout(
             sidebarPanel(),
             
             mainPanel(tabsetPanel(type = "tab",
                                      tabPanel("Numeric Features",fluid = T,  icon = icon("calculator")),
                                      tabPanel("Categorical Features",fluid = T, icon = icon("receipt")))
              
               
               
               
             ),
            
           )),
  
  
  tabPanel("Status"),
  
  
  
  tabPanel("Forecast"),
  
  navbarMenu("More",
             tabPanel("Contact Us", icon = icon("phone")),
             tabPanel("Learn More", icon = icon("info")),
             tabPanel("Outlook", icon = icon("plus")),
             tabPanel("Help", icon = icon("question")))
  
  
  
  
)




