library(dplyr)
library(ggplot2)

raw_01 <- read.csv("/Users/1003849/Bigdata/R_workspace/r_edu_201804/02_data/01_chi_t.csv")
df_a <- raw_01
head(df_a)
str(df_a)

df_a$sex <- ifelse(df_a$sex == 1, "M", "F")
df_a$alc <- ifelse(df_a$alc == 1, "Beer", "Soju")
df_a %>% 
  group_by(sex, alc) %>% 
  summarise(n())
tab_alc <- table(df_a$sex, df_a$alc)
tab_alc

proptab_alc <- round(prop.table(tab_alc, 2) *100, 2)
proptab_alc

tab.cross <- cbind(tab_alc, proptab_alc)
tab.cross

write.csv(tab.cross, "output_chi.csv")

test <- chisq.test(df_a$sex, df_a$alc, correct = F)
test$p.value

df_proptab <- as.data.frame(proptab_alc)
df_proptab
df_proptab <- rename(df_proptab, sex = Var1, alc = Var2, pct = Freq)
df_proptab
ggplot(data = df_proptab, aes(x = sex, y = pct, fill = alc)) + geom_col()

ggplot(data = df_proptab, aes(x = sex, y = pct, fill = alc)) + geom_col() + scale_x_discrete(limit = c("M", "F"))



tab_t <- df_a %>% 
  group_by(sex) %>% 
  summarise(n = n(), m = round(mean(m_prefer),2), sd = round(sd(m_prefer),2))
tab_t
t.test(data = df_a, m_prefer ~ sex, var.equal = T)

ggplot(data = tab_t, aes(x = sex, y = m)) + geom_col()


raw_02 <- read.csv("/Users/1003849/Bigdata/R_workspace/r_edu_201804/02_data/02_reg.csv")
df_b <- raw_02
str(df_b)
out_reg <- lm(data = df_b, sat ~ skill)
summary(out_reg)
install.packages("ztable")
library(ztable)
ztable(out_reg)
ggplot(data = df_b, aes(x = skill, y = sat)) + geom_point()
ggplot(data = df_b, aes(x = skill, y = sat)) + geom_point() + geom_smooth(method = lm, se = T)
