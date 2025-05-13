library(dplyr)
library(lubridate)
rdata <- read.csv("P220403.csv")
str(rdata)
rdata$date_added <- mdy(rdata$date_added)
#country, chr
#date_added, chr
#release_year,int
rdata <- rdata %>% mutate(month=month(date_added))
rdata <- rdata %>% mutate(year=year(date_added))

#data <- rdata %>% filter(release_year==2018, month==1, country =="United Kingdom")
data <- rdata %>% filter(year==2018, month==1, country =="United Kingdom")
result <- nrow(data)
print(result)
#30
