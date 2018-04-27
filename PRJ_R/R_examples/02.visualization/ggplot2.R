install.packages("ggplot2")
library(ggplot2)

p <- ggplot(mtcars, aes(wt, mpg))
p + geom_point()

# Add aesthetic mappings
p + geom_point(aes(colour = factor(cyl)))

p + geom_point(aes(shape = factor(cyl)))

p + geom_point(aes(size = qsec))

# Change scales
p + geom_point(aes(colour = cyl)) + scale_colour_gradient(low = "blue")

p + geom_point(aes(shape = factor(cyl))) + scale_shape(solid = FALSE)

# Set aesthetics to fixed value
ggplot(mtcars, aes(wt, mpg)) + geom_point(colour = "red", size = 3)

# You can create interesting shapes by layering multiple points of
# different sizes
p <- ggplot(mtcars, aes(mpg, wt, shape = factor(cyl)))
p + geom_point(aes(colour = factor(cyl)), size = 4) +
  geom_point(colour = "grey90", size = 1.5)

#####################################################
install.packages("Lock5Data")
library(Lock5Data)
data(SleepStudy)
names(SleepStudy)
?SleepStudy

ggplot(SleepStudy, aes(x=Drinks))+geom_bar()
ggplot(SleepStudy, aes(x=Drinks))+geom_bar(fill="#FF9999", colour="black")
ggplot(SleepStudy, aes(x=Drinks))+geom_histogram(binwidth=2,aes(y=..density..)) # ..은 계산된 수치 
ggplot(SleepStudy, aes(x=Drinks))+geom_histogram(binwidth=1)

ggplot(SleepStudy, aes(x=ClassYear,y=Drinks))+geom_boxplot()

str(SleepStudy)
ggplot(SleepStudy, aes(x=factor(ClassYear),y=Drinks))+geom_boxplot()
ggplot(SleepStudy, aes(x=factor(ClassYear),y=Drinks))+geom_boxplot()+coord_flip() #Flipped cartesian coordinates 뒤집혀진 직교좌표

ggplot(SleepStudy, aes(x=Drinks))+geom_density()

