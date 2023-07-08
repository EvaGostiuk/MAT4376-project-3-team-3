#### ab_data set ####
data1 <- ab_data_2_

#frequencies of the variables
install.packages("dplyr")
library(dplyr)
##frequency of landing page
as.data.frame(table(data1$landing_page)) %>%
  arrange(desc(Freq))
## frequency of timestamp
as.data.frame(table(data1$timestamp)) %>%
  arrange(desc(Freq))

## categorizing timestamp to hour and days
install.packages("lubridate")
library(lubridate)
timestamps <-data1$timestamp
timestamps <- as.POSIXct(timestamps, format = "%Y-%m-%d %H:%M:%S")
day <- as.Date(timestamps)
time <- format(timestamps, format = "%H")
data <- data.frame(timestamps, day, time)
print(data)

## frequency of days
as.data.frame(table(day)) %>%
  arrange(desc(Freq))

## frequency of hours
as.data.frame(table(time)) %>%
  arrange(desc(Freq))

## frequency of useres
users <- data1$user_id
as.data.frame(table(users)) %>%
  arrange(desc(Freq))

# hist on landing page
library(ggplot2)
page <- data1$landing_page
ggplot(data.frame(page), aes(x=page)) +
  geom_bar()

#hist on converted
library(ggplot2)
converted <- data1$converted
ggplot(data.frame(converted), aes(x=converted)) +
  geom_bar()


#### mimic 3d set ####

data2 <- mimic3d_2_

hist(data2$age)
admit <- data2$admit_type

# hist on admission type -> most frequent is emergency
library(ggplot2)
ggplot(data.frame(admit), aes(x=admit)) +
  geom_bar()

# hist on marital status
library(ggplot2)
marry <- data2$marital_status
ggplot(data.frame(marry), aes(x=marry)) +
  geom_bar()

#hist on religion
library(ggplot2)
religion <- data2$religion
ggplot(data.frame(religion), aes(x=religion)) +
  geom_bar()

#hist on gender
library(ggplot2)
sex <- data2$gender
ggplot(data.frame(sex), aes(x=sex)) +
  geom_bar()

#age sorted
age <-data2$age
library(dplyr)
age_sort <- aggregate(age ~ data2$age, data = data2, mean)
age_sort <- age_sort[order(age_sort$poll_weight, decreasing = FALSE), ]
knitr::kable(age_sort, caption = "Pollster Weights Sorted Table")

