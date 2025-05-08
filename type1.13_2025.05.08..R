library(dplyr)
library(lubridate)
rdata <- read.csv("P230601.csv")
#str(rdata)
#rdata$신고일시 <-ymd_hs(rdata$신고일시)
rdata$신고일시 <-ymd_hm(rdata$신고일시)
rdata$출동일시 <-ymd_hm(rdata$출동일시)
str(rdata)

#rdata$출동신고 <- diff_time(rdata$출동일시, rdata$신고일시)
#rdata$출동신고 <- diff_time(출동일시, 신고일시)
#diff_time() 함수는 존재하지 않음rdata$출동신고 <- diff_time(rdata$출동일시, rdata$신고일시)

rdata$출동신고 <- difftime(rdata$출동일시, rdata$신고일시)
rdata$연도 <- year(rdata$신고일시)
rdata$월 <- month(rdata$신고일시)

#data <- rdata %>% group_by(연도) %>% summarise(평균=mean(출동신고))
#data <- rdata %>% group_by(출동소방서, 연도, 월) %>% summarise(평균=mean(출동신고)) %>% arrange(desc(출동신고))
data <- rdata %>% group_by(출동소방서, 연도, 월) %>% summarise(평균=mean(출동신고)) %>% arrange(desc(평균))

#
#data$평균

data$평균[1]
result <- data$평균[1]/60
print(result)


#str(data)

#######

