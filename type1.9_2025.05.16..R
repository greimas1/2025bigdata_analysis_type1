library(dplyr)
library(lubridate)
rdata <- read.csv("P220403.csv")

#str(rdata)
rdata$date_added <-mdy(rdata$date_added) 
#rdata$country

rdata <- rdata %>% mutate(year=year(date_added))
rdata <- rdata %>% mutate(month=month(date_added))
#data <- rdata %>% filter(year(date_added)=2018 & month(date_added)=1 & country=="United Kingdom")
#data <- rdata %>% filter(year=2018 & month=1 & country=="United Kingdom")
data <- rdata %>% filter(year==2018 & month==1 & country=="United Kingdom")



print(nrow(rdata))
#8807

################################################
library(dplyr)
library(lubridate)
rdata <- read.csv("P220403.csv")

#str(rdata)
rdata$date_added <-mdy(rdata$date_added) 
#rdata$country

rdata <- rdata %>% mutate(year=year(date_added))
rdata <- rdata %>% mutate(month=month(date_added))
#data <- rdata %>% filter(year(date_added)=2018 & month(date_added)=1 & country=="United Kingdom")
#data <- rdata %>% filter(year=2018 & month=1 & country=="United Kingdom")
data <- rdata %>% filter(year(date_added)==2018 & month(date_added)==1 & country=="United Kingdom")



print(nrow(data))
#8807
30
