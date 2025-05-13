library(dplyr)
rdata <- read.csv("P210301.csv")
data <- rdata %>% na.omit()
data <- data[1:nrow(data)*0.7,]
str(data)
q1 <- quantile(data$housing_median_age, 0.25)
print(as.integer(q1))
#19
