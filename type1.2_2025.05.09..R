library(dplyr)
rdata <- read.csv("P210202.csv")
#str(rdata)
#summary(rdata)

#idx <- sample(1:nrow(rdata), 0.8*nrow(rdata))
#train <- rdata[idx,]
#data <- as.data.frame(train)

data <- rdata[1:(nrow(rdata)*0.8),]

#a <- sd(data, na.rm = TRUE)
a <- sd(data$total_bedrooms, na.rm = TRUE)
#median(data$total_bedrooms, )
#median(data$total_bedrooms, na.rm=TRUE)
#is.na(data$total_bedrooms)<-median(data$total_bedrooms)
#data$total_bedrooms[is.na(data$total_bedrooms)]<-median(data$total_bedrooms)
data$total_bedrooms[is.na(data$total_bedrooms)]<-median(data$total_bedrooms, na.rm=TRUE)
b <- sd(data$total_bedrooms)
#str(data)
#a <- sd(train, na.rm=TRUE)
#print(round(abs(a-b),3))
print(round(abs(a-b),2))
#1.796
#2.09

#1.98
