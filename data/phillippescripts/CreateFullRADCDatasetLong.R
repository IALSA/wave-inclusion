## Project title: 
##    Created at: 05.02.2015
##        Author: Philippe Rast
##          Data: dataset_285_long03-2014.xlsx & dataset_285_basic03-2014.xlsc
##       Summary: Coversion from long to wide (cf. CreateFullRADCDataset.R) yielded some duplicate entries in the 
##                original excell datafile. Here, errors are removed and new long dataset is written (radc_long.dat)
## ---------------------------------------------------------------------- ##

## Changelog:
##
## 2015-Feb-17: Added new variables from "IALSA Cross sectional 02-2015.csv" (wich is derived from ../SOURCE/IALSA Cross sectional 02-2015.xlsx) that Andrea mailed me on 02/13/15.
##              Note, new file has approx 220 participants more than old one.
##              New Variables in this dataset: Married, and Married2

#radcWide <- read.csv('dataset_285_basic03-2014.csv').

radcLong <- read.csv('dataset_285_long03-2014.csv')

radcWide <- read.csv('IALSA Cross sectional 02-2015.csv') # 


##
head(radcWide)
head(radcLong)

which(radcLong$fu_year==20)

## Note, some lines in radcLong have double entries
## 'reshape' deals with it, by taking only first instance - which seems to work fine
radcLong[radcLong$projid==10200901,]
radcLong[radcLong$projid==00831405,]
radcLong[radcLong$projid==01225511,]

## 1) make long wide
library(reshape)


measures <- names(radcLong)[c(-1,-2,-3,-4)]
measures

max(radcLong$fu_year)

test <- reshape(radcLong, v.names=measures,timevar='fu_year', idvar='projid', direction="wide")
test[1:15,]



## merge both data sources
radc <- merge(x=radcWide, y=test, by='projid', all.x=TRUE)
radc[1:50,]

names(radc)

### write to long

varnames <- names(radc)[30:1814] # time-varying start at cesdsum.0
varnames

radcLong2 <- reshape(data=radc, varying=varnames, idvar="projid", times=0:20, direction='long')

radcLong2[1:150,]

## drop rows if participant did not show up
radcLong3 <- radcLong2[!is.na(radcLong2$age_at_visit),]

radcLong3[radcLong3$projid==20261037,]

## compute exact time in study
radcLong3$time.yr <- radcLong3$age_at_visit - radcLong3$age_bl

write.table(radcLong3, file='radc_long.dat', row.names=F)

write.csv(radcLong3[-3], file='radc_long.csv', row.names=F)
