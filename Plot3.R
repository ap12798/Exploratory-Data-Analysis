################3
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#library(ggplot2)
Baltimore <- subset(x =NEI, NEI$fips == "24510")
Total_Emissions_Year_Balt <- aggregate(Emissions ~ year + type, Baltimore, sum)

png('plot3.png', width=480, height=480)

p3 <- ggplot(Total_Emissions_Year_Balt, aes(year, Emissions, color = type))
p3 <- p3 + geom_line() +
  xlab("year") +
  ylab(expression("Total Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland from 1999 to 2008')

print(p3)
dev.off()