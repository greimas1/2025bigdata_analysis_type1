library(dplyr)
library(lubridate)

#rdata <- read.csv("P220601.csv")
rdata <- read.csv("P230601.csv")
#yyyy-mm-dd hh-ss
#rdata <- ymdhm(rdata)

#rdata <- ymd_hm(rdata)
#ymd_hm() 함수는 벡터(예: rdata$신고일시)에 적용해야 하는데, 
#전체 데이터프레임에 적용하면 오류가 발생합니다. 수정된 코드는 다음과 같이 작성되어야 합니다:
#str(rdata)
#view(rdata)

rdata$신고일시 <- ymd_hm(rdata$신고일시)
rdata$출동일시 <- ymd_hm(rdata$출동일시)
rdata$시간차이 <- difftime(rdata$출동일시, rdata$신고일시)


#data <- rdata %>% group_by(year(신고일시), year(출동일시)) %>% summarise()
#data <- rdata %>% group_by(출동소방서, year(출동일시), month(출동일시)) %>% summarise()
#data <- rdata %>% group_by(출동소방서, year(출동일시), month(출동일시)) %>%
  #summarise(평균시간차이=mean(시간차이))%>%arrange(desc(시간차이))

data <- rdata %>% group_by(출동소방서, year(출동일시), month(출동일시)) %>%
  summarise(평균시간차이=mean(시간차이))%>%arrange(desc(평균시간차이))

#summarise()를 통해 생성된 데이터프레임에는 평균시간차이라는 새 변수만 있고, 
#더 이상 시간차이라는 원래 변수는 존재하지 않습니다. 
#그런데 arrange(desc(시간차이))에서는 존재하지 않는 시간차이로 정렬을 시도했기 때문에
#오류가 발생했습니다.

#head(data$평균시간차이)

result <- head(data$평균시간차이,1)/60

print(round(result))
#Time difference of 64 secs
#64 <--- 코드 검토해 보아야 할 듯..
#data$출동일시




#좋습니다! 현재 작성하신 코드를 기반으로 발생한 문제와 개선 방향을 정리해드리겠습니다.
#
#❗ 문제 원인 분석
#r#
#복사
#편집
#result <- head(data$평균시간차이,1)/60
#에서 평균시간차이는 difftime() 객체이며, 단위는 "mins"입니다.
#하지만 difftime 객체를 그대로 산술 연산 /60 하면, "Time difference of xx secs" 같은 형태가 됩니다.

#즉, difftime 객체와 숫자를 직접 나누면 결과가 또 difftime 형식으로 나와 헷갈리는 결과(예: 64 secs)가 됩니다.

#✅ 해결 방법: as.numeric()으로 변환
#r#
#복사#
#편집
#result <- as.numeric(head(data$평균시간차이, 1))  # 이미 분 단위임
#final_result <- round(result * 2) / 2  # 30초 단위 반올림
#print(final_result)
#이때는 /60 하면 안 됩니다. 이미 difftime(..., units = "mins")이므로 분 단위입니다.

# 정리된 전체 코드 (가장 안정적인 버전)
#r#
#복사
#편집
#library(dplyr)
#library(lubridate)

# 데이터 불러오기
#rdata <- read.csv("P230601.csv")

# 날짜 변환
#rdata$신고일시 <- ymd_hm(rdata$신고일시)
#rdata$출동일시 <- ymd_hm(rdata$출동일시)

# 시간차이 계산 (분 단위)
#rdata$시간차이_분 <- as.numeric(difftime(rdata$출동일시, rdata$신고일시, units = "mins"))

# 연도, 월 추가
#rdata$연도 <- year(rdata$출동일시)
#rdata$월 <- month(rdata$출동일시)

# 그룹별 평균 시간차이 계산
#data <- rdata %>%
  #group_by(출동소방서, 연도, 월) %>%
  #summarise(평균시간차이 = mean(시간차이_분), .groups = "drop") %>%
  #arrange(desc(평균시간차이))

# 가장 큰 값 선택 → 30초 단위 반올림 → 정수 출력
#최대값 <- head(data$평균시간차이, 1)
#최종결과 <- round(최대값 * 2) / 2
#print(최종결과)
#이제 print(최종결과) 결과로 나온 숫자가 제출할 정수 값입니다.
#※ 만약 실수가 나오면 round(최종결과) 한 번 더 해서 제출 형태(정수) 맞춰주면 됩니다.

#원하시면 이 데이터에 대한 결과까지 도출해드릴 수 있습니다. 출력 결과가 어떻게 나왔나요?