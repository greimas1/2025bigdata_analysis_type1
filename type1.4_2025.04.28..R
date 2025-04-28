library(dplyr)
rdata<-read.csv("P210301.csv")
summary(rdata)
#rdata$total_bedrooms <- na.omit(rdata$total_bedrooms)

rdata <- rdata %>% filter(!is.na(rdata$total_bedrooms))

idx <- sample(1:nrow(rdata), nrow(rdata)*0.7)

train <- rdata[idx,]

#str(train)

quantile(train$housing_median_age)

q1 <- quantile(train$housing_median_age)[2]

print(as.integer(q1))
