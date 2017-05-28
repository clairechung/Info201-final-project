#ui.R
#setup
#install.packages("shinythemes")
#install.packages("plotly")

library(shiny)
library(plotly)
library(shinythemes)


shinyUI(
  navbarPage(title = "TEAM RUN",
             theme = shinytheme("superhero"),
             tabPanel("Overview", 
                      titlePanel("Project Proposal"),
                      mainPanel("hello")),
             tabPanel("Scatter",
                      sidebarLayout(
                        sidebarPanel(
                          #user input of gender
                          selectInput(inputId = "gender",
                                      label = "Gender:",
                                      choices = c("Male", "Female"),
                                      selected = "Male"),
                          
                          #user input of grade level
                          selectInput(inputId = "grade",
                                      label = "Grade Level:",
                                      choices = c("G-01", "G-02", "G-03", "G-04",
                                                  "G-05", "G-06", "G-07", "G-08", 
                                                  "G-09", "G-10", "G-11", "G-12"),
                                      selected = "G-01"), 
                          #user input of topic
                          selectInput(inputId = "topic", 
                                      label = "Topic:", 
                                      choices = c("English", "French", "Arabic", "IT", "Math", 
                                                  "Chemistry", "Biology", "Science", "History", 
                                                  "Spanish", "Quran", "Geology"), 
                                      selected = "English"), 
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
                            tabPanel("Table"),
                            tabPanel("Graph")
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
                            tabPanel("Table"),
                            tabPanel("Graph")
                          )
                        ))))
)