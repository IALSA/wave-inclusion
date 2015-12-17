options(width=160)
rm(list=ls())
cat("\f")

## @knitr load_packages
library(dplyr)

## @knitr setPaths

pathDir <- getwd() # establish home directory
pathFileBL <- file.path(pathDir,"data/raw/dataset_285_basic_03-2014.csv")
pathFileLong <- file.path(pathDir,"data/raw/dataset_285_long_03-2014.csv")

## @knitr load_data
BL_raw <- read.csv(pathFileBL) # baseline measure
Long_raw <- read.csv(pathFileLong) # longitudinal observations

(namesBL <- names(BL_raw))
(namesLong <- names(Long_raw))

intersect(namesBL, namesLong) # common variables

str(BL_raw$projid)
str(BL_raw$study)
str(BL_raw$scaled_to)

str(Long_raw$projid)
str(Long_raw$study)
str(Long_raw$scaled_to)

table(BL_raw$scaled_to)
table(BL_raw$study)

table(Long_raw$scaled_to)
table(Long_raw$study)


# ds0 <- dplyr::full_join(BL_raw, Long_raw, by = c("projid","study", "scaled_to"))
ds0 <- dplyr::full_join(BL_raw, Long_raw, by = c("projid","study"))

ds0 <- dplyr::rename(ds0, id=projid)
saveRDS(ds0,"./data/derived/ds0.rds")

###################### Dev code below this line ###############################
## @knitr rename_id


dplyr::n_distinct(ds0$id) # subjects

varnames <- as.data.frame(variable.names(ds0) )
varnames

