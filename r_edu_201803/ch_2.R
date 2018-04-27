library(dplyr)
library(ggplot2)

exam <- read.csv("/Users/1003849/Bigdata/R_workspace/r_edu_201804/02_data/csv_exam.csv")
?mpg

exam
exam %>% select(-math)
mpg
mpg %>% 
  filter(manufacturer == "audi") %>% 
  arrange(desc(hwy)) %>% 
  head(5)

exam %>% 
  mutate(total = math + english)
mpg %>% group_by(manufacturer) %>% 
  filter(class == "suv")
  mutate(total = cty + hwy) %>% 
  summarise(mean_tot = mean(total)) %>% 
  group_by(manufacturer)

mpg %>% 
  filter(class == "compact") %>% 
  group_by(manufacturer) %>% 
  summarise(cnt = n()) %>% 
  arrange(desc(cnt))

df <- data.frame(sex = c("M","F",NA,"M","F"),
                  score = c(5,4,3,4,NA))         
df
is.na(df)
table(is.na(df$score))
mean(df$score)
sum(df$score)
df %>% filter(is.na(score))
df %>% filter(!is.na(score))
df_nomiss <- df %>% filter(!is.na(score))
df_nomiss2 <- na.omit(df)
mean(df$score, na.rm = T)

mpg[c(65,124,131,153,212), "hwy"] <- NA
mpg

outlier <- data.frame(sex = c(1, 2, 1, 3, 2, 1), score = c(5, 4, 3, 4, 2, 6))
outlier

mpg <- as.data.frame(ggplot2::mpg) 
boxplot(mpg$hwy)
boxplot(mpg$hwy)$stats

mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)
mpg <- as.data.frame(ggplot2::mpg) # 데이터 불러오기
mpg[c(10, 14, 58, 93), "drv"] <- "k" # drv 이상치 할당
mpg[c(29, 43, 129, 203), "cty"] <- c(3,4,39,42) # cty 이상치 할당

mpg 
table(mpg$drv)
mpg %>% 
  filter(drv %in% c("4","f","r"))

boxplot(mpg$cty)
boxplot(mpg$cty)$stats
5*1.5
mpg$cty <- ifelse(mpg$cty < 9 | mpg$cty > 26, NA, mpg$cty)

mpg <- mpg %>% 
  filter(!(cty > 26 | cty < 9))
mpg

mpg %>% 
  group_by(drv) %>% 
  filter(!is.na(drv) & !is.na(cty)) %>% 
  summarise(mean_hwy = mean(cty))
