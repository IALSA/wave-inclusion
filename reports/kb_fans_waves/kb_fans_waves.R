rm(list=ls(all=TRUE)) #Clear the memory of variables from previous run. This is not called by knitr, because it's above the first chunk.
cat("\f") # clear console



## @knitr load_packages
library(magrittr) # for data manipulation
library(ggplot2) # for graphing
library(scales) #for formating values in graphs
library(MplusAutomation) # for extracting gh5
library(RColorBrewer)
requireNamespace("testit", quietly=T) #Asserts necessary conditions are true.
requireNamespace("dplyr", quietly=T) #Data manipulation.
requireNamespace("plyr", quietly=T) #Data manipulation.
requireNamespace("tidyr", quietly=T) #Data manipulation.



## @knitr load_paths
pathRoot <- getwd() 
# point to  the folder with datasets containing model results
pathFolder <- file.path(pathRoot,"outputs/pairs/")

## @knitr load_scripts
source("./scripts/graphs/main_theme.R")  # create a object with main_theme definition
# create objects containing the names of grouped columns
#e.g pc_TAU_00 <- c("pc_TAU_00_est", "pc_TAU_00_se", "pc_TAU_00_wald","pc_TAU_00_pval")
source("./scripts/mplus/group_variables.R") 
# load functions to process mplus objects
source("http://www.statmodel.com/mplus-R/mplus.R") # load 



## @knitr load_data
# functions for kb_fan plots
source("./scripts/graphs/kb_fans_functions.R")

## @knitr tweak_data
# set.seed(42)
# (small_sample <- sample(unique(ds$id),100))
# d <- ds[ds$id %in% small_sample, ]
# d[ds$id==unique(ds$id)[1], ]

### key
# observed - observed value, extracted from gh5
# fixed_effects - predicted value; reconstructed from fixed effecte extracted from *.out files
# factor_scores - predicted value; reconstructed from factors scores in *.gh5 files
make_plot <- function(d, temporal_name="time", dv_name="observed", color_name="subgroup") {
  testit::assert("The temporal_name variable should exist in the graphed dataset.", temporal_name %in% colnames(d))
  testit::assert("The dv_name variable should exist in the graphed dataset.", dv_name %in% colnames(d))
  testit::assert("The color_name variable should exist in the graphed dataset.", color_name %in% colnames(d))
  testit::assert("The `id` variable should exist in the graphed dataset.", "id" %in% colnames(d))
  testit::assert("The `cognitive_measure` variable should exist in the graphed dataset.", "cognitive_measure" %in% colnames(d))
  testit::assert("The `physical_measure` variable should exist in the graphed dataset.", "physical_measure" %in% colnames(d))
  testit::assert("The `wave_count` variable should exist in the graphed dataset.", "wave_count" %in% colnames(d))
  
  testit::assert("The physical measure values are constant.", length(unique(d$physical_measure[1]))==1L)
  testit::assert("The color_name values are constant.", length(unique(d[1, color_name]))==1L)
  testit::assert("The wave_count values are constant.", length(unique(d$wave_count[1]))==1L)
  
  title <- paste0(d$physical_measure[1], " - ", d$cognitive_measure, " (", d[1, color_name], ")")
  x_label <- paste0(temporal_name, " (across ", d$wave_count[1], " waves)")
  
  ggplot(d, aes_string(x=temporal_name, group="id")) +
    geom_smooth(aes_string(y=dv_name), method="lm", color=alpha("salmon",.4), na.rm=T, se=F) + 
    geom_smooth(aes_string(y=dv_name, group=color_name), method="loess", color="blue", size=1, fill="gray80", alpha=.3, na.rm=T) +
    main_theme +
    labs(title=title, x=x_label)
}

## @knitr basic_graph



