library(dplyr)
rdata <- read.csv("P210303.csv")
str(rdata)
#rdata1 <- rdata %>% na.omit()
#rdata1 <- rdata %>% rdata[,c("country","year","new_sp")]
#이 코드에는 파이프(%>%)와 대괄호 인덱싱([ , ])이 혼합 사용되었는데, #
#그 의미가 모호하고 문법적으로도 맞지 않습니다. 또한 xj[i] 
#관련 오류 메시지(유효하지 않은 첨자의 타입 'list')는 i가 리스트로 되어 있어서 발생한 것인데, 
#이건 xj[i]를 호출할 때 i가 리스트인 경우에 일어납니다.
rdata1 <- rdata[,c("country","year","new_sp")]
#str(rdata1)
#summary(rdata1)
rdata2 <- rdata1%>% na.omit()

#data <- rdata2 %>% filter(year==2000) %>% mutate(newmean=mean(new_sp))

data <- rdata2 %>% filter(year==2000) %>% mutate(newmean=mean(new_sp))

sum(data$new_sp>data$newmean[1])
#38
###########################################

