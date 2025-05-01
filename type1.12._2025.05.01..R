#P220503.csv

library(dplyr)
rdata <- read.csv("P220503.csv", fileEncoding ="euc-kr")
str(rdata)
#전입학생수.계.
#전출학생수.계.
#순전입학생수
rdata$순전입학생수 <- rdata$전입학생수.계. - rdata$전출학생수.계.
#전체학생수.계.
data <- rdata %>% arrange(desc(순전입학생수))
#result <- data$학교명[1]
result <- data$전체학생수.계.[1]
print(result)
#섬강초등학교"
#956