# ## @knitr male_cognitive_04
# kb_fans(process1="grip", process2="numbercomp", wave_count=4,
#                       subgroup="male", outcome="physical" )
# 
# ## @knitr male_cognitive_05
# kb_fans(process1="grip", process2="numbercomp", wave_count=5,
#                       subgroup="male", outcome="physical" )
# 
# ## @knitr male_cognitive_06
# kb_fans(process1="grip", process2="numbercomp", wave_count=6,
#                       subgroup="male", outcome="physical" )
# 
# ## @knitr male_cognitive_07
# kb_fans(process1="grip", process2="numbercomp", wave_count=7,
#                       subgroup="male", outcome="physical" )
# 
# ## @knitr male_cognitive_08
# kb_fans(process1="grip", process2="numbercomp", wave_count=8,
#                       subgroup="male", outcome="physical" )
# 
# ## @knitr male_cognitive_09
# kb_fans(process1="grip", process2="numbercomp", wave_count=9,
#                       subgroup="male", outcome="physical" )
# 
# ## @knitr male_cognitive_10
# kb_fans(process1="grip", process2="numbercomp", wave_count=10,
#                       subgroup="male", outcome="physical" )
# 
# ## @knitr male_cognitive_11
# kb_fans(process1="grip", process2="numbercomp", wave_count=11,
#                       subgroup="male", outcome="physical" )
# 
# ## @knitr male_cognitive_12
# kb_fans(process1="grip", process2="numbercomp", wave_count=12,
#                       subgroup="male", outcome="physical" )
# 
# ## @knitr male_cognitive_13
# kb_fans(process1="grip", process2="numbercomp", wave_count=13,
#                       subgroup="male", outcome="physical" )
# 
# ## @knitr male_cognitive_14
# kb_fans(process1="grip", process2="numbercomp", wave_count=14,
#                       subgroup="male", outcome="physical" )
# 
# ## @knitr male_cognitive_15
# kb_fans(process1="grip", process2="numbercomp", wave_count=15,
#                       subgroup="male", outcome="physical" )
# 
# ## @knitr male_cognitive_16
# kb_fans(process1="grip", process2="numbercomp", wave_count=16,
#                       subgroup="male", outcome="physical" )

###################################

## @knitr female_cognitive_04
kb_fans(process1="grip", process2="numbercomp", wave_count=4,
                      subgroup="female", outcome="physical" )

## @knitr female_cognitive_05
kb_fans(process1="grip", process2="numbercomp", wave_count=5,
                      subgroup="female", outcome="physical" )

## @knitr female_cognitive_06
kb_fans(process1="grip", process2="numbercomp", wave_count=6,
                      subgroup="female", outcome="physical" )

## @knitr female_cognitive_07
kb_fans(process1="grip", process2="numbercomp", wave_count=7,
                      subgroup="female", outcome="physical" )

## @knitr female_cognitive_08
kb_fans(process1="grip", process2="numbercomp", wave_count=8,
                      subgroup="female", outcome="physical" )

## @knitr female_cognitive_09
kb_fans(process1="grip", process2="numbercomp", wave_count=9,
                      subgroup="female", outcome="physical" )

## @knitr female_cognitive_10
kb_fans(process1="grip", process2="numbercomp", wave_count=10,
                      subgroup="female", outcome="physical" )

## @knitr female_cognitive_11
kb_fans(process1="grip", process2="numbercomp", wave_count=11,
                      subgroup="female", outcome="physical" )

## @knitr female_cognitive_12
kb_fans(process1="grip", process2="numbercomp", wave_count=12,
                      subgroup="female", outcome="physical" )

## @knitr female_cognitive_13
kb_fans(process1="grip", process2="numbercomp", wave_count=13,
                      subgroup="female", outcome="physical" )

## @knitr female_cognitive_14
kb_fans(process1="grip", process2="numbercomp", wave_count=14,
                      subgroup="female", outcome="physical" )

## @knitr female_cognitive_15
kb_fans(process1="grip", process2="numbercomp", wave_count=15,
                      subgroup="female", outcome="physical" )

## @knitr female_cognitive_16
kb_fans(process1="grip", process2="numbercomp", wave_count=16,
                      subgroup="female", outcome="physical" )

## @knitr reproduce
  rmarkdown::render(input = "./reports/kb_fans_waves/kb_fans_waves.Rmd" ,
                    output_format="html_document", clean=TRUE)