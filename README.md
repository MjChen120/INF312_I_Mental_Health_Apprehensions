# Starter folder

## Overview

This repo consists a data analysis project associated with *Telling Stories with Data*. This paper analyzes possible demographic factors and impacts of Mental Health Act (MHA) Apprenhsions in Toronto area. Specifically, the report speculates the relationship between gender, age cohort, police station division (i.e. neighbourhood), and total number of police annual reports over the years. 

## File Structure

The repo is structured as:

-   `input/data` contains the data sources used in analysis including the raw data.
-   `outputs/data` contains the cleaned dataset that was constructed.
-   `outputs/paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.

## How to Run

1.  Run `scripts/01-download_data.R` to download raw data
2.  Run `scripts/02-data_cleaning.R` to generate cleaned data
3.  Run `outputs/paper/MHA_study.qmd` to generate the PDF of the paper

## Statement on LLM usage
No LLMs were used for any of the creation in this repo.
