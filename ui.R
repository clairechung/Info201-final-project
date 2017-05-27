#ui.R
install.packages("shinythemes")
install.packages("plotly")
library(shiny)
library(plotly)
library(shinythemes)



shinyUI(fluidPage( theme=shinytheme("superhero"),
  titlePanel("Final Project - Team Run"),
  
  sidebarLayout(
    sidebarPanel(
      conditionalPanel(condition='input.tabselected == 1', helpText("Overview Panel")),
      conditionalPanel(condition='input.tabselected == 2', helpText("Scatterplot Panel"),
                       selectInput("scatter.options","Choose an option", choices = c("Option 1", "Option 2", "Option 3"))),
      conditionalPanel(condition='input.tabselected == 3', helpText("Table Panel"),
                       selectInput("table.options","Choose level of Academic Performance", choices = c("All", "High Performance", "Middle Performance", "Low Performance")))
    ),
    mainPanel(
      tabsetPanel(
        id="tabselected",
        tabPanel("Overview", value=1,textOutput("main.text")),
        tabPanel("Scatter", value=2, plotlyOutput("scatter")),
        tabPanel("Bar", value=3,plotlyOutput("table"))
      )
    )
  )
  
))