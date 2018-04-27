exam <- read.table("data/exam1.txt",header=T)
exam

class(exam)
str(exam)
stem(exam$score)

attach(exam)
stem(score, scale=0.5)
stem(score, scale=2)

hist(score)

exam
summary(score)[-4]

quantile(score,c(1/2,1/4,1/8,1/16))
