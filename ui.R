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
                                  sidebarPanel(width=3,
                                               img(src="image.png",height = 400, width = 310)),
                                  mainPanel(plotOutput('stplot',height = "600px"), 
                                            downloadButton(outputId = "down", label = "Download the Plot")))),
                                               
                                

               
                       tabPanel("Missing Data", icon = icon("exclamation"),
                                sidebarLayout(
                                  sidebarPanel(tableOutput("missing")),
                                  mainPanel(plotOutput("vismissing", height = "600px")))))),

                  
                       
  tabPanel("Features",
           tabsetPanel(type = "tab",
                       tabPanel("Rate of Interest & Interest Spread",  icon = icon("calculator"),
                                sidebarLayout(
                                  sidebarPanel(width=3,
                                               img(src="image.png",height = 500, width = 310)),
                                  mainPanel(plotOutput("intspread", height = 600))
                                               
                                )),
                       tabPanel("LTV & DTIR", icon = icon("calculator"),
                                sidebarLayout(
                                  sidebarPanel(width=3,
                                               img(src="image.png",height = 500, width = 310)),
                                  
                                  mainPanel(plotOutput("dtirltv", height = 600))
                                )),
                       
                       tabPanel("Property Value", fluid = T, icon = icon("calculator"),
                                sidebarLayout(
                                  sidebarPanel(width=3,
                                               img(src="image.png",height = 500, width = 310)),
                                  mainPanel(plotOutput("propdtir", height = 600))
                                )),
                       
                       tabPanel("Income", fluid = T, icon = icon("calculator"),
                                sidebarLayout(
                                  sidebarPanel(width=3,
                                               img(src="image.png",height = 500, width = 310)),
                                  mainPanel(plotOutput("inc", height = 600))
                       
                       
                       
                       
                       )),
                       
                       
                       tabPanel("Income & Property Value", fluid = T, icon = icon("calculator"),
                                sidebarLayout(
                                  sidebarPanel(width=3,
                                               img(src="image.png",height = 500, width = 310)),
                                  mainPanel(plotOutput("prpinc", height = 600))
                       
                       
                       )))),
  
  
  tabPanel("Status",
           tabsetPanel(type="tab",
                       tabPanel("DTIR (CLoser Look)",fluid = T, icon = icon("receipt"),
                                sidebarLayout(
                                  sidebarPanel(width=3,
                                               img(src="image.png",height = 500, width = 310)),
                                  mainPanel(plotOutput("dtir", height = 600))
                                  
                                  
                                )),
                       tabPanel("Credit Score",fluid = T, icon = icon("receipt"),
                                sidebarLayout(
                                  sidebarPanel(width=3,
                                               img(src="image.png",height = 500, width = 310)),
                                  mainPanel(plotOutput("bargender", height = 600)),
                               

                                )),
                       tabPanel("Credit Score (more)", fluid = T, icon = icon("receipt"),
                                sidebarLayout(
                                  sidebarPanel(width=3,
                                               img(src="image.png",height = 500, width = 310)),
                                  mainPanel(plotOutput("credensity", heigh = 600))
                                )),
                       tabPanel("Open Credit", fluid = T, icon = icon("receipt"),
                                sidebarLayout(
                                  sidebarPanel(width=3,
                                               img(src="image.png",height = 500, width = 310)),
                                  mainPanel(plotOutput("opencredit", heigh = 600))
                                )),
                       
                       
                       tabPanel("Open Credit & Gender", fluid = T, icon = icon("receipt"),
                                sidebarLayout(
                                  sidebarPanel(width=3,
                                               img(src="image.png",height = 500, width = 310)),
                                  mainPanel(plotOutput("opgender", heigh = 600))
                                ))
           
           
           
           )),
  
  
  
  tabPanel("Forecast",
           tabsetPanel(type="tab",
                       tabPanel("Logist Regression Evaluator (ROC)",fluid = T, icon = icon("receipt"),
                                sidebarLayout(
                                  sidebarPanel(tableOutput("ROC")),
                                  mainPanel(plotOutput("varimport", height = 600)),
                                         
                                )))),
             
  
  navbarMenu("More",
             tabPanel("Contact Us", icon = icon("phone"),uiOutput("tab")),
             tabPanel("Learn More", icon = icon("info")),
             tabPanel("Outlook", icon = icon("plus")),
             tabPanel("Help", icon = icon("question"))),
  

  
)




