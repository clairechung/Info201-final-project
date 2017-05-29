#ui.R
#setup
install.packages("shinythemes")
install.packages("plotly")

library(shiny)
library(plotly)
library(shinythemes)


shinyUI(
  navbarPage(title = "TEAM RUN",
             theme = shinytheme("superhero"),
             tabPanel("Overview", 
                      mainPanel(
                        tags$h1("Dataset"),
                        tags$div(
                          textOutput("main.text")), 
                        tags$h1("Questions"), 
                        tags$div(
                          htmlOutput("question"))
                      )),
             tabPanel("Scatter",
                      sidebarLayout(
                        sidebarPanel(
                          #user input of gender
                          selectInput(inputId = "gender",
                                      label = "Gender:",
                                      choices = list("All", "Male" = "M", "Female" = "F"),
                                      selected = "All"),
                          
                          #user input of grade level
                          selectInput(inputId = "grade",
                                      label = "Grade Level:",
                                      choices = list("All", "G-01", "G-02", "G-03", "G-04",
                                                  "G-05", "G-06", "G-07", "G-08", 
                                                  "G-09", "G-10", "G-11", "G-12"),
                                      selected = "All"), 
                          #user input of topic
                          selectInput(inputId = "topic", 
                                      label = "Topic:", 
                                      choices = list("All", "English", "French", "Arabic", "IT", "Math", 
                                                  "Chemistry", "Biology", "Science", "History", 
                                                  "Spanish", "Quran", "Geology"), 
                                      selected = "All"), 
                          #user input of activity
                          selectInput(inputId = "activity", 
                                      label = "Activity:", 
                                      choices = list("Raised hand" = "raisedhands", "Visited resource" = "VisITedResources", "Viewing announcement" = "AnnouncementsView", 
                                                  "Discussion group" = "Discussion"),
                                      # , "Absence day" = "StudentAbsenceDays"
                                      selected = "Raised hand")
                        ),
                        mainPanel(
                          tabsetPanel(
                            tabPanel("Information"),
                            tabPanel("Table", dataTableOutput("scatterTable")),
                            tabPanel("Graph", plotlyOutput('scatterGraph'))
                        )
                        ))),
             tabPanel("Bar Graph",
                      sidebarLayout(
                        sidebarPanel(
                          #user input of activity
                          selectInput(inputId = "activity", 
                                      label = "Activity:", 
                                      choices = c("Raised hand", "Visited resource", "Viewing announcement", 
                                                  "Discussion group", "Absence day"), 
                                      selected = "Raised hand")
                        ),
                        mainPanel(
                          tabsetPanel(
                            tabPanel("Information"),
                            tabPanel("Table", dataTableOutput("barTable")),
                            tabPanel("Graph", plotlyOutput('barGraph'))
                          )
                        )
                      )
              )
  )
)