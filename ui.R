# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(markdown)

# A navigation bar
shinyUI(navbarPage("ShinyCars",
                   
# First page is an information text including markdown
tabPanel("Info",
         h1("Course Project: Shiny Application"),
         em("Developing data products at https://class.coursera.org/devdataprod-014"),
         includeMarkdown("intro.md")
),

# Some charts demonstrating widgets features
tabPanel("Charts",
   # Application title
   titlePanel("Speed and Stopping Distances of Cars"),
   # What kind of chart
   selectInput(inputId = "type",
               label = "Chart Type",
               choices = c("Speed", "Distance", "Combined"),
               selected = "Combined"
   ),
   # Show the summary conditional pane ?
   checkboxInput(inputId = "summary",
                 label = strong("Show summary"),
                 value = FALSE),
   
   # Display this only for combined chart
   conditionalPanel(condition = "input.type == 'Combined'",
                    selectInput(inputId = "geom",
                                label = "Geometry",
                                choices = c("point","line","smooth"),
                                selected = "point"
                    )
   ),
   
   # Display this only for hist charts
   conditionalPanel(condition = "input.type != 'Combined'",
                    sliderInput(inputId = "breaks",
                                label = "Breaks:",
                                min = 2, max = 10, value = 6, step = 2),
                    checkboxInput(inputId = "mean",
                                  label = strong("Show mean line"),
                                  value = FALSE)
   ),
   
   # Show a plot of the generated distribution
   mainPanel( plotOutput("distPlot")),
   
   # Summary if user wants
   conditionalPanel(condition = "input.summary == true",
                    verbatimTextOutput("summary")
   )
),
# A table with the data 
tabPanel("Table",
         dataTableOutput('table')
)
))
