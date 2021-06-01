library("tidyverse")
library("plotly")

step_size <- 0.01
semicircle_fidelity <- 0.001
max_rg <- 9

xass <- c(0:(max_rg/step_size)*step_size)
yass <- sapply(xass, sqrt)

#make_semicircle <- function(x) {
    #tv <- sqrt(x)
    #th <- tv/2
    #c(tv, th)
#}

fig <- plot_ly(x=xass, y=yass, z=0, type='scatter3d', mode="lines")
fig <- fig %>% add_trace(x=9)
fig <- fig %>% add_trace(y=0)

for (x in 0:(max_rg/step_size)*step_size) {
    y_group <- c(0:(((sqrt(x)/(semicircle_fidelity))))*semicircle_fidelity)
    rad <- sqrt(x)/2
    z_group <- sapply(y_group, (function (x) sqrt(rad**2-(x-rad)**2)))

    fig <- fig %>% add_trace(x=x, y=y_group, z=z_group, type="scatter3d", mode="lines", surfaceaxis=0)
}

fig




