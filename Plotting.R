crossfunc_semicircle <- function(x, y_range) {
    rad <- tracefunc(x)/2
    sapply(y_range, (function (x) sqrt(rad**2-(x-rad)**2)))
}

source("./config.r")

library("tidyverse")
library("plotly")

xass <- c(0:(max_domain/step_size)*step_size)
yass <- sapply(xass, tracefunc)

fig <- plot_ly(x=xass, y=yass, z=0, type='scatter3d', mode="lines", name="Main Function")
fig <- fig %>% add_trace(x=max_domain, name="Max Range")
fig <- fig %>% add_trace(y=0, name="Min Range")

for (x in 0:(max_domain/step_size)*step_size) {
    y_group <- c(0:(((tracefunc(x)/(crosssection_fidelity))))*crosssection_fidelity)
    z_group <- crossfunc(x, y_group)

    #s <- toString(paste("Crosssection", toString(x)))
    s <- sprintf("Crosssection %s",toString(x/step_size))

    if (fill_shape)
        fig <- fig %>% add_trace(x=x, y=y_group, z=z_group, type="scatter3d", mode="lines", surfaceaxis=0, name=s)
    else
        fig <- fig %>% add_trace(x=x, y=y_group, z=z_group, type="scatter3d", mode="lines", name=s)
}

fig


