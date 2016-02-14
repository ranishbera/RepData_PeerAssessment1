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
