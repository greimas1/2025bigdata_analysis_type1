library(dplyr)
rdata <- read.csv("P220502.csv")
str(rdata)
#Height
#Weight##
#정상 18.5 23
#위험 23 25
#data <- rdata %>% mutate(bmi=rdata$Weight/(rdata$Height)^2)
data <- rdata %>% mutate(bmi=rdata$Weight/((rdata$Height)/100)^2)
normal <- data %>% filter(bmi>=18.5 & bmi <23)
danger <- data %>% filter(bmi>=23 & bmi <25)
result <- abs(nrow(normal)-nrow(danger))
print(result)
#28
