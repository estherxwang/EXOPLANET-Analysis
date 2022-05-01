### Preamble ###
# Purpose: Import original exoplanet data
# Author: Dingding Wang
# Contact: esther.wang@mail.utoronto.ca
# Date: 2022-04-30
# Pre-requisites: None
# to-dos:


### Workspace setup ###
library(tidyverse)
library(haven)

### Import data ###

# read in the exoplanet data
exoplanet = read.csv("kepler.csv")

exoplanet_data <- exoplanet %>%
  # convert detection, planet status, star mass and radius, discovery year and metallicity in to grouping factor
  mutate(detection = as.factor(detection_type),
         planet_status = as.factor(exoplanet$planet_status),
         star_mass_group = case_when(star_mass <= 1 ~ "low mass star",
                                     star_mass > 1~ "high mass star"),
         star_radius_group = case_when(star_radius <=1 ~ "small star",
                                       star_radius >1 ~ "large star"),
         mass_group = case_when(mass <= 1 ~ "low mass planet",
                                mass > 1~ "high mass planet"),
         radius_group = case_when(radius <=1 ~ "small planet",
                                  star_radius >1 ~ "large planet"),
         discovery_group = case_when(discovered < 1993 & discovered >= 1988 ~ "1988-1992",
                                     discovered < 1998 & discovered >= 1993 ~ "1993-1997",
                                     discovered >= 1998 & discovered < 2003 ~ "1998-2002",
                                     discovered >= 2003 & discovered < 2008 ~ "2003-2007",
                                     discovered >= 2008 & discovered < 2013 ~ "2008-2012",
                                     discovered >= 2013 ~ "After 2013"),
         metallicity_group = case_when(star_metallicity <= 0 ~ "Metal Poor Star",
                                       star_metallicity > 0 ~ "Metal Rich Star"),
         temperature_group = case_when(star_teff <= 5780 ~ "Colder than Sun",
                                       star_teff > 5780 ~ "Hotter than Sun")) %>%
  # select the important variables for analysis
  dplyr::select(X..name, mass, radius, orbital_period, eccentricity, discovered, 
                detection_type, mass_detection_type, radius_detection_type, ra, dec, 
                star_distance, star_metallicity, star_mass, star_radius, star_age, 
                star_teff, detection, mass_group, radius_group, star_mass_group, 
                star_radius_group, discovery_group, metallicity_group,temperature_group)

# writing the data

write_csv(exoplanet_data, "Inputs/Data/exoplanet_data.csv")
