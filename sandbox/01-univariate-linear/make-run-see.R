options(width=160)
rm(list=ls())
cat("\f")

library(dplyr)
library(tidyr)
library(ggplot2)


pathRoot <- getwd()
pathFolder <- file.path(pathRoot,"sandbox/syntax-creator/outputs")

requireNamespace("ggplot2")
requireNamespace("dplyr") #Avoid attaching dplyr, b/c its function names conflict with a lot of packages (esp base, stats, and plyr).
requireNamespace("testit")
requireNamespace("reshape2") # data transformations
requireNamespace("data.table") # data transformations
requireNamespace("MplusAutomation")
requireNamespace("stringr")


#e.g pc_TAU_00 <- c("pc_TAU_00_est", "pc_TAU_00_se", "pc_TAU_00_wald", "pc_TAU_00_pval")
source("./sandbox/01-univariate-linear/group-variables.R") # selected_results
# load functions that generate scripts
source("./sandbox/01-univariate-linear/functions-to-generate-Mplus-scripts.R")
# load functions that process the output files and create a summary dataset
source("./scripts/mplus/extraction-functions.R")

# create a object with main_theme definition
source("./scripts/graphs/main-theme.R")


## look at the data
source("./sandbox/01-univariate-linear/look-at-data.R")
str(dw)
## Run the lines above to load the needed functions
## Execute script snippets for each pair individually below this


############################################################ GRIP #####
## @knitr dummy_1
# Use the first example as the template for further pairs
# from "./sandbox/syntax-creator/functions_to_generate_Mplus_scripts.R"
make_script_waves(
  prototype = "sandbox/01-univariate-linear/prototype-map-wide.inp"
  ,place_in = "sandbox/01-univariate-linear/example"
  ,process_a_name = 'numbercomp'# measure name
  ,process_a_mplus = 'cts_nccrtd'# Mplus variable
  ,subgroup_sex = "male" #
  ,covariates = "Bage Educat Height"
  ,wave_set_possible = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16)  #Integer vector of the possible waves of the study, ie 1:16,
  ,wave_set_modeled =  c(1,2,3,4,5)   #Integer vector of waves considered by the model, ie c(1,2,3,5,8).
  ,run_models = FALSE
) # generate mplus scripts from a prototype, estimate (run_models=TRUE)


# from "./sandbox/syntax-creator/extraction_functions.R  script
# collect_model_results(folder = "./sandbox/syntax-creator/outputs/grip_digitsymbols") # collect and save into the same folder
# ds <- readRDS(paste0(pathFolder,".rds")) # load the data for outcome pair
# from "./scripts/graphs/koval_brown_profiles.R"
# kb_profiles(ds,  vertical="wave_count",  border=5) # produces the kb_profile graph




#### Grip - Boston Naming Task ####

# from "./sandbox/syntax-creator/extraction_functions.R  script
collect_model_results(folder = "outputs/pairs/grip_bnt") # collect and save into the same folder
ds <- readRDS(file.path(pathFolder,"grip_bnt.rds")) # load the data for outcome pair
# from "./scripts/graphs/koval_brown_profiles.R"
kb_profiles(ds,  vertical="wave_count",  border=5) # produces the kb_profile graph





