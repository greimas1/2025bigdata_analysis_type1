library(dplyr)
who<-read.csv("P210303.csv")
summary(who)
str(who)
who<-who[,c("year","country","new_sp")]
