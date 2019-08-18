################1
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Total_Emissions_Year <- aggregate(Emissions ~ year, NEI, sum)
png('plot1.png', width=480, height=480)

p1 <- barplot(height=Total_Emissions_Year$Emissions, 
              names.arg=Total_Emissions_Year$year, 
              xlab="Years", 
              ylab=expression("Total Emissions"),
              main=expression("Total Emissions by Year"))
print(p1)
dev.off()