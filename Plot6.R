################6
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI_SCC <- merge(NEI, SCC, by="SCC")

library(ggplot2)
library(reshape2)
subsetNEI_SCC_BAL <- NEI_SCC[NEI_SCC$fips=="24510" & NEI_SCC$type=="ON-ROAD",  ]
total_year_BAL <- aggregate(Emissions ~ year, subsetNEI_SCC_BAL, sum)
names(total_year_BAL) <- c("year", "Baltimore_Emissions")

subsetNEI_SCC_LA <- NEI_SCC[NEI_SCC$fips=="06037" & NEI_SCC$type=="ON-ROAD",  ]
total_year_LA <- aggregate(Emissions ~ year, subsetNEI_SCC_LA, sum)
names(total_year_LA) <- c("year", "LA_Emissions")
#yikes LA...
df <- merge(total_year_BAL, total_year_LA, by="year")
df.m <- melt(df, id.vars = 'year')

png('plot6.png', width=480, height=480)

p6 <- ggplot(df.m, aes(year, value)) + 
  geom_bar(aes(fill = variable), position = "dodge", stat = "identity") + 
  ggtitle('Motor Emisions in US from 1999 to 2008 Comparing LA and Baltimore')

print(p6)
dev.off()
