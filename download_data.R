setwd("C:/Users/ranish.bera/Documents/Online Courses/Data Science Specialization/Part-5-Reproducible Research/Project/Data")##Sets working directory
download.file('https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip', destfile='Data.zip', method='curl')##Downloads data in working directory
unzip('Data.zip')##Unzips the data
data = read.csv("activity.csv", header = TRUE)##Loads teh data in the variable data in R
