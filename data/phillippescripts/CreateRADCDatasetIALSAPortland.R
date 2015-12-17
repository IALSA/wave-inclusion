## Project title: RADC WIDE
##    Created at: 05.02.2015
##        Author: Philippe Rast, Cassandra Brown
##          Data: dataset_285_long03-2014.xlsx & dataset_285_basic03-2014.xlsc
##       Summary: xlsx can't be read into R, needs to be converted to csv.
##                Make it all wide
## ---------------------------------------------------------------------- ##


## Changelog:
##
## 2015-Feb-17: Added new variables from "IALSA Cross sectional 02-2015.csv" (wich is derived from ../SOURCE/IALSA Cross sectional 02-2015.xlsx) that Andrea mailed me on 02/13/15.
##              Note, new file has approx 220 participants more than old one.
##              New Variables in this dataset: Married, and Married2
## 2015-Oct-08: Individuals who develop dementia are removed from the data file.

#radcWide <- read.csv('dataset_285_basic03-2014.csv')
pathFile <- getwd()
radcLong <- read.csv(paste0(pathFile,"/data/raw/unshared/dataset_285_long03-2014.csv"))
radcWide <- read.csv(paste0(pathFile,"/data/raw/unshared/IALSA Cross sectional 02-2015.csv"))

## Sanity check
head(radcWide)
head(radcLong)

which(radcLong$fu_year==20)

length(radcWide[,1])
length(radcWideAddon[,1])

## Note, some lines in radcLong have double entries
## 'reshape' deals withit, by taking only first instance - which seems to work fine
radcLong[radcLong$projid==10200901,]
radcLong[radcLong$projid==00831405,]
radcLong[radcLong$projid==01225511,]

## 1) make long wide
library(reshape)

measures <- names(radcLong)[c(-1,-2,-3,-4)]
measures

max(radcLong$fu_year)

radcLong$fu_year.f <- sprintf("%02d", radcLong$fu_year)

test <- reshape(radcLong, v.names=measures,timevar='fu_year.f', idvar='projid', direction="wide")
test[1:15,]


test[,c(-1,-2,-3,-4)]
test2 <- test[,order(names(test))]
names(test2)

test2[1:10, ]


for(i in 1:21){
    test2[,paste0('T',i-1)] <- test2[,i]-test2[,1]}

length(test2[,1])
length(radcWide[,1])

length(unique(radcWide$projid))
length(unique(radcLong$projid))
## Note: Wide has 214 ppl. more

## merge both data sources
radc <- merge(x=radcWide, y=test2, by='projid', all.x=TRUE)
radc[1:50,]

names(radc)

write.table(radc, file="radc_wide.dat", na='-9999', row.names=F, col.names=F)

## Write out full CSV dataset
write.csv(radc[,-3], 'radc_wide.csv', row.names=F)

## For Cassandra
## write.table(radc, file="./brown/radc_wide.dat", na='-9999', row.names=F, col.names=T)

write.table(names(radc), file='radc_wide_Variablenames.txt', row.names=F, col.names=F, quote=F)


## filter out individuals who develop dementia
radc<-dplyr::filter(radc, dementia.00!=1, dementia.01!=1, dementia.02!=1, dementia.03!=1,
            dementia.04!=1, dementia.05!=1, dementia.06!=1, dementia.07!=1, dementia.08!=1,
            dementia.09!=1, dementia.10!=1, dementia.11!=1, dementia.12!=1, dementia.13!=1,
            dementia.14!=1, dementia.15!=1, dementia.16!=1, dementia.17!=1, dementia.18!=1,
            dementia.19!=1, dementia.20!=1)

radc<-dplyr:filter(radc, dementia.00!=1 & dementia.01!=1 &dementia.02!=1 & dementia.03!=1 &
             dementia.04!=1 & dementia.05!=1 & dementia.06!=1 & dementia.07!=1 & dementia.08!=1 &
             dementia.09!=1 & dementia.10!=1 & dementia.11!=1 & dementia.12!=1 & dementia.13!=1 &
             dementia.14!=1 & dementia.15!=1 & dementia.16!=1 & dementia.17!=1 & dementia.18!=1 &
             dementia.19!=1 & dementia.20!=1)

## write out only MAP project data
radcMAP <- radc[radc$study.x=="MAP",]
length(radcMAP$projid)

write.table(radcMAP, file="radcMAP_wide.dat", na='-9999', row.names=F, col.names=F)

## For SAS consumption

write.table(radc, file="radc_wide.dat", NA='.', row.names=F, col.names=F)

## Write out full CSV dataset
write.csv(radc[,-3], 'radc_wide.csv', row.names=F)

### write radcMAP to long

varnames <- names(radc)[30:1814] # time-varying start at cesdsum.0
varnames

radcLong2 <- reshape(data=radcMAP, varying=varnames, idvar="projid", times=0:20, direction='long')

radcLong2[1:150,]

## drop rows if participant did not show up
radcLong3 <- radcLong2[!is.na(radcLong2$age_at_visit),]

radcLong3[radcLong3$projid==20261037,]

## compute exact time in study
radcLong3$time.yr <- radcLong3$age_at_visit - radcLong3$age_bl

write.table(radcLong3, file='radc_long.dat', row.names=F)

write.csv(radcLong3[-3], file='radc_long.csv', row.names=F)




## ## Note, some lines in radcLong had double entries
## ## compare age afer and before reshaping.
## radc[radc$projid==00831405,c('age_at_visit.0')]
## radc[radc$projid==00831405,c('age_at_visit.1')]
## radc[radc$projid==00831405,c('age_at_visit.2')]
## radc[radc$projid==00831405,c('age_at_visit.3')]
## radc[radc$projid==00831405,c('age_at_visit.4')]
## radc[radc$projid==00831405,c('age_at_visit.5')]
## radc[radc$projid==00831405,c('age_at_visit.6')]
## radc[radc$projid==00831405,c('age_at_visit.7')]
## radc[radc$projid==00831405,c('age_at_visit.8')]
## radc[radc$projid==00831405,c('age_at_visit.9')]
## radcLong[radcLong$projid==00831405,'age_at_visit']


## radc[radc$projid==01225511,c('age_at_visit.0')]
## radc[radc$projid==01225511,c('age_at_visit.1')]
## radc[radc$projid==01225511,c('age_at_visit.2')]
## radc[radc$projid==01225511,c('age_at_visit.3')]
## radc[radc$projid==01225511,c('age_at_visit.4')]
## radc[radc$projid==01225511,c('age_at_visit.5')]
## radc[radc$projid==01225511,c('age_at_visit.6')]
## radc[radc$projid==01225511,c('age_at_visit.7')]
## radc[radc$projid==01225511,c('age_at_visit.8')]
## radc[radc$projid==01225511,c('age_at_visit.9')]
## radcLong[radcLong$projid==01225511,'age_at_visit']



## stem(radcLong$fu_year, width=0)
