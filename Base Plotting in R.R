# In this code we are going to use iris data set. Irish data set is an inbuilt data set in base package of R. 
# It is flowers data with three categories of flowers: setosa, versicolor, verginica
View(iris)
iris_demo=iris
str(iris_demo)

# Scatter plot
plot(iris_demo$Sepal.Length, iris_demo$Sepal.Width) # all species without colors
# because of the discrete values in variables, the plot will be scattered plot.

points(iris_demo$Petal.Length, iris_demo$Petal.Width, col = 'red') # 4 variables in one plot with petal length, witdth with red color
# points() will work with plot function, to add additional points to the plot 

plot(iris_demo$Sepal.Length, iris_demo$Sepal.Width, col=iris_demo$Species) # 3 different species with 3 different colors

plot(iris_demo$Sepal.Length, iris_demo$Sepal.Width, type = 'p', col=iris_demo$Species , main="Demo Plot On Iris Dataset", 
     sub="Plot Example", xlab='Length', ylab='Width')
#type=p means points, we can use l(line), b(both) as well
#col=iris_demo$Species will give color to different species of flowers
#Xlab=name of X-Axis
#ylab=name of Y-Axis
#sub=Plot name
#main=heading for the plot
#unique(iris_demo$Species)


# Legend is used to put an image of category names in the graph/plot

legend(4.5, 4.5,legend =  unique(iris_demo$Species), col = c("black", "red","green"), pch=1.0)
#(4.5,4.5 ) Will Show X and Y values where legend(box with name of flowers) will appear
#(setosa, vesicolo, Virginica) are the names of 3 categories of flowers with diiferent colors appearaing in plot
#col= colors of the points for three different categories
#pch will show the symbol before name in the legend box, it may be a point, triangle or + whatever.
###############################################################################################################################

# Histogram

hist(iris_demo$Sepal.Width,
     main="Demo Histogram in Iris Dataset",
     xlab='Width',
     border='blue',
     col='green',
     breaks=c(1,2,3,4,5))  # breaks will give me number of hists in the histogram

# if the step in break is equal e.g. 1,2,3,4,5 or 1,3,5 then it will be a frequency Histogram
# if the step in break is unequal e.g. 1,,3,4,5 or 1,4,5 then it will be a density Histogram
# The break values should include max and min values of the hitogram range, otherwise it will throw error. 
# e.g. for the above histogram the range is 1-5, so if we give the break as (1,2,3) it will throw error, even for(3,4,5) etc
# it will throw error


hist(iris_demo$Sepal.Width,
     main="Demo Histogram in Iris Dataset",
     xlab='Width',
     border='blue',
     col='green',
     breaks=c(1,2,5))  # density Histogram, Breaks at unequal intervals

hist(iris_demo$Sepal.Width,
     main="Demo Histogram in Iris Dataset",
     xlab='Width',
     border='blue',
     col='green',
     breaks=9) # will break the histogram at 9 equal points, i.e. 8 equal intervals


hist(iris_demo$Sepal.Width,
     main="Demo Histogram in Iris Dataset",
     xlab='Width',
     border='blue',
     col='green',
     breaks=9,
     freq = F)  # if we don't want to print the frequency Histogram, put freq='F', and it will print density Histogram

hist(iris_demo$Sepal.Width,
     main="Demo Histogram in Iris Dataset",
     xlab='Width',
     border='blue',
     col='green',
     breaks=9,
     freq = T,
     density = 2000) # this density parameter is different from the freq/density parameter. This density parameter will simply 
# give the density of color in the bars of histogram. Density=100 will still give freuency histogram

###############################################################################################################################

#BoxPlot

boxplot(iris_demo)
#sepal length is normally distributes
#sepal width ahas some outliers 
#petal length is right skewed
#species is of no use

boxplot(iris_demo,las=2) # will give the names of variables in vertical form

boxplot(iris_demo,
        las=2,
        names=c('S_L', "S_W", "P_L", "P_W", "Species"),
        col = c('red', 'green','blue','black','pink'))  # We can rename the variables and use color parameter as well for boxes
# Now we know that sepal width has some outliers, we need to get them
# Grab the Outliers
boxplot(iris_demo$Sepal.Width, las=2, name='sepal_width', col = 'red')
outlier=boxplot(iris_demo$Sepal.Width, las=2, name='sepal_width')
outlier
View(outlier)
# this will return a named list of values. by looking into the list output(accessing the elements of a named list by names)
#we can see the max and min values of boxplot

outlier1=outlier$out
outlier1  # values of outlier
View(outlier1)
outlier2=boxplot(iris_demo$Sepal.Width,plot=F)$out # We don't need a plot, so plot='F', we just need outliers
outlier2

# to plot different species
boxplot(iris_demo$Petal.Length ~ iris_demo$Species, 
        xlab='species',
        ylab='Petal Length',
        col=c('red','blue','green'))

#########################################################################################################################
#Piechart
mytable=table(iris_demo$Species)

pie(mytable, labels=c("sentosa", "Versicolor", "Virginica"))

#Use Pie percent
colors=c("red", "blue","green")
pie(mytable,
     labels=round(100*mytable/sum(mytable),1),col=colors)

legend(0.9,0.1, c( "sentosa", "Versicolor", "Virginica"),fill=c("red","blue","green")) # Use of legend to show 


