library(dplyr)
rdata <- read.csv("P210303.csv")

rdata <- rdata[,c("country","year","new_sp")]
rdata <- na.omit(rdata) 

rdata2000 <- rdata %>% filter(year=="2000")
mean_cnt <- mean(rdata2000$new_sp)

print(round(mean_cnt,2))

data <- rdata2000 %>% filter(new_sp >= mean_cnt)

nrow(data)

print(nrow(data))
