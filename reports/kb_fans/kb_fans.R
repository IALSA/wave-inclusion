rm(list=ls(all=TRUE)) #Clear the memory of variables from previous run. This is not called by knitr, because it's above the first chunk.
cat("\f") # clear console

# @knitr declare_globals  --------------------------------------------------------
# point to  the folder with datasets containing model results
pathFolder <- "./outputs/pairs/"


# @knitr load_sources ------------------------------------------------------------
# create a object with main_theme definition
source("./scripts/graphs/main_theme.R")  

# create objects containing the names of grouped columns
#e.g pc_TAU_00 <- c("pc_TAU_00_est", "pc_TAU_00_se", "pc_TAU_00_wald","pc_TAU_00_pval")
source("./scripts/mplus/group_variables.R") 

# load functions to process mplus objects
source("http://www.statmodel.com/mplus-R/mplus.R") # load

# functions for kb_fan plots
source("./scripts/graphs/kb_fans_functions.R")

# @knitr load_packages -----------------------------------------------------------
library(magrittr) # for data manipulation
library(ggplot2) # for graphing
library(scales) #for formating values in graphs
library(MplusAutomation) # for extracting gh5
requireNamespace("testit", quietly=T) #Asserts necessary conditions are true.
requireNamespace("dplyr", quietly=T) #Data manipulation.
requireNamespace("plyr", quietly=T) #Data manipulation.
requireNamespace("tidyr", quietly=T) #Data manipulation.



# @knitr load_data ---------------------------------------------------------------
# pathRDS <- "./data/derived/grip_numbercomp_10.rds"

# lsPlot <- get_ds_Plot(process1="grip", process2="numbercomp", wave_count=13) # disable after first run
# saveRDS(lsPlot, "./data/derived/dstemp.rds")
lsPlot <- readRDS("./data/derived/dstemp.rds")
cat("\f")
lapply(lsPlot,names)
# convert list into datasets
ds_all <- plyr::ldply(lsPlot[["female"]]["cognitive"], data.frame)

# @knitr tweak_data --------------------------------------------------------------
set.seed(42)
(small_sample <- sample(unique(ds_all$id),100))
# ds <- ds_all #Later on, you might replace the code below with this one.
ds <- ds_all[ds_all$id %in% small_sample, ]
ds[ds_all$id==unique(ds_all$id)[1], ]

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

# @knitr basic_table -------------------------------------------------------------

# @knitr basic_graph -------------------------------------------------------------
kb_fans(process1="grip", process2="numbercomp", wave_count=10,
                     subgroup="female", outcome="cognitive", sample=50)
# @knitr time_observed -----------------------------------------------------------
g <- make_plot(d=ds, temporal_name="time", dv_name="observed")
g

# @knitr time_fixed_effects ------------------------------------------------------
g <- make_plot(d=ds, temporal_name="time", dv_name="fixed_effects")
g

# @knitr time_factor_scores ------------------------------------------------------
g <- make_plot(d=ds, temporal_name="time", dv_name="factor_scores")
g

# @knitr age_observed ------------------------------------------------------------
g <- make_plot(d=ds, temporal_name="age", dv_name="observed")
g

# @knitr age_fixed_effects -------------------------------------------------------
g <- make_plot(d=ds, temporal_name="age", dv_name="fixed_effects")
g

# @knitr age_factor_scores -------------------------------------------------------
g <- make_plot(d=ds, temporal_name="age", dv_name="factor_scores")
g

# @knitr combine_graphs ----------------------------------------------------------
kb_fans(process1="grip", process2="numbercomp", wave_count=16,
                     subgroup="female", outcome="cognitive", sample=50)

# @knitr reproduce ---------------------------------------------------------------
rmarkdown::render(input = "./reports/kb_fans/kb_fans.Rmd" ,
                  output_format="html_document", clean=TRUE)
