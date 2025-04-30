library(dplyr)
rdata <- read.csv("P220401.csv")
#str(rdata)
quantile(rdata$y)
q1 <-quantile(rdata$y)[2]
q3 <-quantile(rdata$y)[4]
as.integer(q3-q1)
print(as.integer(q3-q1))
