library(dplyr)
rdata <- read.csv("P210302.csv")
#str(rdata)
#summary(rdata)
#is.na(rdata)
colSums(is.na(rdata))
nrow(rdata)
cs<-data.frame(colSums(is.na(rdata))/nrow(rdata))
cs<- cs%>%arrange(desc(cs))
rownames(cs)
#olnames(cs)
rownames(cs)[1]
print(rownames(cs)[1])
