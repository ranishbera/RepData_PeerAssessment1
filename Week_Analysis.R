##Analyse the data for weekend and weekday pattern

library(lattice)
data_new$date = as.Date(data_new$date)
data_new$dayname = weekdays(data_new$date)
data_new$weekend = as.factor(ifelse(data_new$dayname == "Saturday"|data_new$dayname == "Sunday", "weekend", "weekday"))
plotdata = aggregate(steps ~ interval + weekend, data_new, mean)##
xyplot(steps ~ interval | factor(weekend), data=plotdata, aspect=1/3, type="l")
