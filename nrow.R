housing<-read.csv("P210202.csv")

#str(housing)

#c(1:nrow(housing)*0.8)



df<-housing[c(1:(nrow(housing)*0.8)),]
#str(df)
#summary(df)
a<-sd(df$total_bedrooms, na.rm=TRUE)
median_train<-median(df$total_bedrooms, na.rm=TRUE)
df$total_bedrooms[is.na(df$total_bedrooms)]<-medaian_train
b<-sd(df$total_bedrooms)
round(abs(a-b),2)
