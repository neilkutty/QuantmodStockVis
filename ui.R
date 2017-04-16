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
  
 
  
  
fluidRow(
  
      column(width=4,offset=.5,
        
        textInput("symb", "Symbol", "XLE"),
       
        selectInput("themeselection", "Choose chart theme:",
                    choices = c('Black chart theme'='black',
                                'White chart theme'='white',
                                'Beige chart theme'='beige'),
                    selected = 'black')
            ),
      
      column(width=4, 
             dateRangeInput("dates", 
                            "Date range",
                            start = "2015-01-01", 
                            end = as.character(Sys.Date())),
             
             checkboxInput("log", "Plot y axis on log scale", 
                           value = FALSE),
             
             checkboxInput("adjust", 
                           "Adjust prices for inflation", value = FALSE),
             selectInput("charttype", "Choose chart type:",
                         choices = c('Auto'='auto',
                                     'Line chart'='line',
                                     'Candlesticks'='candlesticks',
                                     'Matchsticks'='matchsticks',
                                     'Bar chart'='bars'),
                         selected='auto')
                )
      
          ),

 
  plotOutput("plot",height = "600px")
 


))