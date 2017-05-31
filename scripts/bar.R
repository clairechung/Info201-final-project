BuildBar <- function(data, yvar) {
  # group data by its nationality and class(test scores)
  # sum up value of Raised hand, Visited resources, Viewing announcements, Discussion groups
  # to find how much students participated in class in each nation (also what level did they get from the test)
  group.data <- group_by(data, NationalITy, Class) %>% 
    summarise(mean.activity = mean(raisedhands + VisITedResources + AnnouncementsView + Discussion)) %>%
    arrange(Class, NationalITy)
  
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

BarTable <- function(data, yvar) {
  table.data <- group_by(data, NationalITy, Class) %>% 
    summarise(raisedhands = round(mean(raisedhands), digits = 1), VisITedResources = round(mean(VisITedResources), digits = 1), 
              AnnouncementsView = round(mean(AnnouncementsView), digits = 1), Discussion = round(mean(Discussion), digits = 1),
              mean.activity = mean(raisedhands + VisITedResources + AnnouncementsView + Discussion)) %>%
    arrange(Class, NationalITy)
  
  if(yvar == "High Performance") {
    table.data <- filter(table.data, Class == 3)
  } else if (yvar == "Middle Performance") {
    table.data <- filter(table.data, Class == 2)
  } else if (yvar == "Low Performance") {
    table.data <- filter(table.data, Class == 1)
  }
  return(table.data)
}