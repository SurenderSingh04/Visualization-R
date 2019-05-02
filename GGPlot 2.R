#GGPLOT

install.packages('ggplot2')
library(ggplot2)
m=mtcars
View(m)
str(m)
getwd()

ggplot(data=m, aes(x=cyl, y=mpg)) + geom_point()
# here cylinder type has only 3 values i.e. 4,6,8 , but in our plot we rae getting 5, 7 as well because it is getting considered 
# as a numeric data type. So we need to convert it to either factor data type or character data type to avoid this scenario

m$cyl=as.factor(m$cyl)
ggplot(data=m, aes(x=cyl, y=mpg)) + geom_point() # '+' sign is importnt here. It's the part of the syntax

ggplot(data=m, aes(x=cyl, y=mpg, col=hp)) + geom_point(shape=1, size=2)

ggplot(data=m, aes(x=cyl, y=mpg, size=hp, col=hp)) + geom_point()
ggplot(data=m, aes(x=wt, y=mpg, size=disp, col=hp)) + geom_point() #size=disp/hp will provide the variability to the size of points

ggplot(data=m, aes(x=wt, y=mpg, size=disp, col=hp, size=hp)) + geom_point(col='red') 
# if we use size, col parameters in both geom as well as aesthetic , then geom will override the aesthetic parameter 
# and there will be no variability in size. i.e. size and color will be decided by geom parameters

ggplot(data=m, aes(x=wt, y=mpg, size=disp, col=hp)) + geom_text(aes(label=cyl)) # It will print the exact value of those points

ggplot(data=m, aes(x=wt, y=mpg, size=disp, col=hp)) + geom_line(aes(y=qsec)) # qsec is a column in data set m


# Visualizing the large data set with more than 50000 rows. Real time scenario

attach(diamonds)
d=diamonds
nrow(d)   #53490 rows
str(d)

##When the points in the scatter plots are cluttered, a smooth line can be used to visualize the underlying trend 
#or relationship between variables on the x and y axis.
ggplot(data=d, aes(x=carat, y=price)) + geom_point() +geom_smooth()

ggplot(data=d, aes(carat, price)) +geom_smooth()

# In this case geom_smooth shows some abnormal behaviour. Normally price should increase for increase in carat. But at some 
#point the line is going down, which means price is decreasing for some particular increase in carat. So we need to analyse some
# other variable on which price is depending

temp= ggplot(data=d, aes(carat, price,col=clarity)) +geom_smooth() 
temp
# so here we see that the price is depending on clarity as well. so plotting clarity with different colors, 
#we see that for clarity VS2 the price is falling for some carat value(2.5 - 3)


# try to add the transparency factor using alpha parameter. This will decide the transparency of points alpha=0 means no points
ggplot(data=d, aes(carat, price,col=clarity)) +geom_point(alpha=0.8) 

?geom_point

##Lets see how can we use ggplot in more powerful way
# Plots as Object

ggplot(data=d, aes(carat, price,col=clarity))

diamond_plot=ggplot(data=d, aes(carat, price,col=clarity))
# ggplot plots are objects. we can assign this to an variable and then we can add any kind of geometry to it to plot the graph.

diamond_plot+geom_smooth()
diamond_plot+geom_point()
diamond_plot+geom_line()
diamond_plot+geom_abline()
diamond_plot+geom_area(alpha=0.9)


diamond_plot2=ggplot(data=d, aes(x=factor(price)))

diamond_plot2+geom_bar()

##################################################################################################################
#BarPlots
ggplot(data=m, aes(x=factor(cyl), fill=am)) + geom_bar(position = 'stack')
# In above example we don't see any stacked bar because am(having values 0 and 1) is getting considered as numeric
#So we need to convert the am to factor variable
ggplot(data=m, aes(x=factor(cyl), fill=factor(am))) + geom_bar(position = 'stack')

ggplot(data=m, aes(x=factor(cyl))) + geom_bar() + aes(fill=factor(am))
ggplot(data=m, aes(x=factor(cyl), fill=factor(am))) + geom_bar(position='fill')

# We can also vary y by considering it as (..count..). This will be more informative
ggplot(data=m, aes(x=factor(cyl), fill=factor(am))) + geom_bar(aes(y=(..count..)/sum(..count..)))
ggplot(data=m, aes(x=factor(cyl), fill=factor(am))) + geom_bar(aes(y=(..count..)*100))


#We can also show the same bar chart as above by using the side-by-side layout. This will use position='dodge'
ggplot(data=m, aes(x=factor(cyl), fill=factor(am))) + geom_bar(position='dodge')

#########################################################################################################################
#Histogram

m=mtcars
ggplot(data=m, aes(x=cyl)) + geom_histogram(binwidth=1)
# Histogram is used from continuous variables
#So using Histogram is not a good choice here.

ggplot(data=m, aes(x=cyl)) + geom_histogram(binwidth=1, col='blue', fill='red')

       