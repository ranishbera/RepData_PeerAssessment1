#Ranish Bera
##Submission
This is Coursera Reproducible Research First Assignment
###About The Assignment
Practice:-
1. Loading data
2. Exploring data to get first hand grasp of data
3. Input missing values
## Data
The data for this assignment was downloaded from the course web
site:

* Dataset: [Activity monitoring data](https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip) [52K]

The variables included in this dataset are:

* **steps**: Number of steps taking in a 5-minute interval (missing
    values are coded as `NA`)

* **date**: The date on which the measurement was taken in YYYY-MM-DD
    format

* **interval**: Identifier for the 5-minute interval in which
    measurement was taken

The dataset is stored in a comma-separated-value (CSV) file and there are a total of 17,568 observations in this dataset.

## Loading and preprocessing the data
Download, unzip and load data into data frame `data`
```r
setwd("C:/Users/ranish.bera/Documents/Online Courses/Data Science Specialization/Part-5-Reproducible Research/Project/Data")##Sets working directory
download.file('https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip', destfile='Data.zip', method='curl')##Downloads data in working directory
unzip('Data.zip')##Unzips the data
data = read.csv("activity.csv", header = TRUE)##Loads the data in the variable data in R
```
## What is mean total number of steps taken per day?
Sum steps by day, create Histogram, and calculate mean and median.
```
steps_by_date = aggregate(steps~date,data = data, sum)##Finds the sum of steps for each date and saves the new object
hist(steps_by_date$steps, main = "Total Steps per Day", xlab = "Steps", ylab = "Frequency")##Plots the histogram, default number of steps

steps_mean = mean(data$steps, na.rm=TRUE)##Stores the mean in the variable steps_mean
steps_median = median(data$steps, na.rm = TRUE)##Stores the median in the variable steps_median

print(paste("Mean Steps per Day: ", steps_mean))##Printsthe mean
print(paste("Median Steps per Day: ", steps_median))##Printsthe median
```
## What is the average daily activity pattern?

* Calculate average steps for each interval for all days. 
* Plot the Average Number Steps per Day by Interval. 
* Find interval with most average steps. 

```
steps_by_interval = aggregate(steps~interval, data = data, mean, na.rm = TRUE)
plot(steps_by_interval$interval,steps_by_interval$steps, type = "l", main = "Average Steps per Five Minute Interval", xlab = "Interval No", ylab = "Steps")##Plots the graph for steps in any given interval
max_steps = max(steps_by_interval$steps)##Stores max_steps in an interval
print(paste("Maximum number of steps in a five minute interval: ", max_steps))##Prints max_steps
```
## Impute missing values. Compare imputed to non-imputed data.
Missing data needed to be imputed. I chose median as the imputed value for each missing value
```
##Taking Care of Missing Data


missing_data = sum(is.na(data$steps))##Stores the number of missing data (NA) in a variable
print(paste("Missing Data: ", missing_data))


##Replacing Missing Data with Median

data_new = data
data_new$steps[is.na(data_new$steps)] = median(data$steps, na.rm = TRUE)##Stores teh new data with NA value replaced by median


##Plots

data_new_day = aggregate(steps~date, data = data_new, sum)##Stores day-wise steps data in a variable
hist(data_new_day$steps, main = "Total Steps per Day, Better Data", xlab = "Steps", ylab = "Frequency")##Plots the required histogram


##New Means and Median

steps_mean_new = mean(data_new$steps)##New mean
steps_median_new = median(data_new$steps)##New median

print(paste("The new mean is ", steps_mean_new))
print(paste("The new median is ", steps_median_new))
```
## Are there differences in activity patterns between weekdays and weekends?
Created a plot to compare and contrast number of steps between the week and weekend. There is a higher peak earlier on weekdays, and more overall activity on weekends. 
```
##Analyse the data for weekend and weekday pattern

library(lattice)
data_new$date = as.Date(data_new$date)
data_new$dayname = weekdays(data_new$date)
data_new$weekend = as.factor(ifelse(data_new$dayname == "Saturday"|data_new$dayname == "Sunday", "weekend", "weekday"))
plotdata = aggregate(steps ~ interval + weekend, data_new, mean)##
xyplot(steps ~ interval | factor(weekend), data=plotdata, aspect=1/3, type="l")
```

