#server.R
library(shiny)
library(plotly)

data <- read.csv(file='data/xAPI-Edu-Data.csv', stringsAsFactors = FALSE)

shinyServer(function(input, output) {
  output$main.text <- renderText({
    "The dataset is an educational data set which is collected from learning management system (LMS) called Kalboard 360. Kalboard 360 is a multi-agent LMS, which has been designed to facilitate learning through the use of leading-edge technology. The data is collected using a learner activity tracker tool, which called experience API (xAPI). The xAPI is a component of the training and learning architecture (TLA) that enables to monitor learning progress and learner’s actions like reading an article or watching a training video. There are 16 attributes in this data set. The students are divided into three intervals(numerical) based on their total grade or mark; Low-Level indicates grade 0 to 69, Middle-Level means 70 to 89, and High-Level represents the score of 90 to 100. 
    There are multiple audiences that would be interested in using this dataset. 
    Parents, teachers, students, and anyone who is involved in education will be interested in using this dataset. 
    our project, we will be focusing on parents. A student’s performance in school usually concerns the parents, and organizing the dataset can provide visual insight on how certain factors affect students’ grades.
    Here are some questions that our project will answer for the audience. 

    1. Students from which nation tend to achieve highest average academic performance? 
    2. Do males tend to achieve better academic performance than females? 
    3. What kinds of academic behavior leads to enhancing grade of students?"
  })
  output$scatter <- renderPlotly({
    
  })
  output$table <- renderPlotly({
    
  })
  
})