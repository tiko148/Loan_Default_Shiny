  

library(shiny)



    
server <- function(input, output) {
  
  
  
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
    
    Status <- loan$Status
    ggplot()+geom_bar(aes(x = loan$Status, fill = Status))+ 
      labs(
        title = "Status",
        subtitle = "Distribution of Default Ratio",
        caption = "Data from www.kaggle.com/yasserh/loan-default-dataset:
        Default - 1 & Not Default - 0 ",
        
        x = "Status",
        y = "Count"
      )+
      theme(plot.caption = element_text(face = "italic"))+
      theme(plot.title = element_text(lineheight= 0.9,
                                      color="black",
                                      face="bold.italic",
                                      family="sans",
                                      size=16,
                                      hjust=0.5))+
      theme(plot.subtitle = element_text(face = 'italic',
                                         color = "blue",
                                         size = 6,
                                         hjust = 0.9))+
      
      
      theme_solarized() +
      scale_colour_solarized()
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