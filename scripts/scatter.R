# BuildScatter file: function that returns a plotly scatter plot
library(plotly)
library(stringr)

### Build Scatter ###
BuildScatter <- function(data, input.gender, input.grade, input.topic, activity) {
  
  output.data <- data
  
  if (input.gender != "All") {
    output.data <- filter(output.data, gender == input.gender)
  }
  if (input.grade != "All") {
    output.data <- filter(output.data, GradeID == input.grade)
  }
  if (input.topic != "All") {
    output.data <- filter(output.data, Topic == input.topic)
  }

  
  # Get x and y max
  xmax <- max(output.data[,activity]) * 1.5
  ymax <- as.numeric(max(output.data[,"Class"])) * 1.5
  x.equation <- paste0('~', activity)
  y.equation <- paste0('~', "Class")
  
  print(xmax)
  print(ymax)
  
  # Returns a plotly map with rating as a y axis and given value as a x axis
  return(plot_ly(data=output.data, x = eval(parse(text = x.equation)), 
                 y = eval(parse(text = y.equation)),
                 mode='markers', 
                 marker = list(
                   opacity = .4, 
                   size = 10
                 )) %>% 
           layout(xaxis = list(range = c(0, xmax), title = activity), 
                  yaxis = list(range = c(0, ymax), title = "Student Performance")
           )
  )
}