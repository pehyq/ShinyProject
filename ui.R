#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Black cherry trees dimensions"),
  
  # Dropdown list for selection
  column(3,
         selectInput("select", label = h3("Select box"), 
                     choices = c("Girth", "Height","Volume"), 
                     selected = "Girth")),
  
  # Sidebar with a slider input for radius
  sidebarLayout(
    sidebarPanel(
       sliderInput("bins",
                   "Number of bins: ",
                   min = 1,
                   max = 30,
                   value = 10)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
