#P210303.csv
library(dplyr)
rdata <- read.csv("P210303.csv")
#str(rdata)
data <- rdata[,c("country","year","new_sp")]
data1 <- na.omit(data)

data2 <- data1 %>% filter(year==2000)
mean_sp <- mean(data2$new_sp)

#str(data)
#summary(data)
#mean(data1$new_sp)
#data2 <- data1%>%group_by(year, country)%>% summarise(mean_sp=mean(new_sp))%>%arrange(desc(mean_sp))
#data3 <- data2 %>% filter(year==2000)

data3 <- data2 %>% filter(new_sp >= mean_sp)


nrow(data3)

print(nrow(data3))
#38
#sum(data3$mean_sp>mean(data1$new_sp))
#31

#############################
#P210303.csv
library(dplyr)
rdata <- read.csv("P210303.csv")
#str(rdata)
data <- rdata[,c("country","year","new_sp")]
data1 <- na.omit(data)
data2 <- data1 %>% filter(year==2000)
mean_sp <- mean(data2$new_sp)
data3 <- data2 %>% filter(new_sp >= mean_sp)
nrow(data3)
print(nrow(data3))

#########################################

library(dplyr)
rdata <- read.csv("P210303.csv")
#str(rdata)
data <- rdata[,c("country","year","new_sp")]
data1 <- na.omit(data)
data2 <- data1%>%group_by(year, country)%>% summarise(mean_sp=mean(new_sp))%>%arrange(desc(mean_sp))
data3 <- data2 %>% filter(year==2000)
sum(data3$mean_sp>mean(data1$new_sp))
