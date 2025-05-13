library(dplyr)
rdata <- read.csv("P220402.csv")
str(rdata)
data <- rdata %>% mutate(pos=(num_loves+num_wows)/(num_reactions))
str(data)
data <- data %>% filter(pos>0.4 & pos<0.5)
result <- nrow(data)
print(result)
#90
