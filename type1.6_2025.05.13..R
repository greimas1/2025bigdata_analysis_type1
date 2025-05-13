library(dplyr)
rdata <- read.csv("P210303.csv")
rdata <- rdata %>% na.omit()
rdata <- rdata[,c("country","year","new_sp")]
str(rdata)
data <- rdata %>% filter(year==2000)
str(data)
summary(data)
mean_sp <- mean(data$new_sp)
data2000 <- data %>% group_by(country, new_sp)
#result <- nrow(data2000$new_sp > mean_sp)
result <- sum(data2000$new_sp > mean_sp)
print(result)
#38