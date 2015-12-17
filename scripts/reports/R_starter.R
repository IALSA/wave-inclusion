rm(list=ls(all=TRUE)) #Clear the memory of variables from previous run. This is not called by knitr, because it's above the first chunk.
cat("\f") # clear console



## @knitr load_packages
library(dplyr) # for data manipulation
library(tidyr) # for data handling
library(ggplot2) # for graphing
library(scales) #for formating values in graphs
library(testit, quietly=TRUE) #for asserts

## @knitr load_paths

## @knitr load_scripts

## @knitr load_data

## @knitr tweak_data

## @knitr basic_table

## @knitr basic_graph


## @knitr reproduce
#   rmarkdown::render(input = "./reports/report.Rmd" ,
#                     output_format="html_document", clean=TRUE)