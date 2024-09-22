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
# Question 3 Of the four types of sources indicated by the type type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? 
#Use the ggplot2 plotting system to make a plot answer this question. 
#Filtering data by Baltimore City
pmmary<-subset(NEI,fips=="24510")
# Aggrgegating Data by year and type and taking sum of Emissions
totpmmary<-aggregate(Emissions ~ year + type,data=pmmary,FUN=sum)

#Plot Function using ggplot2 
g <- ggplot(totpmmary,aes(factor(year),Emissions,fill=type))
g+geom_bar(stat="identity")+theme_bw()+facet_grid(.~type)+labs(x="year",y="Emissions")+labs(title="Emissions in Baltimore City by Type")

#Ans as can be seen in the Ploton-road, non-road, and non-point sources have all seen decreases in PM2.5 emissions from 1999-2008 whereas point sources have seen an increase over the same time period.
png("plot3.png")
g<-ggplot(totpmmary,aes(factor(year),Emissions,fill=type))+geom_bar(stat="identity")+theme_bw()+facet_grid(.~type)+labs(x="year",y="Emissions")+labs(title="Emissions in Baltimore City by Type")
print(g)

dev.off()
