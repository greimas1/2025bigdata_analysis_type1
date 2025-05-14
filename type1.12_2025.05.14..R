library(dplyr)
rdata <- read.csv("P220503.csv", fileEncoding = "euc-kr")
str(rdata)
#전입학생수.계.
#전출학생수.계.
data <- rdata %>% mutate(순전입학생수=전입학생수.계.-전출학생수.계.)
data <- data %>% arrange(desc(순전입학생수))
#rownames(data$순전입학생수)[1]
#rowname(data$순전입학생수)
#rowname(data$순전입학생수)
#data$학교명[1]
#rownames(data)[1]
print(data$학교명[1])
#print(data$학교명[1])
print(data$전체학생수.계.[1])
#956