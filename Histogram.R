##Histogram
##Plots the histogram of Steps Taken Every Day


steps_by_date = aggregate(steps~date,data = data, sum)##Finds the sum of steps for each date and saves the new object
hist(steps_by_date$steps, main = "Total Steps per Day", xlab = "Steps", ylab = "Frequency")##Plots the histogram, default number of steps
