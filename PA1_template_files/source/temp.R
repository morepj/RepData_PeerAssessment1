x <- rnorm(100, sd =0.5)
mean(x, na.rm = TRUE)
setwd("/data/courses/reproduce-research/work/reproduce-research/RepData_PeerAssessment1")
dat <- read.csv("activity.csv", header=TRUE)
dat <- transform(dat, date <- factor(date))
str(dat)

steps.per.day <- tapply(dat$steps, dat$date, sum, na.rm = TRUE)
str(steps.per.day)
names(steps.per.day)
steps.per.day["2012-10-02"]
steps <- data.frame(steps.per.day, names(steps.per.day))
hist(steps$steps.per.day, breaks = length(steps.per.day), xlab = " Number of Steps Each Day", main = "Histogram of Steps Taken Each Day")
mu <- mean(steps.per.day, na.rm = TRUE)
median <- median(steps.per.day, na.rm = TRUE)
mu
median

dat <- transform(dat, interval = ordered(as.numeric(interval)))
str(dat)
avg.steps.per.interval <- tapply(dat$steps, dat$interval, mean, na.rm = TRUE)
head(avg.steps.per.interval)
names(avg.steps.per.interval)
avg.steps <- data.frame(steps = avg.steps.per.interval, interval = as.numeric(names(avg.steps.per.interval)))
plot(x = avg.steps$interval, y = avg.steps$steps, type = "l", xlab = "Interval", ylab = "Steps", main = "Average Steps per Interval")

avg.steps[which.max(avg.steps$steps), 2]

foo <- function(x = 1, y = 2) c(x, y)
bar <- function(n, x) replicate(n, foo(x = x))
bar(5, x = 3)
x <- list(a = 1:10, beta = exp(-3:3), logic = c(TRUE,FALSE,FALSE,TRUE))
x
