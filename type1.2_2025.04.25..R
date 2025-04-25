rdata <- read.csv("P210202.csv")

data <- rdata[c(1:(nrow(rdata)*0.8)),]

#str(data)

#summary(data)

a <- sd(data$total_bedrooms, na.rm = TRUE)

median_train <- median(data$total_bedrooms, na.rm = TRUE)

data$total_bedrooms[is.na(data$total_bedrooms)] <- median_train

b <- sd(data$total_bedrooms, na.rm = TRUE)

round(abs(a-b),2)
