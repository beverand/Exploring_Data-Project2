#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

road <-grep("-Road", SCC$EI.Sector)
q5 <-NEI[NEI$fips == '24510' & NEI$SCC %in% SCC[road, 1] & !is.na(NEI$Emissions),]
q5i<-aggregate(q5$Emissions, by=list(year=as.factor(q5$year)), FUN=sum, na.rm=TRUE)
names(q5i)<- c('year', 'Emissions')
png("plot5.png",width=480, height=480)
plot(q5i$year, q5i$Emissions)
dev.off()
plot(q5i$year, q5i$Emissions)