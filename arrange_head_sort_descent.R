library(dplyr)

df<-read.csv("P210201.csv")
#str(df)
#head(df,10)
#sort(df$crim)%>%arrange(desc)

#df %>% arrange(desc(df))
sort(df$crim, decreasing =TRUE)

top10<-head(sort(df$crim, decreasing=TRUE),10)
#top10
#view(top10)

print(top10)

tenth<-top10[10]
print(tenth)


df$crim <- ifelse(df$crim >= tenth, tenth, df$crim)
#print(df$crim)

over80<-df %>% filter(age>=80)
summary(over80$age)

mean(over80$crim)
round(mean(over80$crim),2)
