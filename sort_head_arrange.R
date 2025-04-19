library(dplyr)

rdata<-read.csv("P230602.csv")
str(rdata)
summary(rdata)
head(rdata)
rdata$teacher_student<-(rdata$student_1 + rdata$student_2 + rdata$student_3 +
                          rdata$student_4 + rdata$student_5 + rdata$student_6)/rdata$teacher

data<- rdata %>% arrange(-teacher_student)

head(data$teacher, 1)

result <- head(data$teacher, 1)

print(result)
