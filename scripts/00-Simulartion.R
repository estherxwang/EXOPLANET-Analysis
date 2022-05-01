# simulation

library("tidyverse")

set.seed(304)
number = 3732

datasim =  tibble(
  mass = sample(c(0:93.6), size=number, replace=TRUE),
  radius = sample(c(0:2.5), size=number, replace=TRUE),
  orbital_period = sample(c(0:730000), size=number, replace=TRUE),
  eccentricity = sample(c(0:1.196), size=number, replace=TRUE),
  discovered = sample(c(1988:2018), size=number, replace=TRUE),
  detection_type = sample(c("Microlensing", "Radial Velocity","Astrometry",
                            "Imaging","Microlensing","Primary Transit", 
                            "Other","Pulsar","TTV"),
                          size = number, replace = TRUE),
  ra = sample(c(0:360), size=number, replace=TRUE),           
  dec = sample(c(-84.23:85.74), size=number, replace=TRUE),         
  star_distance = sample(c(1.295:8500), size=number, replace=TRUE), 
  star_metallicity = sample(c(-1:0.56), size=number, replace=TRUE),   
  star_mass = sample(c(0.0162:40), size=number, replace=TRUE),        
  star_radius = sample(c(0.089:51.1), size=number, replace=TRUE),        
  star_age = sample(c(0.0005:15), size=number, replace=TRUE), 
  star_teff = sample(c(0.1:33000), size=number, replace=TRUE))

# This simulation attempts to create an artificial dataset similar to the
# original dataset used for the report. 
# As we don't know the true distribution of these variables, probability sampling is used
# However, this simulation doesn't account for correlation within the covariates
