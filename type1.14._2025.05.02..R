#220602.csv
library(dplyr)
#rdata <- read.csv("P230602.csv", fileEncoding="euc-kr")
rdata <- read.csv("P230602.csv")
#str(rdata)
rdata$student_tot <- 
rdata$student_1 + rdata$student_2 +rdata$student_3 + rdata$student_4 +rdata$student_5 + rdata$student_6

rdata$stu_teach<-rdata$student_tot/rdata$teacher

data <- rdata %>% arrange(desc(stu_teach))

#str(data)

#result <- data$school_name[1]
#print(result)
#"대구삼육초등학교"

result <- data$teacher[1]
print(result)
#6