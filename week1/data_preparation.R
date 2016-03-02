## declaration of variables for downloading data
  fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  
  ## declaration of directory which downloaded contents stored.
  dir<-"data"

  ### downloaded zip file name
  dfile<-"EPC.zip"

## 0-C. dir check
if(!file.exists(dir)) {
  dir.create(dir)
}

## 0-D. download and unzip data

### make dest file path and name
dfile2<-paste(dir,dfile,sep="/")

### download file unzip it into dir folder (testing purpose. evading download file again to save time)
# if(!file.exists(dfile2) | !file.info(dfile2)$size == 62556944)
# {download.file(fileURL,destfile=dfile2);unzip(dfile2,exdir=dir)}

## download file
download.file(fileURL,destfile=dfile2)
unzip(dfile2,exdir=dir)

library(tidyr)
library(dplyr)
library(lubridate)
data<-read.table("./data/household_power_consumption.txt",sep=";",header=T,nrows=2075258,na.strings = "?")

tdf <- mutate(data,Date=dmy(data$Date)) %>% filter(Date==ymd(20070201) | Date==ymd(20070202))
tdf <- mutate(data,Date=dmy(data$Date)) %>% filter(Date==ymd(20070201))
tdf <- filter(data,Date=="1/2/2007" | Date=="2/2/2007") %>% 
        mutate(DateTime=dmy(Date)+hms(Time)) %>% 
        select(-Date,-Time)
