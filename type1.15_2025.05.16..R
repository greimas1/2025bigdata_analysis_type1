library(dplyr)
rdata <- read.csv("P230603.csv")
#str(rdata)
#년월 강력범 절도범 폭력범 지능범 풍속범 기타형사범
rdata$범죄수 <- rdata$강력범 + rdata$절도범 + rdata$폭력범 + rdata$지능범 + rdata$풍속범 + rdata$기타형사범
#rdata$year <- as.integer(substr(년월,1,4))
rdata$year <- as.integer(substr(rdata$년월,1,4))
#str(rdata)

#data <- rdata %>% group_by(year(substr(rdata$년월,1,4)), 범죄수) %>% arrange(desc(범죄수))
#data <- rdata %>% group_by(substr(rdata$년월,1,4), 범죄수) %>% arrange(desc(범죄수))

#data <- rdata %>% group_by(year, 범죄수) %>% summarise(연도별범죄수=sum(범죄수)) %>% 
  #arrange(desc(범죄수))

data <- rdata %>% group_by(year) %>% summarise(연도별범죄수=sum(범죄수)) %>% 
  arrange(desc(연도별범죄수))

str(data)


print(data$year[1]) #2013


data <- rdata %>% filter(year==2013)
result <-mean(data$범죄수)
print(result)
#19329.25