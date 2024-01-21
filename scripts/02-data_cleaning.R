#### Preamble ####
# Purpose: Cleans two raw datasets MHA apprenhsions and police annual report and combine into one dataset. 
# Author: Mingjia Chen
# Date: 20 January 2024 
# Contact: mingjia.chen@mail.utoronto.ca 
# License: MIT
# Pre-requisites: 
  # 01-download_data.R

#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(janitor)

#### Clean data ####

## Mental Health Act Apprehensions 
raw_mentalHealth_data <- read_csv("inputs/data/raw_mentalHealth_data.csv")

cleaned_mentalHealth_data <-
  clean_names(raw_mentalHealth_data)

cleaned_mentalHealth_data <-
  select(cleaned_mentalHealth_data, report_year, division, sex, age_cohort)

names(cleaned_mentalHealth_data)[names(cleaned_mentalHealth_data) == "report_year"] <- "year"
cleaned_mentalHealth_data <- na.omit(cleaned_mentalHealth_data)

## Police Annual Report
raw_crime_data <- read_csv("inputs/data/raw_crime_data.csv")

cleaned_crime_data <-
  clean_names(raw_crime_data)

cleaned_crime_data <-
  select(cleaned_crime_data, arrest_year, division, arrest_count)

names(cleaned_crime_data)[names(cleaned_crime_data) == "arrest_year"] <- "year"
cleaned_crime_data <- na.omit(cleaned_crime_data)

## Combine two data sets for comparisons
summerized_MHA_data <- cleaned_mentalHealth_data |> group_by(year,division) |> count() |> ungroup()
summerized_C_data <- cleaned_crime_data |> group_by(year,division) |> summarise_at(vars(arrest_count), list(name=sum)) |> ungroup()

summerized_MHA_data$type = rep("MHA", times = nrow(summerized_MHA_data))
summerized_C_data$type = rep("ALL", times = nrow(summerized_C_data))

names(summerized_MHA_data)[names(summerized_MHA_data) == "n"] <- "counts"
names(summerized_C_data)[names(summerized_C_data) == "name"] <- "counts"

merged_data <- rbind(summerized_MHA_data,summerized_C_data)

#### Save data ####
write.csv(cleaned_mentalHealth_data , "inputs/data/cleaned_mentalHealth_data.csv") 
write.csv(cleaned_crime_data, "inputs/data/cleaned_crime_data.csv")
write.csv(merged_data, "inputs/data/summerized_report_data.csv")
