library(dplyr)

rdata <- read.csv("P220503.csv", fileEncoding = "euc-kr")

#str(rdata)
 
data <- rdata %>% mutate(순전입학생수 = 전입학생수.계. - 전출학생수.계.) %>% arrange(desc(순전입학생수))

head(data$전체학생수.계.,1)
