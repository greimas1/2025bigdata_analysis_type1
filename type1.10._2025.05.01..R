library(dplyr)
rdata <- read.csv("P220501.csv", fileEncoding = "euc-kr")
#str(rdata)
#종량제봉투종류
#종량제봉투용도
#X2L가격 

#data <- rdata %>% filter(종량제봉투종류="규격봉투" & 종량제봉투용도 = "음식물쓰레기" & X2L가격 !=0)
#좋은 질문이에요! 에러 메시지의 원인은 filter() 안에서 = 를 사용했기 때문입니다.
#R에서는 filter() 내 조건에서 =가 아니라 ==를 사용해야 합니다.

data <- rdata %>% filter(종량제봉투종류=="규격봉투" & 종량제봉투용도 == "음식물쓰레기" & X2L가격 !=0)

#data <- rdata %>%
#filter(종량제봉투종류 == "규격봉투" &
         #종량제봉투용도 == "음식물쓰레기" &
         #X2L가격 != 0)


as.integer(mean(data$X2L가격))
print(as.integer(mean(data$X2L가격)))
