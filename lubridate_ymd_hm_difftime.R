library(dplyr)
library(lubridate)

rdata<- read.csv("P230601.csv")
#str(rdata)

summary(rdata)
head(rdata)

colnames(rdata) <- c("call_time", "arrive_time", "fire_station")

rdata$call_time <- ymd_hm(rdata$call_time)
rdata$arrive_time <- ymd_hm(rdata$arrive_time)
rdata$diff_time <- difftime(rdata$arrive_time, rdata$call_time, units="secs")
#str(rdata)

#data <- rdata %>% group_by(fire_station, year(call_time), month(call_time)) %>% 
  #summarise(mean_time = mean(diff_time)) %>% arrange(-mean_time)

data <- rdata %>% 
  group_by(fire_station, year(call_time), month(call_time)) %>% 
  summarise(mean_time = mean(diff_time), .groups = "drop") %>% 
  arrange(desc(mean_time))

head(data$mean_time)

res_date <- head(data$mean_time, 1)
res_num <- as.numeric(res_date)/60
