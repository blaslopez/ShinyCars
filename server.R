
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
   
   output$distPlot <- renderPlot({
      
      if (input$type == "Speed") {
         # Speed histrogram
         hist(cars$speed, 
              main="Speed histogram",
              breaks=as.numeric(input$breaks))
         if (input$mean) {
            abline(v=mean(cars$speed,col="red"))
         }
      } else if (input$type == "Distance") {
         # Stop distance histrogram
         hist(cars$dist, 
              main="Distance histogram",
              breaks=as.numeric(input$breaks))
         if (input$mean) {
            abline(v=mean(cars$dist,col="red"))
         }
      } else {
         # Combined chart with geom parameter
         qplot(speed,dist,data=cars,
               main = "Speed and Stopping Distances of Cars",
               geom=input$geom)
      }
      
   })
   
   # The summary print
   output$summary <- renderPrint({
      summary(cars)
   })
   
   # Table 
   output$table <- renderDataTable(cars, options = list(pageLength = 8))
   
})