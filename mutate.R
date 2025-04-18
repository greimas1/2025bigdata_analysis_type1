library(dplyr)
rdata<-read.csv("P220402.csv")
data<-rdata %>% mutate(pos = (num_loves + num_wows)/(num_reactions))
result <- data %>% filter (pos > 0.4 & pos <0.5)
result
nrow(result)
