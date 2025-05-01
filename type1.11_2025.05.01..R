library(dplyr)
rdata <- read.csv("P220502.csv")
#str(rdata)

rdata$bmi <- rdata$Weight/((rdata$Height)/100)^2

#data1 <- rdata %>% filter(bmi<23 )
data1 <- rdata %>% filter(bmi<23 & bmi>=18.5)

#data2 <- rdata %>% filter(bmi<25)
data2 <- rdata %>% filter(bmi<25 & bmi >= 23)

nrow(data1) # 47
nrow(data2) #19
print(as.integer(abs(nrow(data2)-nrow(data1))))
# 28
