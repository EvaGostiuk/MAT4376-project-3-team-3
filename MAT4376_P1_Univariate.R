library(readr)
clean.data <- read_csv("polls_us_election_2016_v4.csv")
str(clean.data)

#general descriptive statistics - univariate

#trump
hist(clean.data$rawpoll_trump) #normal
hist(clean.data$adjpoll_trump) #normal
#clinton
hist(clean.data$rawpoll_clinton) #normal - skewed
hist(clean.data$adjpoll_clinton) #normal - skewed
#johnson
hist(clean.data$rawpoll_johnson) #chi square? 
hist(clean.data$adjpoll_johnson) #normal - skewed
#mcmullin - N/A
hist(clean.data$rawpoll_mcmullin) #N/A
hist(clean.data$adjpoll_mcmullin) #N/A

hist(clean.data$grade)
hist(clean.data$state)
hist(clean.data$poll_wt)
hist(clean.data$duration) # mostly >10 months(?)
hist(clean.data$samplesize) #not very nice


clean.data$pollster
length(unique(clean.data$pollster)) 
unique(clean.data$pollster) #196 unique pollsters

library(dplyr)
#frequency of pollsters
as.data.frame(table(clean.data$pollster)) %>%
  arrange(desc(Freq))

#frequency of states
as.data.frame(table(clean.data$state)) %>%
  arrange(desc(Freq))


clean.data$poll_wt

#pollsters weight - sum
pollster_weights <- aggregate(clean.data$poll_wt ~ clean.data$pollster, data = clean.data, sum)
pollster_weights
knitr::kable(pollster_weights, caption = "Pollster Weights Table")

##sorted weights
poll_weight <-clean.data$poll_wt
library(dplyr)
pollster_weights <- aggregate(poll_weight ~ clean.data$pollster, data = clean.data, sum)
pollster_weights <- pollster_weights[order(pollster_weights$poll_weight, decreasing = FALSE), ]
knitr::kable(pollster_weights, caption = "Pollster Weights Sorted Table")

#pollsters duration - average
pollster_duration <- aggregate(clean.data$duration ~ clean.data$pollster, data = clean.data, mean)
pollster_duration
knitr::kable(pollster_weights, caption = "Pollster Duration Table")

##sorted duration
duration <- clean.data$duration
pollster_duration <- aggregate(duration ~ clean.data$pollster, data = clean.data, mean)
pollster_duration <- pollster_duration[order(pollster_duration$duration, decreasing = FALSE), ]
knitr::kable(pollster_duration, caption = "Pollster Duration Sorted Table")

#pollsters grade- sorted average
grade <- clean.data$grade
pollster_grade <- aggregate(grade ~ clean.data$pollster, data = clean.data, mean)
pollster_grade <- pollster_grade[order(pollster_grade$grade, decreasing = FALSE), ]
knitr::kable(pollster_grade, caption = "Pollster Grade Sorted Table")



