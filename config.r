# Function Cross-Section Slice Volume Graphing

####################
# Traced Functions #
####################

# tracefunc
# Controlls the function that serves as the 
# upper bound of slicing region. In this case, 
# per the problem, it is set to sqrt(x). Hence, 
# slices will be bounded below by y=0 (the x-axis) 
# and top by sqrt(x). Given the x value, user 
# should return the corresponding y-value for the top
# bound function.

tracefunc <- function(x) {
    sqrt(x)
}

# crossfunc
# This is the function that controlls which 
# type of crossection to use. The function gets passed 
# a value x, representing the x-axis value at which the 
# slice resides (we are slicing perpendicularly to the
# x-axis) and a range of y values. This function should
# return a vector of z-values corresponding to each point
# on the (x, y_i) values as matched to the y_range input 
# vector.
#
# Also, a series of built-in slice shapes are provided as 
# seperate functions that you could call and simply pass 
# the parameters in. Feel free to uncomment those in 
# as you see fit.

crossfunc <- function(x, y_range) {
    crossfunc_semicircle(x, y_range)
}

# max_range
# controls the largest domain calculations reach. This could
# theoretically be infinitely large, but as we calculate the 
# values all in one go, the larger this value is the longer
# a graph will take to render.

max_domain <- 30

#########################
# Interface Parametres  #
#########################

# fill_shape
# controls whether or not the slices get filled in. For some 
# reason filling slices in take significantly longer.

fill_shape <- FALSE

# step_size
# controls the change in x-value needed before a new slice is
# rendered. In the default case, a slice is rendered every 0.5 
# steps in the x-axis

step_size <- 0.5

# crosssection_fidelity
# controls the change in y-value needed before a new point for
# the z-axis is plotted for slicing. The smaller this value, the
# more precise shapes like circles would be. However, this would
# obviously make the code run longer the smaller this value is.

crosssection_fidelity <- 0.1

