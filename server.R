#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins and input$select from ui.R
        x    <- switch(input$select, 
                   "Girth" = trees$Girth,
                   "Height" = trees$Height,
                   "Volume" = trees$Volume) 
        colour <- switch(input$select, 
                         "Girth" = "red",
                         "Height" = "blue",
                         "Volume" = "darkgreen") 

    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = colour, border = 'white')
    
  })
  
})
