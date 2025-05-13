library(dplyr)
rdata <- read.csv("P210202.csv")
#data <- rdata[nrow(rdata)*0.8,]
data <- rdata[1:nrow(rdata)*0.8,]
str(data)
summary(data)
#data$total_bedrooms(is.na[data$total_bedrooms])<-median(data$total_bedrooms,na.rm=TRUE)
a <- sd(data$total_bedrooms, na.rm=TRUE)
data$total_bedrooms[is.na(data$total_bedrooms)]<-median(data$total_bedrooms,na.rm=TRUE)
b <- sd(data$total_bedrooms, na.rm=TRUE)
result <- round(abs(a-b),2)
print(result)
#1.96