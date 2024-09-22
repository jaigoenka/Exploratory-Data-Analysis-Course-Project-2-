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
# Question 2 Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510"
#fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question. 
#Filtering Data by FIPS=24510
pmmary<-subset(NEI,fips=="24510")
##USing Tapply function to calculate sum of means yearwise
totpmmary<- tapply(pmmary$Emissions,pmmary$year,sum)


# Constructing a new Data Frame containing Year and TOtal Emisions of fips=24510 for plotting purposes
plot1df<-data.frame(Year=c("1999","2002","2005","2008"),Totpm2.5 =totpmmary)
with(plot1df,plot(Year,Totpm2.5,col="blue",type="l",pch=20,xlab="Year",ylab="Total EMissions 2.5 ",main="Total Emissions 2.5 in Baltimore"))
#Ans as can be seen in the Plot yes. As we can see from the graph below, there is an absolute decrease from the year 1999 to the year 2008 in total PM2.5 emissions in Baltimore City; however, it is not a consistently negative trend as indicated by the increase from 2002 to 2005.
png("plot2.png")
with(plot1df,plot(Year,Totpm2.5,col="blue",type="l",pch=20,xlab="Year",ylab="Total EMissions 2.5 ",main="Total Emissions 2.5 in Baltimore"))
dev.off()
