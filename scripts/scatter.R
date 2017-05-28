# BuildScatter file: function that returns a plotly scatter plot
library(plotly)
library(stringr)

### Build Scatter ###
BuildScatter <- function(data, xvar) {
  
  # Get x and y max
  xmax <- max(data[,xvar]) * 1.5
  ymax <- max(data[,"Class"]) * 1.5
  x.equation <- paste0('~', xvar)
  y.equation <- paste0('~', "Class")
  
  # Returns a plotly map with rating as a y axis and given value as a x axis
  return(plot_ly(data=data, x = eval(parse(text = x.equation)), 
                 y = eval(parse(text = y.equation)), 
                 mode='markers', 
                 marker = list(
                   opacity = .4, 
                   size = 10
                 )) %>% 
           layout(xaxis = list(range = c(0, xmax), title = xvar), 
                  yaxis = list(range = c(0, ymax), title = "Student Performance")
           )
  )
}