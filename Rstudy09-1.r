library(ggplot2)
library(dplyr)
library(readxl)
library(foreign)

raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav",
                        to.data.frame = TRUE)
welfare <- raw_welfare
#print(summary(welfare)) 현재로서는 변수의 이름이 이해하기 힘들게 되어있다. 바꿔주자
welfare <- rename(welfare, sex = h10_g3,    #성별
                birth = h10_g4,          #태어난 년도
                marriage = h10_g10,     #혼인
                religion = h10_g11,     #종교
                income = p1002_8aq1,    #수입
                code_job = h10_eco9,    #직업 코드
                code_region = h10_reg7) #지역 코드


#성별에 따른 월급 차이 >> 1. 변수 검토 및 데이터 전처리 2. 변수 간 관계 분석 (그래프)
print(class(welfare$sex)) #성별 변수의 타입
print(table(welfare$sex)) #1 male, 2 felmale
welfare$sex <- ifelse(welfare$sex == 1, "Male", "Female")
# 결측값이 없으므로 전처리 패스 ~

print(table(welfare$sex))
# income 의 변수 타입 확인
print(class(welfare$income))
print(summary(welfare$income)) # 월급은 1~9999 사이의 값을 가지므로 이외의 값은 이상치 입니다

welfare$income <- ifelse(welfare$income %in% c(0, 9999), NA, welfare$income)
#결측치 확인
print(table(is.na(welfare$income))) #꽤 많이 결측처리 되었다
# 성별에 따른 월급 차이 분석하기
s_ic <- welfare %>% filter(!is.na(income)) %>%
                group_by(sex) %>%
                summarise(mean_income = mean(income))
print(s_ic) # 남성이 여성에 비해 급여가 높다.
print(ggplot(s_ic, aes(x = sex, y = mean_income)) + geom_col())