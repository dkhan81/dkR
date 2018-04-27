#### 라이브러리 import ####
install.packages("dplyr")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)
# mpg 데이터 설명보기
?mpg
head(mpg)
# 데이터 행렬 파악
dim(mpg)
# struct 파악 
str(mpg)
# 기초통계정보 파악
summary(mpg)

#### 선형 회귀 ####
mpg %>%
   group_by(manufacturer)   %>%
   summarise(mean.hwy=mean(hwy)) %>%
   arrange(desc(mean.hwy))

mpg %>%
  filter(manufacturer=="ford") %>%
  group_by(model) %>%
  arrange(desc(hwy))

# lm =  선형회귀분석, hwy 종속변수 , displ 독립변수
lm.mpg <- lm(data=mpg, hwy ~ displ)  # 회귀분석
summary(lm.mpg) # 결과 확인
# 산점도 파악
qplot(data=mpg, x=displ, y=hwy)

# 데이터 변수 mpg의 hwy 컬럼 지칭
mean(mpg$hwy)
min(mpg$hwy)
max(mpg$hwy)
hist(mpg$hwy)

#### 변수 선언 ####
# 변수 만들기
a <- 1
b <- 2
ab <- 3.5
a+b
a+b+c

# 연속값 변수 만들기
d <- c(1,2,3,4,5)
e <- c(1:5)
f <- seq(1,5)
g <- seq(1,10, by=2) # 1부터 10까지 2단위로 생성

# 문자 변수 만들기
a2 <- "a"
b2 <- "text"
c2 <- "Hello world!"

# 연속 문자 변수 만들기
d2 <- c("a", "b", "c")
e2 <- c("Hello!", "world", "is", "good!")

a <- c(1,2,3)
mean(a)
max(a)
min(a)
b <- c("a","a","b","c")
qplot(b)

#### 함수 사용 ####
# 문자처리 함수
paste(e2, collapse = " ") # 빈칸 구분자로 문자 붙이기
e3_paste <- paste(e2, collapse = ",") # 빈칸 구분자로 문자 붙이기
e3_paste

# 함수 파라미터 지정하기
qplot(data=mpg, x=hwy)
qplot(data=mpg, x=cty)
qplot(data=mpg, y=hwy, x=drv, geom="point")
qplot(data=mpg, y=hwy, x=drv, geom="boxplot")
qplot(data=mpg, y=hwy, x=drv, geom="boxplot", colour=drv)
# 함수 사용법 help~!
?qplot

# 변수 합해서 데이터프레임 만들기
history <- c(90,80,60,70)
math <- c(50,60,100,20)
df_midterm <- data.frame(history, math)
class <- c(1,1,2,2)
df_midterm <- data.frame(history, math, class)
mean(df_midterm$history)
mean(df_midterm$math)

#### data import ####
# 엑셀 파일 read
install.packages("readxl")
library(readxl)
df_finalexam <- read_excel("/Users/1003849/Desktop/04. Education/2017년/r_education_v1/01_data/finalexam.xlsx", sheet=1, col_names=TRUE)
df_finalexam
mean(df_finalexam$math)
# csv 파일 read
read.csv("/Users/1003849/Desktop/04. Education/2017년/r_education_v1/01_data/csv_exam.csv", header = T)
# csv 퍼알 저장
write.csv(df_finalexam, file = "output_newdata.rda")
# rda 파일
save(df_finalexam, file = "output_newdata2.rda")
# 데이터 지우기
rm("output_newdata2.rda")
# rda 불러오기 
load("output_newdata.rda")

exam <- read.csv("/Users/1003849/Desktop/04. Education/2017년/r_education_v1/01_data/csv_exam.csv")
head(exam)
head(exam, 10)
tail(exam, 10)
View(exam)
dim(exam) # 행, 열 출력
str(exam) # 데이터 속성 확인
summary(exam) # 요약 통계량 출력

# 라이브러리에 올리지 않고 사용 가능
mpg <- as.data.frame(ggplot2::mpg)
mpg

df_raw <- data.frame(var1 = c(1,2,1), var2= c(2,3,2))
df_raw
# 데이터 프레임 복사본 만들기
df_new <- df_raw
df_new <- rename(df_new, v2 = var2)
df_new

#### quiz 1 ####
mpg
df_mpg <- mpg
df_mpg <- rename(df_mpg, city=cty, highway=hwy)
head(df_mpg)

df <- df_raw
df$var_sum <- df$var1 + df$var2 # var_sum 파생변수 생성
df$var_min <- (df$var1 + df$var2)/2
df
mpg$total <- (mpg$cty + mpg$hwy)/2 # 통합 연비 변수 생성
head(mpg)
mean(mpg$total)
summary(mpg$total)
hist(mpg$total)
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")
head(mpg, 20)

table(mpg$test)
# total을 기준으로 A,B,C 등급 부여
mpg$grade <- ifelse(mpg$total >= 30, "A", ifelse(mpg$total >= 20, "B", "C"))
table(mpg$grade)

#### quiz 2 ####
df_midwest <- as.data.frame(ggplot2::midwest)
head(df_midwest)
summary(df_midwest)
str(df_midwest)
df_midwest <- rename(df_midwest, total=poptotal, asian=popasian)
df_midwest$ratio <- df_midwest$asian / df_midwest$total * 100
hist(df_midwest$ratio)
mean_asia <- sum(df_midwest$asian) / sum(df_midwest$total) * 100
mean_asia
df_midwest$group <- ifelse(df_midwest$ratio >mean_asia, "large", "small")
table(df_midwest$group)
qplot(df_midwest$group)

