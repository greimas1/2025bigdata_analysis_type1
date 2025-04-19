library(dplyr)

rdata<-read.csv("P230603.csv")

str(rdata)
summary(rdata)
head(rdata)
colnames(rdata) <- c("ym", "a", "b", "c", "d", "e", "f")
rdata$crim_sum <- rdata$a + rdata$b + rdata$c + rdata$d + rdata$e + rdata$f

data <- rdata %>% group_by(substr(ym,1,4)) %>% 
  summarise(year_sum = sum(crim_sum)) %>%
  arrange(-year_sum)

head(data)

data2 <- rdata %>% filter(substr(ym, 1,4) =="2013")

res_mean <- mean(data2$crim_sum)
result <- round(res_mean)
print(result)
