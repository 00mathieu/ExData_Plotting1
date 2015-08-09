getwd()

if (!file.exists("coursera/EDA")) {
  dir.create("coursera/EDA")
}

setwd("./coursera/EDA")
list.files()

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "household_power_consumption.txt")

data<-read.table("household_power_consumption.txt",header = TRUE)
