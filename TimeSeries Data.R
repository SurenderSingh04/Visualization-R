# Working on Timeseries data

library(ggplot2)
e=economics
View(e)

ggplot(e, aes(x=date, y=unemploy))  + geom_line(size=1, col='blue') + geom_smooth(col='red')
# This timeseries dataset contains the enemployment data along with population over the years in India
# If we want to compare the unemployment over the years , we should not directly plot the year vs unemployment 
# Because population also increased over the years.
# rather we should go for percentage population unemployed over the years. So plot graph between date and unemploy/population
# you will see a d, slight difference between peaks of above graph and below graph
ggplot(e, aes(x=date, y=unemploy*100/pop)) + geom_line(size=1, col='blue') + geom_smooth(col='red')

ggplot(e, aes(x=date, y=unemploy/pop, col=psavert)) + geom_line() +geom_point()

####################################################    Legend    #############################################################
# We can add legend to ggplot directly in plot itself as shown below.


temp <- ggplot(e,aes(x = date,y = pop)) + theme(legend.position = "top") + geom_point(aes(color = unemploy))
#temp + scale_color_continuous(name="",breaks = c(3000,10000,15000),labels = c("3000","10000","15000"))
temp + scale_color_continuous(name="",breaks = c(3000,10000,15000),labels = c("3000","10000","15000"), low='blue', high='red')

######################################################### Fecets  #############################################################

##Faceting:
# Create separate graphs for subsets of data
library(reshape2)
t=tips
temp1 <- ggplot(t, aes(x = total_bill, y = tip))
temp1 + geom_line(aes(color = size))

#Not a very good way to represent the data
temp1 + geom_text(aes(label=size)) +  facet_wrap(~size, ncol = 6)

#################################################### End ######################################################################
# End of this Session you must have understood:
#     Why Data Visualization is so important
#     Where data visualization fits in project lifecycle 
#     What are the different visual representation for us to use
#     When to use which representation
#     Base Plotting in R
#     Plotting in ggplot2
# https://flowingdata.com/2016/03/22/comparing-ggplot2-and-r-base-graphics/




