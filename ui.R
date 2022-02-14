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
           tabsetPanel(type = "tab",
                       tabPanel("Loan Default Dataset",br(),
                                title = "Data",icon = icon("database"),
                                sidebarLayout(
                                  sidebarPanel(width=3,
                                    img(src="image.png",height = 400, width = 310),
                                    helpText("Dowload Dataset"),
                                    radioButtons("type", "Format Type:",
                                                 choices = c("CSV", "Text (TSV)", "Text (Space Seperated)")),
                                    br(),
                                    helpText("Click on the Download button to download the full dataset"),
                                    downloadButton("downloaddata", "Download")),
                                  

                       mainPanel(tableOutput("data")))),
                       
                       
                       tabPanel("Summary",icon = icon("table"),

                                sidebarLayout(

                                  sidebarPanel(width=3,
                                               img(src="image.png",height = 400, width = 310),
                                               helpText("Dowload Summary Table"),
                                               radioButtons("type", "Format Type:",
                                                            choices = c("CSV", "Text (TSV)", "Text (Space Seperated)")),
                                               br(),
                                               helpText("Click on the Download button to download the summary table"),
                                               downloadButton("downloadsum", "Download")),



                                  mainPanel(verbatimTextOutput("summary")))),
                       tabPanel("Structure", icon = icon("receipt"),
                                sidebarLayout(
                                  sidebarPanel(width=3,
                                               img(src="image.png",height = 400, width = 310),
                                               helpText("Dowload Structure Table"),
                                               radioButtons("type", "Format Type:",
                                                            choices = c("CSV", "Text (TSV)", "Text (Space Seperated)")),
                                               br(),
                                               helpText("Click on the Download button to download the structure of the dataset"),
                                               downloadButton("downloadstr", "Download")),
                                  
                                  mainPanel(verbatimTextOutput("str")))),
                       
                       
                       tabPanel("Plot",icon = icon("images"),
                                sidebarLayout(
                                  sidebarPanel(),
                                  mainPanel(plotOutput('stplot',height = "600px"), 
                                            downloadButton(outputId = "down", label = "Download the Plot")))),
                                               
                                

               
                       tabPanel("Missing Data", icon = icon("exclamation"),
                                sidebarLayout(
                                  sidebarPanel(tableOutput("missing")),
                                  mainPanel(plotOutput("vismissing", height = "600px")))),

                       tabPanel("Missing Data Visualized",icon = icon("images")))),
  
                       
  tabPanel("Features",
           tabsetPanel(type = "tab",
                       tabPanel("Rate of Interest & Interest Spread",  icon = icon("calculator"),
                                sidebarLayout(
                                  sidebarPanel(),
                                  mainPanel(plotOutput("intspread", height = 600))
                                               
                                )),
                       tabPanel("LTV & DTIR", icon = icon("calculator"),
                                sidebarLayout(
                                  sidebarPanel(),
                                  
                                  mainPanel(plotOutput("dtirltv", height = 600))
                                )),
                       tabPanel("DTIR (CLoser Look)",fluid = T, icon = icon("receipt"),
                                sidebarLayout(
                                  sidebarPanel(),
                                  mainPanel(plotOutput("dtir", height = 600))
                                
                                  
                                )),
                       tabPanel("Property Value", fluid = T, icon = icon("calculator"),
                                sidebarLayout(
                                  sidebarPanel(),
                                  mainPanel(plotOutput("propdtir", height = 600))
                                )),
                       
                       tabPanel("Income", fluid = T, icon = icon("calculator"),
                                sidebarLayout(
                                  sidebarPanel(),
                                  mainPanel(plotOutput("inc", height = 600))
                       
                       
                       
                       
                       )),
  
  
  tabPanel("Status",
           sidebarLayout(
             sidebarPanel(),
             
             mainPanel(tabsetPanel(type = "tab",
                                   tabPanel("Credit Score Impact", plotOutput("credit"), icon = icon("images"))))
           )),
  
  
  
  tabPanel("Forecast"),
  
  navbarMenu("More",
             tabPanel("Contact Us", icon = icon("phone")),
             tabPanel("Learn More", icon = icon("info")),
             tabPanel("Outlook", icon = icon("plus")),
             tabPanel("Help", icon = icon("question"))),
  
  tabPanel("Hello",
              tabsetPanel(type = "tab",
                          tabPanel("vvvv", sidebarLayout(sidebarPanel(
                            img(src="image.png",height = 460, width = 430)
                            
                          ), 
                          
                          
                          mainPanel('cd'))),
                          
                          tabPanel("vvvv", sidebarLayout(sidebarPanel(
                            img(src="image.png",height = 460, width = 430)),
                            mainPanel("g")))))
                          
                          
                        
                                        
                                        
           
                          
                   
                            
                          
                          
                          
                
                       
           
           
                      
  
          
  
  
  
)




