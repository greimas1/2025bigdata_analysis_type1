library(dplyr)

rdata <- read.csv("P210203.csv")

#str(rdata)
#summary(rdata)

upper <- mean(rdata$charges) + 1.5*sd(rdata$charges)
lower <- mean(rdata$charges) - 1.5*sd(rdata$charges)

data <- rdata %>% filter (charges >= upper & charges <= lower) %>% summarise(sum=sum(charges))
