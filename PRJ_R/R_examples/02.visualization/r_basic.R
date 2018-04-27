library(MASS)
painters
head(painters)
?painters
painters$School
help(painters)
str(painters)

#Frequency dist. of Quali data
school <- painters$School
school.freq <- table(school) 
school.freq
#(Enhanced solution) 
cbind(school.freq)


#Relative Frequency Distribution of Qualitative Data
school.relfreq <- school.freq/nrow(painters) 
school.relfreq
old <- options(digits=1)
cbind(school.relfreq)
options(digits=2)
options(old)

#bar graph 
barplot(school.freq) 
#진전된 솔루션 
colors <- c("red","yellow" ,"green" ,"violet" ,"orange" ,"blue" ,"pink" ,"cyan")
barplot(school.freq, col=colors)


pie(school.freq)
#색상활용 
colors <- c("red","yellow" ,"green" ,"violet" ,"orange" ,"blue" ,"pink" ,"cyan")
pie(school.freq, col=colors) 





head(faithful) 
?faithful

duration <- faithful$eruptions
range(duration)
breaks <- seq(1.5, 5.5, by=0.5) 
breaks 
duration.cut <- cut(duration, breaks, right=FALSE)  #closed on the left open on the right
duration.freq <- table(duration.cut)  ; duration.freq
cbind(duration.freq)


hist(duration, right=FALSE)  # intervals closed on the left
hist(duration, right=FALSE, col=colors, main="Old Faith Eruptions", xlab="Duration minutes")


duration.freq
duration.relfreq <- duration.freq/nrow(faithful)
duration.relfreq
old <- options(digits=1)
duration.relfreq
cbind(duration.freq, duration.relfreq)
options(old)
?options

#the cumulative frequency distribution
duration.cumfreq <- cumsum(duration.freq) 
cbind(duration.cumfreq)




cumfreq0 <- c(0, cumsum(duration.freq))
plot(breaks, cumfreq0, main="Old Faithful Eruptions", xlab="Duration minutes", ylab="Cumulative eruptions") 
lines(breaks, cumfreq0)




#the cumulative Relative frequency
duration.cumrelfreq <- duration.cumfreq/nrow(faithful)
duration.cumrelfreq
old <- options(digits=2)
duration.cumrelfreq
options(old)
cbind(duration.cumfreq, duration.cumrelfreq)





#graph 
duration.cumrelfreq0 <- duration.cumfreq/nrow(faithful)
cumrelfreq0 <- c(0, duration.cumrelfreq)
plot(breaks, cumrelfreq0, main="Old Faithful eruptions", xlab="Duration minutes", ylab="Cumulrative eruption proportion")
lines(breaks, cumrelfreq0) 


#Fn <- ecdf(duration) 
#plot(Fn, "Old Faithful Eruptions", xlab="Duration minutes", ylab="Cumulrative eruption proportion")

#stem-and-leaf 
stem(duration) 

#scatter-plot
duration 
waiting <- faithful$waiting
head(cbind(duration, waiting))

plot(duration, waiting, xlab="Eruption duration", ylab="Time waited")

abline(lm(waiting~duration))

              
