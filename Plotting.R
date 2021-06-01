library("tidyverse")
library("plotly")

step_size <- 0.1

xass <- c(0:(10/step_size)*step_size)
yass <- sapply(xass, sqrt)

fig <- plot_ly(x=xass, y=yass, z=0, type='scatter3d', mode="lines")
fig <- fig %>% add_trace(x=9)
fig <- fig %>% add_trace(y=0)
fig



