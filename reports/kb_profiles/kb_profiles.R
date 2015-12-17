## This script 
options(width=160)
rm(list=ls())
cat("\f")

## @knitr load_packages
library(dplyr) # for data manipulation
library(ggplot2) # for graphing
library(scales) #for formating values in graphs
library(tidyr) #for data manipulation




## @knitr load_paths
# establish home directory
pathRoot <- getwd() 
# point to  the folder with datasets containing model results
pathFolder <- file.path(pathRoot,"outputs/pairs/")



## @knitr load_scripts
source("./scripts/graphs/main_theme.R")  # create a object with main_theme definition
# create objects containing the names of grouped columns
#e.g pc_TAU_00 <- c("pc_TAU_00_est", "pc_TAU_00_se", "pc_TAU_00_wald","pc_TAU_00_pval")
source("./scripts/mplus/group_variables.R") 
# load graphical function
source("./scripts/graphs/kb_profiles_functions.R")
## @knitr declare_globals



## @knitr load_data
# pathFolder # where outputs are
# out_list_all <- list.files(pathFolder, full.names=T, recursive=T, pattern="out$")
# directories <- list.dirs(pathFolder)
# pair_names <- basename(directories)[-1]
# pair_names <-  "grip_lmimmed"  
## @knitr tweak_data


## @kntir basic_table

# kb_profiles(ds,  vertical="wave_count",  border=5)


#######################   GRIP    #########################


## @knitr grip_matrices
ds <- readRDS(file.path(pathFolder,"grip_matrices.rds"))
# head(ds)
kb_profiles(ds,  vertical="wave_count",  border=5)


## @knitr grip_numbercomp
ds <- readRDS(file.path(pathFolder,"grip_numbercomp.rds"))
# head(ds)
kb_profiles(ds,  vertical="wave_count",  border=5)


## @knitr grip_wordlistrec
ds <- readRDS(file.path(pathFolder,"grip_wordlistrec.rds"))
# head(ds)
kb_profiles(ds,  vertical="wave_count",  border=5)






## @knitr grip_lmimmed
ds <- readRDS(file.path(pathFolder,"grip_lmimmed.rds"))
# head(ds)
kb_profiles(ds,  vertical="wave_count",  border=5)


## @knitr grip_lmdelayed
ds <- readRDS(file.path(pathFolder,"grip_lmdelayed.rds"))
# head(ds)
kb_profiles(ds,  vertical="wave_count",  border=5)



## @knitr grip_lineorientation
ds <- readRDS(file.path(pathFolder,"grip_lineorientation.rds"))
# head(ds)
kb_profiles(ds,  vertical="wave_count",  border=5)


## @knitr grip_digitsf
ds <- readRDS(file.path(pathFolder,"grip_digitsf.rds"))
# head(ds)
kb_profiles(ds,  vertical="wave_count",  border=5)



## @knitr grip_digitsb
ds <- readRDS(file.path(pathFolder,"grip_digitsb.rds"))
# head(ds)
kb_profiles(ds,  vertical="wave_count",  border=5)



## @knitr grip_complexidea
ds <- readRDS(file.path(pathFolder,"grip_complexidea.rds"))
# head(ds)
kb_profiles(ds,  vertical="wave_count",  border=5)




## @knitr grip_bostonstoryimm
ds <- readRDS(file.path(pathFolder,"grip_bostonstoryimm.rds"))
# head(ds)
kb_profiles(ds,  vertical="wave_count",  border=5)



## @knitr grip_bostonstorydelay
ds <- readRDS(file.path(pathFolder,"grip_bostonstorydelay.rds"))
# head(ds)
kb_profiles(ds,  vertical="wave_count",  border=5)



## @knitr grip_bnt
ds <- readRDS(file.path(pathFolder,"grip_bnt.rds"))
# head(ds)
kb_profiles(ds,  vertical="wave_count",  border=5)




## @knitr grip_categories
ds <- readRDS(file.path(pathFolder,"grip_categories.rds"))
# head(ds)
kb_profiles(ds,  vertical="wave_count",  border=5)


## @knitr grip_digitsymbol
ds <- readRDS(file.path(pathFolder,"grip_digitsymbol.rds"))
# head(ds)
kb_profiles(ds,  vertical="wave_count",  border=5)


## @knitr grip_wordlistimmed
ds <- readRDS(file.path(pathFolder,"grip_wordlistimmed.rds"))
# head(ds)
kb_profiles(ds,  vertical="wave_count",  border=5)

## @knitr grip_mmse
ds <- readRDS(file.path(pathFolder,"grip_mmse.rds"))
head(ds)
kb_profiles(ds,  vertical="wave_count",  border=5)




#######################   FEV    #########################
# ## @knitr fev_categories
# ds <- readRDS(file.path(pathFolder,"fev_categories.rds"))
# # head(ds)
# kb_profiles(ds,  vertical="wave_count",  border=5)
# 
# 
# ## @knitr fev_digitsymbol
# ds <- readRDS(file.path(pathFolder,"fev_digitsymbol.rds"))
# # head(ds)
# kb_profiles(ds,  vertical="wave_count",  border=5)
# 
# 
# ## @knitr fev_wordlistimmed
# ds <- readRDS(file.path(pathFolder,"fev_wordlistimmed.rds"))
# # head(ds)
# kb_profiles(ds,  vertical="wave_count",  border=5)
# 
# 
# ## @knitr fev_mmse
# ds <- readRDS(file.path(pathFolder,"fev_mmse.rds"))
# # head(ds)
# kb_profiles(ds,  vertical="wave_count",  border=5)

#######################   GAIT    #########################


## @knitr reproduce
  rmarkdown::render(input = "./reports/kb_profiles/kb_profiles.Rmd" ,
                    output_format="html_document", clean=TRUE)
