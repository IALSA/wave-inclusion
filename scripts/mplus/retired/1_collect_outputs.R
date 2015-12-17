## This script 
options(width=160)
rm(list=ls())
cat("\f")

## @knitr load_packages
library(dplyr)
library(ggplot2)
library(tidyr)
library(MplusAutomation)

# ## @knitr load_raw_data
# ds0 <- readRDS("./data/derived/unshared/ds0.rds") # raw MAP data
# ds <- ds0
# str(ds)


## @knitr run_models
# point to the folder with the input files you want to run
# grip_categories <- "C:/Users/koval_000/Documents/GitHub/RADC/reports/grip_categories"
grip_categories <- "C:/Users/koval_000/Documents/GitHub/RADC/reports/grip_digitsymbols"
# run all models in the folder
MplusAutomation::runModels(directory=grip_categories )#, Mplus_command = Mplus_install_path)


## @knitr get_results
# establish home directory
pathDir <- getwd() 
# point to  the folder with Mplus output files you want to extract
# pathFolder <- file.path(pathDir,"data/raw/extending_waves/")
# pathFolder <- file.path(pathDir,"reports/grip_digitsymbols/")
# pathFolder <- file.path(pathDir,"./reports/grip_categories/")
pathFolder <- file.path(pathDir,"./reports/grip_digitsymbols/")


# extract info from model outputs
out_list_all <- list.files(pathFolder, full.names=T, recursive=T, pattern="out$")
out_list_all

# load the complex functions that carry out extraction of values from the outputs
# collect the extracted values into a dataframe "results"
# source("./scripts/extract/0_extraction_functions.R")
source("./scripts/extract/0_extraction_functions_new.R")
# save the file containing processed models
# destination <- "./data/derived/ds_grip_categories"
destination <- "./data/derived/ds_grip_digitsymbols"
write.csv(results, paste0(destination,".csv") , row.names=F)
saveRDS(results, paste0(destination,".rds") )


