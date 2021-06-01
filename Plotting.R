library("tidyverse")
library("plotly")

fill_shape <- FALSE
step_size <- 1
crosssection_fidelity <- 0.1
max_range <- 30
tracefunc <- function(x) {
    sqrt(3*x**2+12)
}
crossfunc <- function(x, y_range) {
    rad <- tracefunc(x)/2
    sapply(y_range, (function (x) sqrt(rad**2-(x-rad)**2)))
}

xass <- c(0:(max_range/step_size)*step_size)
yass <- sapply(xass, tracefunc)

fig <- plot_ly(x=xass, y=yass, z=0, type='scatter3d', mode="lines")
fig <- fig %>% add_trace(x=max_range)
fig <- fig %>% add_trace(y=0)

for (x in 0:(max_range/step_size)*step_size) {
    y_group <- c(0:(((tracefunc(x)/(crosssection_fidelity))))*crosssection_fidelity)
    z_group <- crossfunc(x, y_group)

    if (fill_shape)
        fig <- fig %>% add_trace(x=x, y=y_group, z=z_group, type="scatter3d", mode="lines", surfaceaxis=0)
    else
        fig <- fig %>% add_trace(x=x, y=y_group, z=z_group, type="scatter3d", mode="lines")
}

fig


