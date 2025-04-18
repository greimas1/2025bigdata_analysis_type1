#install.packages("rlang")
library(dplyr)

rdata <- read.csv("P220501.csv", fileEncoding = "euc-kr")
#str(rdata)
#summary(rdata)

data <- rdata %>% filter(종량제봉투종류 == "규격봉투" & 종량제봉투용도 == "음식물쓰레기" & X2L가격 !=0)
as.integer(mean(data$X2L가격))
