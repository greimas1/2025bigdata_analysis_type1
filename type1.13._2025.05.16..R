library(dplyr)
library(lubridate)
rdata <- read.csv("P230601.csv")
#str(rdata)
rdata$신고일시 <- ymd_hm(rdata$신고일시)
rdata$출동일시 <- ymd_hm(rdata$출동일시)
#rdata$평균시간 <- difftime(출동일시, 신고일시)
#rdata$평균시간 <- difftime(rdata$출동일시, rdata$신고일시, units="secs")

data <- rdata %>% group_by(출동소방서, year(신고일시)) %>% 
  summarise(월평균시간=mean(평균시간)) %>% arrange(desc(월평균시간))
str(data)
#result <- data$월평균시간[1]/60
result <- as.numeric(data$월평균시간[1])/60
result <- round(result)
print(result)
#17.4375
