library(dplyr)
rdata <- read.csv("P210203.csv")
str(rdata)
up <- mean(rdata$charges)+1.5*sd(rdata$charges)
low <- mean(rdata$charges)-1.5*sd(rdata$charges)
#data <- rdata %>% filter(charges>up & charges<low)

#data <- rdata %>% filter(charges>=up | charges=<low)
data <- rdata %>% filter(charges>=up | charges<=low)
result <- sum(data$charges)
print(as.integer(result))
#6421430

-------------------------------------------------------------------
library(dplyr)
rdata <- read.csv("P210203.csv")
str(rdata)
up <- mean(rdata$charges)+1.5*sd(rdata$charges)
low <- mean(rdata$charges)-1.5*sd(rdata$charges)
#data <- rdata %>% filter(charges>up & charges<low)

#data <- rdata %>% filter(charges>=up | charges=<low)
result <- rdata %>% filter(charges>=up | charges<=low) %>% summarise(sum=sum(charges))
#result <- sum(data$charges)
print(as.integer(result))
#6421430