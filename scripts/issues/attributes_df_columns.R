

## @knitr load_demo
dsDemo <- readRDS("./data/demo.rds")
str(dsDemo)

dsDemo$respnr <- as.numeric(dsDemo$respnr)
require(dplyr)
dsDemo %>% dplyr::count(bmemory1)
class(dsDemo$respnr)

## @knitr nl_function
names.labels <- function(domain, file, wave){
    ds <- dsDemo
    nl <- data.frame(matrix(NA, nrow=ncol(ds), ncol=2))
    names(nl) <- c("name","label")
      for (i in seq_along(names(ds))){
        nl[i,"name"] <- attr(ds[i], "names")
          if(is.null(attr(ds[[i]], "label")) ){
          nl[i,"label"] <- NA}else{
          nl[i,"label"] <- attr(ds[[i]], "label")  
          }
      }
    return(nl)
}
names.labels(dsDemo)


## @knitr load_zero
ds0 <- readRDS("./data/derived/ds0.rds")
str(ds0[1:2])

## @knitr add_attributes
attr(ds0$id,"label") <- "Person identifier"
attr(ds0$study,"label") <- "The particular sub-study within RADC"

## @knitr print_attributes
str(ds0[1:2])

ds0$id <- as.numeric(ds0$id)
## @knitr basic_counts
require(dplyr)
ds0 %>% dplyr::count(study)



## @knitr demo_counts
require(dplyr)
dsDemo %>% dplyr::count(bmemory1)
