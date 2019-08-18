################4
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#joining data set on field "SCC"
NEI_SCC <- merge(NEI, SCC, by="SCC")
#finding all references to "coal" in column short name
coal  <- grepl("coal", NEI_SCC$Short.Name, ignore.case=TRUE)
COAL_NEI_SCC <- NEI_SCC[coal, ]

Coal_Emissions_Year <- aggregate(Emissions ~ year, COAL_NEI_SCC, sum)

png('plot4.png', width=480, height=480)

p4 <- ggplot(Coal_Emissions_Year, aes(factor(year), Emissions))
p4 <- p4 + geom_bar(stat = "identity", colour = 'red') +
  xlab("year") +
  ylab(expression("Total Emissions")) +
  ggtitle('Coal Emisions in US from 1999 to 2008') 

print(p4)
dev.off()