exam %>% filter(class %in% c(1,2,5))
mean_a <- exam %>% filter(class == 1)
mean(mean_a$math)                

#### quiz 3 ####
head(mpg)
group_a <- mpg %>% filter(displ <= 4)
group_b <- mpg %>% filter(displ >= 5)
mean_a <- mean(group_a$total)
mean_b <- mean(group_b$total)
mean_a
mean_b
group_audi <- mpg %>% filter(manufacturer == "audi")
group_toyota <- mpg %>% filter(manufacturer== "toyota")
mean(group_audi$cty)
mean(group_toyota$cty)
group_etc <- mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(group_etc$hwy)

test <- mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda")) %>% select(manufacturer)
test

exam %>% select(class, english, math) %>% filter(class ==1)
exam %>% select(class) %>% filter(class %in% c(1,2)) %>% group_by(class)

mpg %>% select(class, cty) %>% 
  head(10)
mpg %>% group_by(class) %>% 
  filter(class %in% c("suv","compact")) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  arrange(desc(mean_cty))

mpg %>% group_by(class) %>% 
  filter(class %in% c("suv","compact")) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  arrange(mean_cty)

mpg %>%  
  filter(manufacturer =="audi") %>% 
  arrange(desc(hwy)) %>% 
  head(5)
mpg
mpg <- mpg %>% mutate(total_2 = cty + hwy)
str(mpg)
mpg <- mpg %>% 
  mutate(total_mean = total_2 / 2) %>% 
  str(mpg)

mpg <- as.data.frame(ggplot2::mpg)
mpg
mpg <- mpg %>% mutate(total_2 = cty + hwy)
str(mpg)
mpg <- mpg %>% 
  mutate(total_mean = total_2 / 2) 

mpg %>% 
  select(manufacturer, model) %>% 
  head(3)

mpg %>% 
  select(manufacturer, model)
str(mpg)

mpg %>% 
  group_by(manufacturer) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  arrange(desc(mean_cty)) %>% 
  head(3)

mpg %>% 
  group_by(manufacturer) %>% 
  filter(class == "compact") %>% 
  summarise(cnt=n()) %>% 
  arrange(desc(cnt)) %>% 
  head(10)

#### join ####
test1 <- data.frame(id = c(1, 2, 3, 4, 5), midterm = c(60, 80, 70, 90, 85))
test2 <- data.frame(id = c(1, 2, 3, 4, 5), final = c(70, 83, 65, 95, 80))
total <- left_join(test1, test2, by="id")
total
list_teacher <- data.frame(class = c(1,2,3,4,5), 
                           teacher = c("kim", "lee","park","choi","jung"))
exam_new <- left_join(exam, list_teacher , by ="class" )
exam_new
group_a <- data.frame(id = c(1, 2, 3, 4, 5), test = c(60, 80, 70, 90, 85))
group_b <- data.frame(id = c(6, 7, 8, 9, 10), test = c(70, 83, 65, 95, 80))
group_all <- bind_rows(group_a, group_b)
group_all

fuel <- data.frame(fl = c("c", "d", "e", "p", "r"), 
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22), 
                   stringsAsFactors = F)
fuel
str(mpg)
mpg <- left_join(mpg, fuel, by="fl")
head(mpg)
mpg %>% 
  select(model, fl, price_fl) %>% 
  head(10)
df_midwest <- as.data.frame(ggplot2::midwest)
str(midwest)
midwest <- midwest %>% 
  mutate(ratio_child = (poptotal - popadults)/poptotal *100)
midwest %>% 
  select(county, ratio_child) %>% 
  arrange(desc(ratio_child)) %>% 
  head(5)

midwest <- midwest %>% 
  mutate(grade_child = ifelse(ratio_child >= 40, "large", 
                              ifelse(ratio_child >=30 & ratio_child < 40 , "middle","small")))
head(midwest,5)
str(midwest)

ggplot(data=mpg, aes(x=displ, y=hwy))
ggplot(data=mpg, aes(x=displ, y=hwy)) + geom_point()
ggplot(data=mpg, aes(x=displ, y=hwy)) + geom_point() + xlim(3,6)
ggplot(data=mpg, aes(x=displ, y=hwy)) + 
  geom_point() + 
  xlim(3,6) + 
  ylim(10,30)

df_mpg <- mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy))
ggplot(data = df_mpg, aes(x=drv, y=mean_hwy)) + geom_col()

ggplot(data = df_mpg, aes(x=reorder(drv, -mean_hwy), y=mean_hwy)) + geom_col()
ggplot(data=mpg, aes(x=drv)) + geom_bar()
ggplot(data=mpg, aes(x=hwy)) + geom_bar()
ggplot(data=economics, aes(x=date, y=unemploy)) + geom_line()
ggplot(data=mpg, aes(x=drv, y=hwy)) + geom_boxplot()

#### quiz 4 ####
ggplot(data = mpg, aes(x = cty, y = hwy)) + geom_point()
str(mpg)
df_mpg <-mpg %>% 
  filter(class == "suv") %>% 
  group_by(manufacturer) %>%
  summarise(mean_cty=mean(cty)) %>%
  arrange(desc(mean_cty)) %>% 
  head(5)
df_mpg
ggplot(data=df_mpg, aes(reorder(manufacturer, -mean_cty), y= mean_cty)) + geom_col()
