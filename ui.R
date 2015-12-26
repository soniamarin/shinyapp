library(shiny)
##
## 
shinyUI(pageWithSidebar( 
  ##Application title
  headerPanel("Venezuelan Educational System - High School Desertion"),
  sidebarPanel(
    numericInput('age', 'Student age-years',15, min=10, max=27, step=1),
    radioButtons("sex", "Student sex:",
                 c("Femenine" = "F",
                   "Masculine" = "M")),
    radioButtons("year", "Current scholar year:",
                 c("1st year" = "1",
                   "2nd year" = "2",
                   "3rd year" = "3",
                   "4th year" = "4")),
    br(),
    
    sliderInput("n", 
                "Select Year of desertion for Histogram:", 
                value = 1,
                min = 1, 
                max = 4),
    br(),
    submitButton('Submit')
              ),
  mainPanel(
    tabsetPanel(
      tabPanel("Results", h3('Results of prediction'),
               h4('You entered:'),
               verbatimTextOutput("inputValue"),
               h4('You entered:'),
               verbatimTextOutput("inputValue2"),
               h4('You entered:'),
               verbatimTextOutput("inputValue3"),
               h4('Which resulted in a %probability of having abandoned high school of'),
               verbatimTextOutput("prediction")), 
      tabPanel("Histogram",  plotOutput("distPlot")), 
      tabPanel("Help", htmlOutput("help")))
    )
))


