library(dplyr)
library(ggplot2)

install.packages("foreign") 
library(foreign)
raw_03 <- read.spss("/Users/1003849/Bigdata/R_workspace/r_edu_201804/02_data/실전_복지패널/data_spss_Koweps2014.sav", to.data.frame=T)
df_c <- raw_03

df_c <- rename(df_c, sex = h0901_4,income = h09_din)
class(df_c$sex)
summary(df_c$sex)
table(df_c$sex)
df_c$sex <- ifelse(df_c$sex == 9, NA, df_c$sex)
table(is.na(df_c$sex))
df_c$sex <- ifelse(df_c$sex == 1, "M", "F")
table(df_c$sex)
