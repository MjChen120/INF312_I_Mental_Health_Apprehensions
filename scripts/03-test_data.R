#### Preamble ####
# Purpose: Basic tests codes for loaded dataset.
# Author: Mingjia Chen
# Date: 20 January 2024 
# Contact: mingjia.chen@mail.utoronto.ca 
# License: MIT
# Pre-requisites: 
  # 00-simulate_data.R
  # 01-download_data.R
  # 02-data_cleaning.R

#### Workspace setup ####
library(tidyverse)


#### Test data ####

data$type |>
  unique() == c("MHA", "ALL")

data$type |>
  unique() |> length() ==2

data$year |> min() == 2014
data$year |> max() == 2023
data$counts |> min() >= 0
data$counts |> max() <= 10000
data$counts |> class() == "numeric"


