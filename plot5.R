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
#Question 5 How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
# First Filter all sources that are motor vehicle sources
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
#Now after filtering motor vehicl sources filter their SCCs
vehiclesSCC <- SCC[vehicles,]$SCC
#Now map this SCC to NEI data to filter all motor vehicles sources 
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]
# Subset the vehicles NEI data to Baltimore's fip
baltimoreVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips=="24510",]



# Now lets plot the data using ggplot function
ggp <- ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="cyan",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission ")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

print(ggp)

#Ans emissions from motor vehicle sources have declined from 1999-2008 in Baltimore City
#Plotting on png file
png("plot5.png")
ggp <- ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="cyan",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission ")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

print(ggp)

dev.off()


