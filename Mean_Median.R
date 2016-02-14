##Mean and Median
##Finds the mean and median of the data for Steps

steps_mean = mean(data$steps, na.rm=TRUE)##Stores the mean in the variable steps_mean
steps_median = median(data$steps, na.rm = TRUE)##Stores the median in the variable steps_median

print(paste("Mean Steps per Day: ", steps_mean))##Printsthe mean
print(paste("Median Steps per Day: ", steps_median))##Printsthe median
