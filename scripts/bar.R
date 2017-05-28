BuildBar <- function(data, yvar) {
  # group data by its nationality and class(test scores)
  # sum up value of Raised hand, Visited resources, Viewing announcements, Discussion groups
  # to find how much students participated in class in each nation (also what level did they get from the test)
  group.data <- group_by(data, NationalITy, Class) %>% 
    summarise(mean.activity = mean(raisedhands+ VisITedResources+ AnnouncementsView+ Discussion)) %>%
    arrange(Class, NationalITy)
  
  # 3 indicates high level (score of 90 - 100), 
  # 2 indicates middle level (70 - 89), 1 indicates low level (0-69)
  group.data$Class <- gsub('H', 3, group.data$Class)
  group.data$Class <- gsub('M', 2, group.data$Class)
  group.data$Class <- gsub('L', 1, group.data$Class)
  
  # choose different data set as user input
  if(yvar == "High Performance") {
    group.data <- filter(group.data, Class == 3)
  } else if (yvar == "Middle Performance") {
    group.data <- filter(group.data, Class == 2)
  } else if (yvar == "Low Performance") {
    group.data <- filter(group.data, Class == 1)
  }
  
  # for margin of grapgh
  m <- list(l = 80, r = 50, b = 80, t = 20, pad = 4)
  
  # makes bar graph; xaxis is nationality of students and yaxis is active participation in class
  return(plot_ly(group.data, x = ~group.data$NationalITy, y = ~group.data$mean.activity, 
                 type = 'bar', color = group.data$Class) %>%
           layout(yaxis = list(title = 'Level of Participation'), xaxis = list(title = 'Nationality'), barmode = 'stack', margin = m, height = 500)
  )
}