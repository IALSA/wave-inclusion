options(width=160)
rm(list=ls())
cat("\f")

library(dplyr)
library(tidyr)
library(ggplot2)


pathRoot <- getwd()
pathFolder <- file.path(pathRoot,"sandbox/01-univariate-linear/example")

requireNamespace("ggplot2")
requireNamespace("dplyr") #Avoid attaching dplyr, b/c its function names conflict with a lot of packages (esp base, stats, and plyr).
requireNamespace("testit")
requireNamespace("reshape2") # data transformations
requireNamespace("data.table") # data transformations
requireNamespace("MplusAutomation")
requireNamespace("stringr")


#e.g ab_TAU_00 <- c("ab_TAU_00_est", "ab_TAU_00_se", "ab_TAU_00_wald", "ab_TAU_00_pval")
source("./scripts/mplus/group-variables.R") # selected_results
# load functions that process the output files and create a summary dataset
source("./scripts/mplus/extraction-functions.R")
# create a object with main_theme definition
source("./scripts/graphs/main-theme.R")


## look at the data
## Run the lines above to load the needed functions
## Execute script snippets for each pair individually below this


############################################################ GRIP #####
## @knitr dummy_1
# Use the first example as the template for further pairs
# from "./sandbox/syntax-creator/functions_to_generate_Mplus_scripts.R"

process_a_name = 'numbercomp'
process_a_mplus = 'cts_nccrtd'
subgroup_sex = "male" # switching to "female" doesn't work yet
place_in = "sandbox/01-univariate-linear/numbercomp"
wave_set_modeled =  c(1,2,3,4) 

# load functions that generate scripts
place_in_folder <- "./sandbox/01-univariate-linear/numbercomp/"

source("./sandbox/01-univariate-linear/functions-to-generate-Mplus-scripts.R")

make_script_waves(
    prototype = "sandbox/01-univariate-linear/prototype-map-wide.inp"
  , place_in = place_in
  , process_a_name = process_a_name# measure name, will appear in graphs
  , process_a_mplus = process_a_mplus# Mplus variable, will be used in estimation
  , subgroup_sex = subgroup_sex #
  , subset_condition_1 = "dementia_ever EQ 1"
  , covariate_set = c("age_c70","htm_c160", "edu_c7") 
  , wave_set_modeled =  wave_set_modeled   #Integer vector of waves considered by the model, ie c(1,2,3,5,8).
  ,run_models = FALSE
) # generate mplus scripts from a prototype, estimate (run_models=TRUE)

collect_model_results(folder = place_in) # collect and save into the same folder
 






