library(dplyr)
rdata <-read.csv("mtcars.csv")
view(rdata)
#str(rdata)
#summary(rdata)

head(rdata)

rdata$qsec <- (rdata$qsec-min(rdata$qsec))/(max(rdata$qsec)-min(rdata$qsec))

sum(rdata$qsec>0.5)

#9

#다른방법
data <- rdata %>% filter(qsec>0.5)
nrow(data)
