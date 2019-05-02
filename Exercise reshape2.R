install.packages('reshape2')
library(reshape2)
library(ggplot2)
t=tips
View(t)

#1.
ggplot(t, aes(t$total_bill, t$tip)) + geom_point()

#2.

ggplot(t, aes(t$total_bill, t$tip)) + geom_point(color='blue')

#3.

ggplot(t, aes(t$total_bill, t$tip)) + geom_point(size=3, color='blue')

#4. Vary the size of the points based on 
#the size of the party

ggplot(t, aes(t$total_bill, t$tip, size=t$size)) + geom_text(label=t$size, col='blue')
#OR
ggplot(t, aes(t$total_bill, t$tip, size=size)) + geom_text(label=t$size, col='blue')

#4.

ggplot(t, aes(t$total_bill, t$tip)) + 
geom_point(size=1, color='blue') +
geom_line(size=0.25, color='black')

#5.

ggplot(t, aes(t$total_bill, t$tip, size=size))+geom_point()

ggplot(t, aes(t$total_bill, t$tip, size=size)) +geom_text(aes(label=size)) +geom_smooth()
# the point size will vary according to the size of team of people.


