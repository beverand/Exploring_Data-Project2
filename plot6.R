#Baltimore City vs Los Angeles County, California (fips == "06037"): greater changes over time in motor vehicle emissions?

#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

road<-grep("-Road", SCC$EI.Sector)
q6<-rbind(NEI[NEI$fips == '24510' & NEI$SCC %in% SCC[road, 1] & !is.na(NEI$Emissions),],NEI[NEI$fips == '06037' & NEI$SCC %in% SCC[road, 1] & !is.na(NEI$Emissions),])
q6i<-aggregate(q6$Emissions, by=list(year=as.factor(q6$year), as.factor(q6$fips)), FUN=sum, na.rm=TRUE)
names(q6i)<- c('year', 'fips', 'Emissions')
plot6<-with(q6i, qplot(year, Emissions, color=fips))
png("plot6.png",width=480, height=480)
with(q6i, qplot(year, Emissions, color=fips))
dev.off()
with(q6i, qplot(year, Emissions, color=fips))