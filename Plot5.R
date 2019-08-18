################5
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI_SCC <- merge(NEI, SCC, by="SCC")

subsetNEI_SCC <- NEI_SCC[NEI_SCC$fips=="24510" & NEI_SCC$type=="ON-ROAD",  ]

total_year <- aggregate(Emissions ~ year, subsetNEI_SCC, sum)

#library(ggplot2)

png('plot5.png', width=480, height=480)

p5 <- ggplot(total_year, aes(factor(year), Emissions))
p5 <- p5 + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression("Total Emissions")) +
  ggtitle('Total Emissions from motor vehicle in Baltimore City from 1999 to 2008')

print(p5)
dev.off()