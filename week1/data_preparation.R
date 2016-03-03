## declaration of variables for downloading data
  fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  
  ## declaration of directory which downloaded contents stored.
  dir<-"data"

  ### downloaded zip file name
  dfile<-"EPC.zip"

## dir check
if(!file.exists(dir)) {
  dir.create(dir)
}

## download and unzip data

### make dest file path and name
dfile2<-paste(dir,dfile,sep="/")

## download file
download.file(fileURL,destfile=dfile2)
unzip(dfile2,exdir=dir)

library(tidyr)
library(dplyr)
library(lubridate)

data<-read.table("./data/household_power_consumption.txt",sep=";",header=T,nrows=2075259,na.strings = "?")

tdf <- filter(data,Date=="1/2/2007" | Date=="2/2/2007") %>% 
        mutate(DateTime=dmy(Date)+hms(Time)) %>% 
        select(-Date,-Time)