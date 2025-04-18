df<-read.csv("P220401.csv")
#summary(df)
#str(df)

df_quantile<-quantile(df[,"y"])
df_quantile

q1<-df_quantile[2]
q3<-df_quantile[4]
print(as.integer(abs(q3-q1)))
