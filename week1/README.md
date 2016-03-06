# Week1 Assignment for Expolatory Data Analysis
Byungju kim  
March 2, 2016  

# Introduction

This is an temporary repository for program assignments on Explolatory Data Aanalysis provided by Coursera and John's hopkins University.

Simply run [data_preparation.R](https://github.com/airbj31/04ExpDataAnalysis/blob/master/week1/data_preparation.R) to reproduce my results in your working directory..

I've used **"Individual household electric power cosumption Data set"** on coursera.

- dataset 

    [ElectricPowwerConsumption](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)

- Description: 

    Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.

---

# Review Criteria 

This is the review criteria which is written by Roger Peng, one of our instructor.

please read it carefully before you check my scripts.

## Criteria

1. Was a valid [GitHub URL](https://github.com/airbj31/04ExpDataAnalysis/tree/master/week1) containing a git repository submitted?

2. Does the GitHub repository contain at least one commit beyond the original fork?

3. Please examine the plot files in the GitHub repository. Do the plot files appear to be of the correct graphics file format?

4. Does each plot appear correct?

5. Does each set of R code appear to create the reference plot?

## Reviewing the Assignments

Keep in mind this course is about exploratory graphs, understanding the data, and developing strategies. Here's a good quote from a swirl lesson about exploratory graphs: "They help us find patterns in data and understand its properties. They suggest modeling strategies and help to debug analyses. We DON'T use exploratory graphs to communicate results."

The rubrics should always be interpreted in that context.

As you do your evaluation, please keep an open mind and focus on the positive. The goal is not to deduct points over small deviations from the requirements or for legitimate differences in implementation styles, etc. Look for ways to give points when it's clear that the submitter has given a good faith effort to do the project, and when it's likely that they've succeeded. Most importantly, it's okay if a person did something differently from the way that you did it. The point is not to see if someone managed to match your way of doing things, but to see if someone objectively accomplished the task at hand.

To that end, keep the following things in mind:

### DO

- Review the source code.

- Keep an open mind and focus on the positive.≤/li>

- When in doubt, err on the side of giving too many points, rather than giving too few.

- Ask yourself if a plot might answer a question for the person who created it.

- Remember that not everyone has the same statistical background and knowledge.

### DON'T:

- Deduct just because you disagree with someone's statistical methods.

- Deduct just because you disagree with someone's plotting methods.

- Deduct based on aesthetics.

---

## Raw data description about date/time.

- **Date** : Date in format dd/mm/yyyy

- **Time** : time in format hh:mm:ss

- **Global_active_power** : household global minute-averaged active power (in kilowatt)

- **Global_reactive_power**: household global minute-averaged reactive power (in kilowatt)

- **Voltage:** minute-averaged voltage (in volt)

- **Global_intensity:** household global minute-averaged current intensity (in ampere)

- **Sub_metering_1** : energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot  plates are not electric but gas powered).

- **Sub_metering_2** : energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.

- **Sub_metering_3** : energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

## Review Criteria.

1. Was a valid GitHub URL containing a git repository submitted?

2. Does the GitHub repository contain at least one commit beyond the original fork?
Please examine the plot files in the GitHub repository. Do the plot files appear to be of the correct graphics file format?

3. Does each plot appear correct?

4. Does each set of R code appear to create the reference plot?


---
# Strategy to solve data cleaning problem. 

Date and Time columns are recorded as character class. we need to convert it to **POSIXct POSIXt**. 

We learned lubridate packages using swirl package in the previous **Getting and Cleaning data** course.

the instruction says about **as.Date()** and **strptime()**.

Here I describe two ways of doing it, **strptime()** and **lubridate package** respectively.
(I considered that we load **ElectricPowwerConsumption dataset** into **data** )


## srtptime


```r
## strptime
head(strptime(paste(data$Date,data$Time),"%d/%M/%Y %H:%M:%S"))
```

```
## [1] "2006-12-16 17:24:00 UTC" "2006-12-16 17:25:00 UTC" "2006-12-16 17:26:00 UTC" "2006-12-16 17:27:00 UTC"
## [5] "2006-12-16 17:28:00 UTC" "2006-12-16 17:29:00 UTC"
```

## lubridate package

```r
library(lubridate)
head(dmy(data$Date)+hms(data$Time))
```

```
## [1] "2006-03-16 17:24:00 PST" "2006-03-16 17:25:00 PST" "2006-03-16 17:26:00 PST" "2006-03-16 17:27:00 PST"

## [5] "2006-03-16 17:28:00 PST" "2006-03-16 17:29:00 PST"
```

I do not know why the timezones are different in two result.

anyway, UTC and PST denotes followings (and the weekdays from above command might not be changed);

- **UTC** - [Universal Standard Time zone](http://www.timeanddate.com/time/aboututc.html)

- **PST** - [Pacific Standard Time zone](http://www.timeanddate.com/time/zones/pst)

Anyway, I creates new variable named **DateTime** from above descripted way using mutate function of dplyr and lubridate package (except head()).

---

# Content of the repositories

## Used function and R code.

- **[LoadLIB.R](https://github.com/airbj31/04ExpDataAnalysis/blob/master/week1/LoadLIB.R)**
    
    make function named **[LoadLIB()](https://github.com/airbj31/04ExpDataAnalysis/blob/master/week1/LoadLIB.R)**.
    
    this function used to load modules used in the assignment. 
    If you do not have the libraries, it stops the script.
      
- **[data_preparation.R](https://github.com/airbj31/04ExpDataAnalysis/blob/master/week1/data_preparation.R)**

    This code automatically load data, **[LoadLIB.R](https://github.com/airbj31/04ExpDataAnalysis/blob/master/week1/LoadLIB.R)** and make plots I submitted.

    this code need several minutes to finish depending on the system. because :
        
      - this code read the whole dataset 
        
      - merge date and time into DateTime column ("POSIXct POSEXt")
    
      - in this step, I used lubridate library which we learned in previous swirl lesson on **Getting and Cleaning data** course.
      
      - details are descripted in **workflow** section.

## Results

- **[plot1.png](https://github.com/airbj31/04ExpDataAnalysis/blob/master/week1/plot1.png)** Simple histogram showing distribution of Global Active Power (killowatts)

- **[plot2.png](https://github.com/airbj31/04ExpDataAnalysis/blob/master/week1/plot2.png)** simple line graph showing changes of Global Active Power between Thursday(Feb-1-2007) and Friday(Feb-2-2007).

- **[plot3.png](https://github.com/airbj31/04ExpDataAnalysis/blob/master/week1/plot3.png)**. grouped line graph showing energe sub metering changes between hursday(Feb-1-2007) and Friday(Feb-2-2007)

- **[plot4.png](https://github.com/airbj31/04ExpDataAnalysis/blob/master/week1/plot4.png)** 2 x 2 plots which shows the relationship of datetime to Global Active Power, Voltage, Energy sub metering and Global reactive power respectively. 
    
## Description of the analysis

- **README.md** this file

# Results

## PLOT1.png

![](https://raw.githubusercontent.com/airbj31/04ExpDataAnalysis/master/week1/plot1.png)

## PLOT2.png

![](https://raw.githubusercontent.com/airbj31/04ExpDataAnalysis/master/week1/plot2.png)

## PLOT3.png

![](https://raw.githubusercontent.com/airbj31/04ExpDataAnalysis/master/week1/plot3.png)

## PLOT4.png

![](https://raw.githubusercontent.com/airbj31/04ExpDataAnalysis/master/week1/plot4.png)

# Workflows and script description.

## Notes

  - all the processes are done by run source(./data_preparation.R).

  - the plotting functions (plot1.R to plot4.R) are **only valid if you have tdf dataset which is generated by data_preparation.R**. so, If you want to check the entire process and the code, please run line 1 to 57 of  data_preparation.R first before running plot#.R codes.

## STEP 1. Load required library and data

### Description about data_preparation.R

- line 1 to 57 are used to load required library and data.
- from line 58 to end, it load the raw source on github directly and make plot1, plot2, plot3 and plot4 respectively.


```r
  ## STEP 1-A. Configuration

  ### make a function to check the library installed
  ### if yes, it load the libraries.
  ### if no, stop the script.
  source("./LoadLIB.R")

  ## set locale for non-english langaage user.
  ## this is required to print weekdays in English.
  ## only valid for windows user.
  Sys.setlocale("LC_ALL","English")

  ## define the libraries we need

  lib<-c("tidyr","dplyr","lubridate")
  
  ## load libraries or stop the script
  ## please ignore some noises generated by the LoadLIB()
  ## if the script stopped and show error messages, please install the required libraries before runing whole codes.
  
  LoadLIB(lib)

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


## Download and unzip of the file
download.file(fileURL,destfile=dfile2)
unzip(dfile2,exdir=dir)

## Read Data
data<-read.table("./data/household_power_consumption.txt",sep=";",header=T,nrows=2075259,na.strings = "?")

## Filter the date following the assignment instruction.
## merge date and time in POSIxt POSIct form into DateTime variable by mutate
## deselect Date and Time variable since we do not need them anymore.

tdf <- filter(data,Date=="1/2/2007" | Date=="2/2/2007") %>% 
        mutate(DateTime=dmy(Date)+hms(Time)) %>% 
        select(-Date,-Time)
```

## STEP2 : make Plot1

  - this function is called by line 58 of data_preparation.R
  - or you can load the plot1.R and run to check its result
  - please remember that, you must load the data before running plot1.R
  
  - followings are the descriptions :


```r
  ## draw simple histogram.  
  with(tdf,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (killowatts)"))

  dev.copy(device=png, "plot1.png",unit="px",width=480,height=480)
  dev.off()
```

## STEP3 : Make Plot 2

  - this function is called by line 59 of data_preparation.R
  - or you can load the [plot2.R]("https://github.com/airbj31/04ExpDataAnalysis/blob/master/week1/plot3.R") and run to check its result
  - please remember that, you must load the data before running plot1.R
  
  - followings are the descriptions :



```r
  ## draw empty canvas with scaled as x=DateTime and y=Global_active_power

  with(tdf,plot(DateTime,Global_active_power,type="n",main="",ylab="",xlab=""))
with(tdf,lines(DateTime,Global_active_power))

  ## annotate the xlab
  title(ylab="Global Active Power (kilowatts)")
  
  dev.copy(device=png, "plot2.png",unit="px",width=480,height=480)
  dev.off()
```

## STEP4 : Make plot 3

  - this function is called by line 60 of data_preparation.R
  - or you can load the [plot3.R]("https://github.com/airbj31/04ExpDataAnalysis/blob/master/week1/plot3.R") and run to check its result
  - please remember that, you must load the data before running plot1.R
  
  - followings are the descriptions :



```r
  ## Draw empty plot
  with(tdf,plot(DateTime,Sub_metering_1,type="n",main="",ylab="",xlab=""))

  ## Draw Sub_metering1 plot with black color
  with(tdf,lines(DateTime,Sub_metering_1, col="black"))
  
  ## Draw Sub_metering_2 plot with red color
  with(tdf,lines(DateTime,Sub_metering_2, col="red"))
  
  ## Draw Sub_metering_3 plot with blue color
  with(tdf,lines(DateTime,Sub_metering_3, col="blue"))
 
  ## annotate y axis title
  title(ylab="Energey sub metering")
  
  ## make legend on top-right position 
  ##                with line symbol(lty=1)
  ##                with color (col=c("black","red","blue"))
  ##                with legend item (legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
## copy graph on screen deviceto file with 480x480 size
dev.copy(device=png, "plot3.png",unit="px",width=480,height=480)
dev.off()
```

## STEP5 : Make Plot 4.

  - this function is called by line 61 of data_preparation.R
  - or you can load the [plot4.R]("https://github.com/airbj31/04ExpDataAnalysis/blob/master/week1/plot3.R") and run to check its result
  - please remember that, you must load the data before running plot1.R
  
  - followings are the descriptions :



```r
## set 2x2 panel.
par(mfrow=c(2,2))

## draw 1st graph
with(tdf,plot(DateTime,Global_active_power,type="n",main="",ylab="",xlab=""))
with(tdf,lines(DateTime,Global_active_power))
title(ylab="Global Active Power")

# draw 2nd graph
with(tdf,plot(DateTime,Voltage,type="n",main="",ylab="Voltage",xlab="datetime"))
with(tdf,lines(DateTime,Voltage))
title(ylab="Voltage")

# draw 3rd graph
with(tdf,plot(DateTime,Sub_metering_1,type="n",main="",ylab="",xlab=""))
with(tdf,lines(DateTime,Sub_metering_1, col="black"))
with(tdf,lines(DateTime,Sub_metering_2, col="red"))
with(tdf,lines(DateTime,Sub_metering_3, col="blue"))
title(ylab="Energey sub metering")
legend("topright", lty=1, cex=0.75,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

# draw 4th graph.
with(tdf,plot(DateTime,Global_reactive_power,type="n",main="",xlab="datetime"))
with(tdf,lines(DateTime,Global_reactive_power))

## copy graph on screen deviceto file with 480x480 size
dev.copy(device=png, "plot4.png",unit="px",width=480,height=480)
dev.off()
```


