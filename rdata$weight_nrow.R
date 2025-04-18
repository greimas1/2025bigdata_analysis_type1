rdata <- read.csv("P220502.csv")
rdata$bmi = rdata$Weight / ((rdata$Height/100)^2)
normal <- rdata %>% filter (bmi >= 18.5 & bmi <23)

cnt_normal <- nrow(normal)
#cnt_normal

overweight <- rdata %>% filter (bmi >= 23 & bmi <25)
cnt_overweight <- nrow(overweight)

as.integer(abs(cnt_normal - cnt_overweight))
