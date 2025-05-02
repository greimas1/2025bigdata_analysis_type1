#문제를 잘 못 이해한 듯.. 또 반복 
#P230603.csv
library(dplyr)
rdata <- read.csv("P230603.csv")

#str(rdata)
#data %>% 
  #rdata(rename "년월"=1, "강력범"=2, "절도범"=3, "폭력범"=4, "지능범"=5, "풍속범"=6, "기타형사범"=7)

#data <- rdata %>% 
  #rename ("년월"=1, "강력범"=2, "절도범"=3, "폭력범"=4, "지능범"=5, "풍속범"=6, "기타형사범"=7)

#data <- data %>%
#  rename(
    #년월 = 기존열이름1,
    #강력범 = 기존열이름2,
    #절도범 = 기존열이름3,
    #폭력범 = 기존열이름4,
    #지능범 = 기존열이름5,
    #풍속범 = 기존열이름6,
    #기타형사범 = 기존열이름7)

#data$substr(년월,1,4)

#data <- rdata %>%
  #group_by(substr(년월,1,4)) %>%
  #summarise(평균=rowmeans("강력범","절도범","폭력범","지능범","풍속범","기타형사범"))

#rowMeans() 함수는 문자열이 아니라 데이터프레임의 실제 열들을 받아야 합니다. 즉:
#rowMeans(data[, c("강력범", "절도범", "폭력범", "지능범", "풍속범", "기타형사범")])


rdata$연도 <- substr(rdata$년월,1,4)
#data <- rdata %>%
  #group_by(연도) %>%
  #summarise(평균=rowMeans("강력범","절도범","폭력범","지능범","풍속범","기타형사범"))

#data <- rdata %>%
  #group_by(연도) %>%
  #summarise(평균=rowMeans(rdata[,c("강력범","절도범","폭력범","지능범","풍속범","기타형사범")])

rdata <- rdata %>%
  mutate(평균 = rowMeans(rdata[,c("강력범","절도범","폭력범","지능범","풍속범","기타형사범")]))

data <- rdata %>% group_by(연도) %>% summarise(연도별평균=mean(평균)) %>% arrange(desc(연도별평균))
data$연도별평균[1]
print(data$연도별평균[1])
#3221.542
