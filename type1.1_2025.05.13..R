library(dplyr)
rdata <- read.csv("P210201.csv")
#str(rdata)
rdata$crim <- sort(rdata$crim,decreasing=TRUE)
tenth<- rdata$crim[10]
rdata$crim <- ifelse(rdata$crim>=tenth, tenth, rdata$crim)
data <- rdata%>%filter(age>80)
result <- mean(data$crim)
#print(result,2)
print(round(result,2))
#2.69