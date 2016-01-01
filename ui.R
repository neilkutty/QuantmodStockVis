###
##
##  Quantmod Shiny Financial data app
##  authored by Neil Kutty
##  original code: http://shiny.rstudio.com/tutorial/lesson6/


library(shiny)

shinyUI(fluidPage(
  titlePanel("Quantmod Stock Vis"),
  helpText("Up to date price and indicator data for instruments through Quantmod presented in RShiny"),
  helpText("Original UI and Server code from http://shiny.rstudio.com/tutorial/lesson6/"),

  plotOutput("plot",height = "725px"),

  
  fluidRow(
  
      column(width=4,offset=.5,
        helpText("Select a stock to examine. 
               Information will be collected from yahoo finance."),
      
        textInput("symb", "Symbol", "BABA"),
       
        dateRangeInput("dates", 
                     "Date range",
                     start = "2015-01-01", 
                     end = as.character(Sys.Date())),

        checkboxInput("log", "Plot y axis on log scale", 
                    value = FALSE),
      
        checkboxInput("adjust", 
                    "Adjust prices for inflation", value = FALSE),
        
        selectInput("themeselection", "Choose chart theme:",
                    choices = c('Black chart theme'='black',
                                'White chart theme'='white',
                                'Beige chart theme'='beige'),
                    selected = 'black')
        
      )
)))