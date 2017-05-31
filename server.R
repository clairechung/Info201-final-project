#server.R
library(shiny)
library(plotly)
library(dplyr)

source('./scripts/scatter.R')
source('./scripts/bar.R')
data <- read.csv(file='./data/xAPI-Edu-Data.csv', stringsAsFactors = FALSE)
data <- select(data, -PlaceofBirth, -StageID, -SectionID, -Semester, -Relation, -ParentAnsweringSurvey, -ParentschoolSatisfaction)

# 3 indicates high level (score of 90 - 100), 
# 2 indicates middle level (70 - 89), 1 indicates low level (0-69)
data$Class <- gsub('H', 3, data$Class)
data$Class <- gsub('M', 2, data$Class)
data$Class <- gsub('L', 1, data$Class)

shinyServer(function(input, output) {
  
  ########## Scatter rendering graph & table ##########
  output$scatterGraph <- renderPlotly({
    return(BuildScatter(data, input$gender, input$grade, input$topic, input$activity))
  })
  output$scatterTable <- renderDataTable({
    return(ScatterTable(data, input$gender, input$grade, input$topic, input$activity))
  })
  
  ########## Bar rendering graph & table ##########
  output$barGraph <- renderPlotly({
    return(BuildBar(data, input$performance))
  })
  output$barTable <- renderDataTable({
    return(BarTable(data, input$performance))
  })
  
  })