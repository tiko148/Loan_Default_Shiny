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
             sidebarPanel(img(src="image.png",height = 300, width = 220)),
             mainPanel(tabsetPanel(type="tab",
                                   tabPanel("Summary", verbatimTextOutput('summary')),
                                   tabPanel("Structure", verbatimTextOutput("str")),
                                   tabPanel("Data", tableOutput("data")),
                                   tabPanel("Plot", plotOutput('stplot')),
                                   tabPanel("Missing Data",tableOutput("missing")),
                                   tabPanel("Missing Data Visualized", plotOutput("vismissing"))))
           ),
           
           
  ),
  
  
  
  tabPanel("Features",
           sidebarLayout(
             sidebarPanel(),
             mainPanel(tabsetPanel(type = "tab",
                                      tabPanel("Numeric Features"),
                                      tabPanel("Categorical Features"))
              
               
               
               
             ),
            
           )),
  
  
  tabPanel("Status"),
  
  
  
  tabPanel("Forecast"),
  
  navbarMenu("More",
             tabPanel("Contact Us"),
             tabPanel("Learn More"),
             tabPanel("Outlook"),
             tabPanel("Help"))
  
  
  
  
)




