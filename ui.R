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
                      mainPanel(
                        tags$h1("Students Performance Dataset"),
                        tags$div(
                          tags$h3("Where the dataset is from: "),
                          tags$p("The dataset is an educational data set which is collected from learning management system (LMS) called Kalboard 360. 
                                 Kalboard 360 is a multi-agent LMS, which has been designed to facilitate learning through the use of leading-edge technology. 
                                 The data is collected using a learner activity tracker tool, which called experience API (xAPI). 
                                 The xAPI is a component of the training and learning architecture (TLA) that enables to monitor learning progress and 
                                 learner’s actions like reading an article or watching a training video. There are multiple audiences that would be interested in using this dataset."),
                          tags$h3("Attributes in data: "),
                          tags$p("There are 16 attributes in this data set. 
                                  The students are divided into three intervals(numerical) based on their total grade or mark;"),
                          tags$ul(
                            tags$li("Low-Level: indicates grade 0 to 69"),
                            tags$li("Middle-Level: indicates 70 to 89"),
                            tags$li("High-Level: indicates score of 90 to 100")
                          ),
                          tags$h3("Audience: "),
                          tags$p("There are multiple audiences that would be interested in using this dataset. 
                                 Parents, teachers, students, and anyone who is involved in education will be interested in using this dataset. 
                                 In our project, we will be focusing on parents. A student’s performance in school usually concerns the parents, 
                                 and organizing the dataset can provide visual insight on how certain factors affect students’ grades."),
                          tags$h3("Questions: "),
                          tags$p("The questions we ask on the dataset are listed below."),
                          tags$ul(
                            tags$li("What kinds of academic behavior leads to enhancing grade of students?"),
                            tags$li("Does a specific gender tend to be more influenced by the academic behaviors?"),
                            tags$li("Students from which nation tend to achieve highest average academic performance?"),
                            tags$li("How does having higher participation affect on achieveing better academic performance in each nation?")
                          )
                        ),
                        tags$h1("About Us"),
                        tags$div(
                          tags$p("Authors: Jacquelin Huang, Claire(Hyewon) Chung, Jeewon Ha, and Lucy (MyungJin) Eun"),
                          tags$p("We are students in University of Washington who are taking INFO 201. Wea re interested in how different factors influence students' academic performance.")
                        )
                      )),
             tabPanel("Scatter",
                      titlePanel('What factor(s) may affect the academic performance?'),
                      sidebarLayout(
                        sidebarPanel(
                          #user input of activity
                          tags$h3("Change the x-axis to see the relationship with the performance."),
                          radioButtons("activity", 
                                      label = "Activity:", 
                                      choices = list("Raised hand" = "raisedhands", "Visited resource" = "VisITedResources", "Viewing announcement" = "AnnouncementsView", 
                                                     "Discussion group" = "Discussion"),
                                      selected = "raisedhands"),
                          #user input of gender
                          tags$h3("Filter data to see a specific gender, grade, and topic."),
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
                          tags$hr()
                        ),
                        mainPanel(
                          tabsetPanel(
                            tabPanel("Graph", plotlyOutput('scatterGraph'),
                                     tags$p("**scatter plot may not be displayed if there is no matching combination of chosen factors**")
                            ),
                            tabPanel("Summary", 
                                     tags$p(
                                       tags$br("Question: What factor(s) may affect the academic performance of the subjectives?"),
                                       tags$br("Factor:"),
                                       tags$ul(
                                         tags$li("Gender: Male, Female"),
                                         tags$li("Grade level: G-01 - G-12"),
                                         tags$li("Topic: English, French, Arabic, IT, Math, Chemistry, Biology, Science, History, 
                                                 Spanish, Quran, Geology"),
                                         tags$li("Activity: Raised hand, Visited resource, Viewing announcement, Discussion group")
                                         ),
                                       tags$br(
                                         tags$p("x-axis: factor"),
                                         tags$p("y-axis: academic performance")
                                       )
                                       
                                     )),
                            tabPanel("Table", dataTableOutput("scatterTable"))
                            )
                      ))),
             tabPanel("Bar Graph",
                      titlePanel('What contributes to the ratings of cereal?'),
                      sidebarLayout(
                        sidebarPanel(
                          #user input of activity
                          selectInput(inputId = "performance", 
                                      label = "Performance:", 
                                      choices = c("All","High Performance", "Middle Performance", "Low Performance"), 
                                      selected = "Raised hand")
                        ),
                        mainPanel(
                          tabsetPanel(
                            tabPanel("Graph", plotlyOutput('barGraph')),
                            tabPanel("Summary", 
                                     tags$p(
                                       tags$br("Question1: Students from which nation tend to achieve highest average academic performance?"),
                                       tags$br("Question2: How does having higher participation affect on achieveing better academic performance in each nation?"),
                                       tags$br(
                                         tags$p("x-axis: Nationality: Egypt, Iran, Iraq, Jordan, KW, lebanon, Lybia, Morocco, Palestine, SaudiArabia, Syria, Tunis, USA, venzuela"),
                                         tags$p("y-axis: Level of Participation(Activity): Raised hand, Visited resource, Viewing announcement, Discussion group"),
                                         tags$p("color of graph(in case of show all): degree of performance: High(score of 90 - 100), Middle(70 - 89), Low(0-69)")
                                       ),
                                       tags$p("The nation where showed best academic performance (put little effort but got the highest grade) is USA (about 224 times participating). 
                                              The nation where showed worst academic performance (put lots of effort but got the lowest grade) is SaudiArabia (about 141 times participating). ")
                                       )),
                            tabPanel("Table", dataTableOutput("barTable"))
                          )
                        )
                      )
                    )
             )
  )
