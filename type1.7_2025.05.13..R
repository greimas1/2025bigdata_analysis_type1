library(dplyr)
rdata <- read.csv("P220401.csv")
str(rdata)
q1 <- quantile(rdata$y,0.25)
q3 <- quantile(rdata$y,0.75)
result <- as.integer(abs(q3-q1))
print(result)
#36
