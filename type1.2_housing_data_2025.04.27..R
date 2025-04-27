library(dplyr)

rdata <- read.csv("P210202.csv")

idx <- sample(1:nrow(rdata), nrow(rdata)*0.8)

train <- rdata[idx,]

a <- sd(train$total_bedrooms, na.rm=TRUE)

#is.na(train$total_bedrooms) <- median(train$total_bedrooms)
#train$total_bedrooms[is.na(train$total_bedrooms)] <- median(train$total_bedrooms)
train$total_bedrooms[is.na(train$total_bedrooms)] <- median(train$total_bedrooms, na.rm = TRUE)


b <- sd(train$total_bedrooms)

print(round(abs(a-b),2))
