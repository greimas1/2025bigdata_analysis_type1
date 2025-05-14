library(dplyr)
library(lubridate)
rdata <- read.csv("P230603.csv")
#str(rdata)
rdata$year <- substr(rdata$년월,1,4)
#str(rdata)
rdata$year <- as.integer(rdata$year)
#rdata$범죄수 <- sum(rdata$강력범,rdata$절도범, rdata$폭력범, rdata$지능범, rdata$풍속범, rdata$기타형사범)
rdata$범죄수 <- rdata$강력범 + rdata$절도범 + rdata$폭력범 + rdata$지능범 + rdata$풍속범 + rdata$기타형사범
str(rdata)
#data <- rdata 
#%>% group_by(year) %>% summarise(평균범죄=mean(rdata[,c("강력범","절도범","폭력범","지능범","풍속범","기타형사범")]))
#data <- rdata%>%mutate(평균범죄=mean(rdata$강력범, rdata$절도범, rdata$폭력범, rdata$지능범, rdata$풍속범, rdata$기타형사범))
data <- rdata %>% group_by(year) %>% summarise(월평균범죄=mean(범죄수))
str(data)
data <- data %>% arrange(desc(월평균범죄))
result <- data$월평균범죄[1]
print(result)
# 19329.25
