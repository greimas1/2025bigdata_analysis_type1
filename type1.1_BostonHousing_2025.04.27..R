#### 1. BostonHousing filter(age80이상), data$crim 평균 구하기 ####

library(dplyr)
rdata <- read.csv("P210201.csv")
data1 <- rdata %>% arrange(desc(crim))
tenth <- data1$crim[10]
data1$crim <- ifelse(data1$crim > tenth, tenth, data1$crim)

data <- data1 %>% filter(age >= 80)
print(round(mean(data$crim),2))

#### 2. ####




