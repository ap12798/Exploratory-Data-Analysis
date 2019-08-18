################2
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
Baltimore <- subset(x =NEI, NEI$fips == "24510")
Total_Emissions_Year_Balt <- aggregate(Emissions ~ year, Baltimore, sum)

png('plot2.png', width=480, height=480)

p2 <- barplot(height=Total_Emissions_Year_Balt$Emissions, 
              names.arg=Total_Emissions_Year_Balt$year, 
              xlab="Years", 
              ylab=expression("Total Emissions"),
              main=expression("Total Emissions by Year (Baltimore City"),
              col="blue")
print(p2)
dev.off()