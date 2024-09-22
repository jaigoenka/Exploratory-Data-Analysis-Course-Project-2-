##Load R Packages
library(ggplot2)
#DATA INPUT

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("G:/Data Science Hopkins Course/Complete Course/R Programming/Exploratory Data Analysis/Final Assignment/Data/summarySCC_PM25.rds")

SCC <- readRDS("G:/Data Science Hopkins Course/Complete Course/R Programming/Exploratory Data Analysis/Final Assignment/Data/Source_Classification_Code.rds")
# Lets Explore the Data
head(NEI)
head(SCC)
str(SCC)
# Question 1 
##Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.?
##Filtering the data by years first and creating new data frame for every year pm99 for 1999 and likewise
pm99<-subset(NEI,year==1999)
pm002<-subset(NEI,year==2002)
pm005<-subset(NEI,year==2005)
pm008<-subset(NEI,year==2008)
## Then taking sum to all emissions for each year
tot99<-sum(pm99$Emissions)
tot002<-sum(pm002$Emissions)
tot005<-sum(pm005$Emissions)
tot008<-sum(pm008$Emissions)
# Constructing a new Data Frame containing Year and TOtal Emisions for plotting purposes
plot1df<-data.frame(Year=c("1999","2002","2005","2008"),Totpm2.5 =c(tot99,tot002,tot005,tot008))
with(plot1df,plot(Year,Totpm2.5,col="blue",type="l",pch=20,xlab="Year",ylab="Total EMissions 2.5"))
#Ans as can be seen in the Plot yes, total emissions from PM2.5 decreased in the United States from 1999 to 2008
png("plot1.png")
with(plot1df,plot(Year,Totpm2.5,col="blue",type="l",pch=20,lwd=2,xlab="Year",ylab="Total EMissions 2.5"))
dev.off()