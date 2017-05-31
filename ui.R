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
                                     tags$br(),
                                     tags$p("Students' academic performances are affected by various factors. With this scatterplot, we 
                                            explore the correlation between students' activities and their academic perforamnce.
                                            On the y-axis, students' academic performances are placed. 1 is low-performance, 2 is middle-performance, and 3 is high-performance."),
                                      tags$p("The radio button available on the left side allows the users to choose differnet activity types the
                                             students engaged in and see the correlation between the number of the activity students engaged in and the level of their academic performances."), 
                                      tags$p("The correlation between students' activity and their acedemic performance could be stronger or weaker for different genders,
                                            different grade levels, as well as for different subjects. The drop-down menu available below the activity choices
                                            allow the users to filter data to see a specific group's correlations."),
                                     tags$br(),
                                     tags$p("*Disclaimer: "),
                                      tags$ul(
                                        tags$li("The dataset we use gives three nominal values for the students' performances: high, middle, and low performances. 
                                            Students who received 69 is categorized into Low-Level performance, while students received 70 is categorized into Middle-Level performance, though their grades are very similar."),
                                        tags$li("The graph also shows the correlation between the perforamnce and the frequency of academic activity students engaged in. However, 
                                            correlation does not mean causation, and there could be other factors affecting one or both of the variable(s).")
                                      )
                                     ),
                            tabPanel("Table", dataTableOutput("scatterTable"))
                            )
                      ))),
             tabPanel("Bar Graph",
                      titlePanel('Students from which nation tend to achieve highest average academic performance?'),
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
                                     tags$br(),
                                     tags$p("We explore following questions with the bar graph"),
                                     tags$ol(
                                       tags$li("Students from which nation more actively participate in academic activities?"),
                                       tags$li("How does having higher participation affect on achieving better academic performance in each nation?")
                                     ),
                                     tags$p("The x-axis on the bar graph shows the Nationality: Egypt, Iran, Iraq, Jordan, KW, lebanon, Lybia, Morocco, Palestine, SaudiArabia, Syria, Tunis, USA, and venzuela"),
                                     tags$p("The y-axis on the bar graph shows the Level of Participation(Activity): Average of Raised hand, Visited resource, Viewing announcement, Discussion group"),
                                     tags$p("The aggregated bar graph shows the level of participation the students engage in in each country. The different color
                                            means degree of performance. The selector on the left allows users to filter students into each performance level."),
                                     tags$p("The nation where showed best academic performance is USA (about 224 times participating). The nation where showed worst academic performance is SaudiArabia (about 141 times participating).")
                            ),
                            tabPanel("Table", dataTableOutput("barTable"))
                          )
                        )
                      )
                    )
             )
  )
