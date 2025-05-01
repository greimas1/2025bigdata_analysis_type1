library(dplyr)
library(lubridate)
rdata <- read.csv("P220403.csv")
#str(rdata)
#$rdata$date_added <- ymd(rdata$date_added)
rdata$date_added <- mdy(rdata$date_added)
#year(rdata$date_added)
#month(rdata$date_added)
#country=="Untied Kingdom"
#data <- rdata %>% filter(year(date_added)==2018 & month(date_added)=1 & country=="Untied Kingdom")
data <- rdata %>% filter(year(date_added)==2018 & month(date_added)==1 & country=="United Kingdom")

nrow(data)
