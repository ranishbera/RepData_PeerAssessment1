##Plots the Steps wrt Interval

steps_by_interval = aggregate(steps~interval, data = data, mean, na.rm = TRUE)
plot(steps_by_interval$interval,steps_by_interval$steps, type = "l", main = "Average Steps per Five Minute Interval", xlab = "Interval No", ylab = "Steps")##Plots the graph for steps in any given interval
max_steps = max(steps_by_interval$steps)##Stores max_steps in an interval
print(paste("Maximum number of steps in a five minute interval: ", max_steps))##Prints max_steps
