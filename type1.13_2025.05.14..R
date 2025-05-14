library(dplyr)
library(lubridate)
rdata <- read.csv("P230601.csv")
str(rdata)
rdata$신고일시 <- ymd_hm(rdata$신고일시)
rdata$출동일시 <- ymd_hm(rdata$출동일시)
str(rdata)
#rdata$출동시간 <- difftime(rdata$신고일시, rdata$출동일시)
rdata$출동시간 <- difftime(rdata$출동일시, rdata$신고일시)
#data <- rdata %>% arrange(desc(출동시간))

data <- rdata %>% group_by(출동소방서, year(신고일시), month(신고일시)) %>% 
  summarise(평균시간=mean(출동시간)) %>% arrange(desc(평균시간))

str(data)
result <- data$평균시간[1]/60
print(result)
#1441