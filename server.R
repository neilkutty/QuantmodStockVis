###
##
##  Quantmod Shiny Financial data app
##  authored by Neil Kutty
##  original code: http://shiny.rstudio.com/tutorial/lesson6/

library(quantmod)
source("helpers.R")
shinyServer(function(input, output) {
  indicators <- list("addMACD()","addVo()","addRSI()","addBBands()")
  themeselect <- reactive({input$themeselection})
  dataInput <- reactive({ 
    getSymbols(input$symb, src = "yahoo", 
               from = input$dates[1],
               to = input$dates[2],
               auto.assign = FALSE)
             })
  
  finalInput <- reactive({
    if (!input$adjust) return(dataInput())
    adjust(dataInput())
  })
  
  output$plot <- renderPlot({
  chartSeries(finalInput(), theme = input$themeselection, 
              type = input$charttype, log.scale = input$log, TA = indicators)
  })
})

