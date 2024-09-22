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
#Question 4 Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
# First Filter all sources that are combustion Related and then coal related using grepl function for pattern matching that will return logical vector
combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)

coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE)
coalCombustion <- (combustionRelated & coalRelated)
# Now map values in NEI using SCC as Unique ID to find out emissions of COmbustion and coal related
combustionSCC <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]
# Now lets plot the data using ggplot function
ggp <- ggplot(combustionNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="magenta",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Emissions")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))
print(ggp)
#Ans emissions from coal combustion-relates sources have decreased from 1999-2008, especially from 2005 to 2008.
#Plotting on png file
png("plot4.png")
ggp <- ggplot(combustionNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="magenta",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Emissions")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))
print(ggp)
dev.off()


