library(dplyr)

rdata <- read.csv("P210201.csv")

#str(rdata)
#summary(rdata)

#head(rdata$crim,10)

#rdata$crim %>% arrange(-crim)

#rdata %>% arrange(desc(crim)) %>% head(rdata$crim,10)


#top10 <- head(rdata$crim,10)

sort(rdata$crim, decreasing = TRUE)
head(sort(rdata$crim, decreasing = TRUE),10)
top10 <- head(sort(rdata$crim, decreasing = TRUE),10)
top10[10]
tenth <- top10[10]

rdata$crim <- ifelse(rdata$crim >= tenth, tenth, rdata$crim)

data <- rdata %>% filter(age >= 80)

round(mean(data$crim),2)

print(round(mean(data$crim),2))
