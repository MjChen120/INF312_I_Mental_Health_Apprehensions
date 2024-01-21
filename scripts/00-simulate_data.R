#### Preamble ####
# Purpose: Simulate the dataset of MHA Apprehensions for code testing
# Author: Mingjia Chen
# Date: 20 January 2024 
# Contact: mingjia.chen@mail.utoronto.ca 
# License: MIT
# Pre-requisites: none


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####
set.seed(114514)
num_observations = 100
number_of_years = 10

simulated_data = 
  tibble(
    year = rep(c(1:number_of_years + 2013), 2),
    division = rep(c(1:number_of_years),2),
    counts =  runif(n = number_of_years * 2, min = 0, max = 100),
    type = c(rep("MHA",number_of_years),rep("ALL",number_of_years))
  )


simulated_data|>
  ggplot(aes(x = year, y = counts, color = type)) +
  geom_point() +
  theme_minimal() +
  labs(x = "Year", y = "Number of Reports and Arrests", color = "Type") +
  scale_color_brewer(palette = "Set1") +
  theme(legend.position = "bottom")

simulated_data|>
  ggplot(aes(x = division, y = counts, color = type)) +
  geom_point() +
  theme_minimal() +
  labs(x = "Division", y = "Number of Reports and Arrests", color = "Type") +
  scale_color_brewer(palette = "Set1") +
  theme(legend.position = "bottom")


