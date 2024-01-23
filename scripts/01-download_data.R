#### Preamble ####
# Purpose: Downloads and saves the data from the library 'opendatatoronto'
# Author: Mingjia Chen
# Date: 20 January 2024 
# Contact: mingjia.chen@mail.utoronto.ca 
# License: MIT
# Pre-requisites: none
# Datasets:
  # Mental Health Act Apprehensions from https://open.toronto.ca/dataset/mental-health-apprehensions/
  # Police Annual Statistical Report - Arrested and Charged Persons from https://open.toronto.ca/dataset/police-annual-statistical-report-arrested-and-charged-persons/

#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)


#### Download data ####

## Mental Health Act Apprehensions 
mental_health_package <- search_packages("Mental Health Act Apprehensions")

mental_health_resources <- 
  mental_health_package %>%
  list_package_resources()

raw_mentalHealth_data <- 
  mental_health_resources[4,] %>%
  get_resource()


## Police Annual Report
package <- show_package("police-annual-statistical-report-arrested-and-charged-persons")
resources <- list_package_resources("police-annual-statistical-report-arrested-and-charged-persons")
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))
raw_crime_data <- filter(datastore_resources, row_number()==1) %>% get_resource()


#### Save data ####
# change the_raw_data to whatever name you assigned when you downloaded it.
write.csv(raw_mentalHealth_data, "inputs/data/raw_mentalHealth_data.csv") 
write.csv(raw_crime_data, "inputs/data/raw_crime_data.csv") 


         
