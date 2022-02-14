  

library(shiny)



    
server <- function(input, output) {
  
  output$inc <- renderPlot({
    ggplot()+geom_point(aes(x = loan$income/1000, y = loan$LTV, color = loan$Status))+
      theme_solarized(light=F) +
      scale_colour_solarized("red")+
      scale_color_manual(name="Loan Status",values=c("#D60048","#2AAA69"))+
      labs(title = "Relationship Between Income Levels & LTV",
           x= "Income (in thousands $)",
           y="LTV",
           caption = "*Note the section exceeding $100,000 in income*",
           subtitle = "How likely to Default based on LTV and Income")+
      
      theme(plot.caption = element_text(face = "italic",
                                        size=12,
                                        hjust = 0.1))+
      theme(plot.title = element_text(lineheight= 0.9,
                                      color="black",
                                      face="bold",
                                      family="Optima",
                                      size=26,
                                      hjust=0.5))+
      theme(plot.subtitle = element_text(face = 'italic',
                                         color = "#9F85BD",
                                         size = 16,
                                         hjust = 0.5))+
      theme(plot.tag = element_text(size = 12,
                                    face = 'italic',
                                    hjust = 0.6,
                                    colour = "red"))+
      theme(text = element_text(size=14,
                                face = "bold"))+
      theme(axis.title = element_text(color = "#9F85BD",
                                      size = 16,
                                      face = "bold"))+
      theme(axis.text =element_text( color = "#919093",
                                     size = 16))
    
  })
  
  
  
  output$propdtir <- renderPlot({
    ggplot()+geom_point(aes(x = loan$property_value/10000, y = loan$dtir1, color = loan$Status))+
      theme_solarized(light=F) +
      scale_colour_solarized("red")+
      scale_color_manual(name="Loan Status",values=c("#D60048","#2AAA69"))+
      labs(title = "Relationship Between Property Value & DTIR",
           x= "Property Value (in ten thousands $)",
           y="Debt To Income Ratio",
           caption = "*Note the section with high debt*",
           subtitle = "How likely to Default")+

      
      theme(plot.caption = element_text(face = "italic",
                                        size=12,
                                        hjust = 0.1))+
      theme(plot.title = element_text(lineheight= 0.9,
                                      color="black",
                                      face="bold",
                                      family="Optima",
                                      size=26,
                                      hjust=0.5))+
      theme(plot.subtitle = element_text(face = 'italic',
                                         color = "#9F85BD",
                                         size = 16,
                                         hjust = 0.5))+
      theme(plot.tag = element_text(size = 12,
                                    face = 'italic',
                                    hjust = 0.6,
                                    colour = "red"))+
      theme(text = element_text(size=14,
                                face = "bold"))+
      theme(axis.title = element_text(color = "#9F85BD",
                                      size = 16,
                                      face = "bold"))+
      theme(axis.text =element_text( color = "#919093",
                                     size = 16))
    
  })
  
  output$dtir <- 
    renderPlot({
      ggplot()+geom_density(aes(x = loan$dtir1,color = loan$Status))+
        theme_solarized(light=F) +
        scale_colour_solarized("red")+
        scale_color_manual(name="Loan Status",values=c("#D60048","#2AAA69"))+
        labs(title = "DTIR and Likelihood to Default",
             x= "DTIR (Debt to Income Ratio)",
             y="Count (Exact)",
             caption = "*Note the section where DTIR goes up but Default rates decline*",
             subtitle = "Debt to Income Ratio")+

        
        theme(plot.caption = element_text(face = "italic",
                                          size=12,
                                          hjust = 0.1))+
        theme(plot.title = element_text(lineheight= 0.9,
                                        color="black",
                                        face="bold",
                                        family="Optima",
                                        size=26,
                                        hjust=0.5))+
        theme(plot.subtitle = element_text(face = 'italic',
                                           color = "#9F85BD",
                                           size = 16,
                                           hjust = 0.5))+
        theme(plot.tag = element_text(size = 12,
                                      face = 'italic',
                                      hjust = 0.6,
                                      colour = "red"))+
        theme(text = element_text(size=14,
                                  face = "bold"))+
        theme(axis.title = element_text(color = "#9F85BD",
                                        size = 16,
                                        face = "bold"))+
        theme(axis.text =element_text( color = "#919093",
                                       size = 16))
      
      
    })
  
  output$dtirltv <- renderPlot({
    ggplot()+geom_point(aes(x = loan$LTV, y = loan$dtir1, color = loan$Status))+
      theme_solarized(light=F) +
      scale_colour_solarized("red")+
      scale_color_manual(name="Loan Status",values=c("#D60048","#2AAA69"))+
      labs(title = "Relationship Between LTV & DTIR",
           x= "LTV (Loan To Value Ratio",
           y="Debt To Income Ratio",
           caption = "*Note the section with high debt*",
           subtitle = "How likely to Default")+
      xlim(0,300)+

      theme(plot.caption = element_text(face = "italic",
                                        size=12,
                                        hjust = 0.1))+
      theme(plot.title = element_text(lineheight= 0.9,
                                      color="black",
                                      face="bold",
                                      family="Optima",
                                      size=26,
                                      hjust=0.5))+
      theme(plot.subtitle = element_text(face = 'italic',
                                         color = "#9F85BD",
                                         size = 16,
                                         hjust = 0.5))+
      theme(plot.tag = element_text(size = 12,
                                    face = 'italic',
                                    hjust = 0.6,
                                    colour = "red"))+
      theme(text = element_text(size=14,
                                face = "bold"))+
      theme(axis.title = element_text(color = "#9F85BD",
                                      size = 16,
                                      face = "bold"))+
      theme(axis.text =element_text( color = "#919093",
                                     size = 16))
    
  })
  
  
  output$intspread <- renderPlot({
    ggplot()+geom_point(aes(x = loan$rate_of_interest, y = loan$Interest_rate_spread, color = loan$Status))+
      theme_solarized(light=F) +
      scale_colour_solarized("red")+
      scale_color_manual(name="Loan Status",values=c("#D60048","#2AAA69"))+
      labs(title = "Rate of Interest and Interest Rate Spread",
           x= "Rate of Interest",
           y="Interest Rate Spread",
           caption = "*Interest Rates are Expected to Grow*",
           subtitle = "Relationship Between Interest Rates and Interest Rate Spread")+
      theme(plot.caption = element_text(face = "italic",
                                        size=12,
                                        hjust = 0.1))+
      theme(plot.title = element_text(lineheight= 0.9,
                                      color="black",
                                      face="bold",
                                      family="Optima",
                                      size=26,
                                      hjust=0.5))+
      theme(plot.subtitle = element_text(face = 'italic',
                                         color = "#9F85BD",
                                         size = 16,
                                         hjust = 0.5))+
      theme(plot.tag = element_text(size = 12,
                                    face = 'italic',
                                    hjust = 0.6,
                                    colour = "red"))+
      theme(text = element_text(size=14,
                                face = "bold"))+
      theme(axis.title = element_text(color = "#9F85BD",
                                      size = 16,
                                      face = "bold"))+
      theme(axis.text =element_text( color = "#919093",
                                     size = 16))
  })
  

  
  output$credit <- renderPlot({
    
    
    
    ggplot()+geom_bar(aes(x = loan$Credit_Score, fill = loan$Status),position = 'dodge2')+
      
      theme_solarized(light=F) +
      scale_colour_solarized("red")+
      scale_fill_manual(name="Status",values=c("bisque1","azure3"))+
      labs(title = "Credit Score and Default Ratio",
           x= "Credit Score",
           y="Count (Exact)",
           caption = "Credit Score classification is based on Experian,leading consumer credit reporting company. ",
           subtitle = "Distinct Client Count Based on Default Status and Credit Score")+
      theme(plot.caption = element_text(face = "italic",
                                        size=8,
                                        hjust = -0.1))+
      theme(plot.title = element_text(lineheight= 0.9,
                                      color="black",
                                      face="bold",
                                      family="Optima",
                                      size=20,
                                      hjust=0.5))+
      theme(plot.subtitle = element_text(face = 'italic',
                                         color = "#9F85BD",
                                         size = 12,
                                         hjust = 0.5))+
      theme(plot.tag = element_text(size = 8,
                                    face = 'italic',
                                    hjust = 0.6,
                                    colour = "red"))+
      theme(text = element_text(size=10,
                                face = "bold"))+
      theme(axis.title = element_text(color = "#9F85BD",
                                      size = 12,
                                      face = "bold"))+
      theme(axis.text =element_text( color = "#919093",
                                     size = 10))
  })
  
  
  
  fileExtension <- reactive({
    switch(input$type,
           "CSV" = "csv",
           "Text (TSV)" = "txt", 
           "Text (Space Seperated)" = "txt")
  })
  
  output$downloadData <- downloadHandler(
    
    filename = function(){
      paste(loan, fileExtension(), sep = ".")
    },
    content = function(file){
      sep <- switch(input$type, "CSV" = ",", "Text (TSV)" = "\t",  "Text (Space Seperated)" = " ")
      write.table(loan, file, sep = sep, row.names = F)
    }
  )
  
  output$downloadsumm <- downloadHandler(
    
    filename = function(){
      paste(loan, fileExtension(), sep = ".")
    },
    content = function(file){
      sep <- switch(input$type, "CSV" = ",", "Text (TSV)" = "\t",  "Text (Space Seperated)" = " ")
      write.table(loan, file, sep = sep, row.names = F)
    }
  )
  
  output$downloadstr <- downloadHandler(
    
    filename = function(){
      paste(loan, fileExtension(), sep = ".")
    },
    content = function(file){
      sep <- switch(input$type, "CSV" = ",", "Text (TSV)" = "\t",  "Text (Space Seperated)" = " ")
      write.table(loan, file, sep = sep, row.names = F)
    }
  )
  
  output$vismissing <- renderPlot({
    vis_dat(loan, warn_large_data = F,sort_type = T)
  })
  
  output$missing <- renderTable({
    
    na_count <-sapply(loan, function(y) sum(length(which(is.na(y)))))
    na_count <- data.frame(na_count)
    na_count #---> Dataframe format to show how many NA values in each column/variable.
    
    
    na_count %>% 
      filter(na_count>0) %>% 
      arrange(desc(na_count, na_count))->na_values_counter
    na_values_counter["% of All Data"] = (na_values_counter["na_count"]/nrow(loan))*100
    x <- tibble(rownames(na_values_counter))
    na_values_counter <- cbind(x,na_values_counter)
  })
  
  output$stplot <- renderPlot({
    
    ggplot()+geom_bar(aes(x = loan$Status, fill = loan$Status))+ 
      theme_solarized(light = F) +
      scale_colour_solarized()+
      scale_fill_manual(name="Status",values=c("#F82B4E","#6299D3"))+
      labs(
        title = "Status",
        subtitle = "Distribution of Default Ratio - Default(1) & Not Default(0)",
        caption = "Data from www.kaggle.com/yasserh/loan-default-dataset",
        x = "Status",
        y = "Count (Exact)"
      )+
      theme(plot.caption = element_text(face = "italic",
                                        size=8,
                                        hjust = 0.1))+
      theme(plot.title = element_text(lineheight= 0.9,
                                      color="black",
                                      face="bold",
                                      family="Optima",
                                      size=20,
                                      hjust=0.5))+
      theme(plot.subtitle = element_text(face = 'italic',
                                         color = "#9F85BD",
                                         size = 12,
                                         hjust = 0.5))+
      theme(plot.tag = element_text(size = 8,
                                    face = 'italic',
                                    hjust = 0.6,
                                    colour = "red"))+
      theme(text = element_text(size=10,
                                face = "bold"))+
      theme(axis.title = element_text(color = "#9F85BD",
                                      size = 12,
                                      face = "bold"))+
      theme(axis.text =element_text( color = "#919093",
                                     size = 10))
    
  })
  output$summary <- renderPrint({
    summary(loan)
  })
  
  output$str <- renderPrint({
    str(loan)
  })
  output$data <- renderTable({
    
    head(loan)
  })
 
}