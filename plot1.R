#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
#base plotting system show total PM2.5 emission from all sources for 1999, 2002, 2005, and 2008.

#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

NEI$year<-as.factor(NEI$year)
q1<-aggregate(NEI$Emissions, by=list(Year=NEI$year), FUN=sum, na.rm=TRUE)

png("plot1.png",width=480, height=480)
plot(q1$Year, q1$x, main="PM2.5 emissions from all Sources", xlab='Year', ylab='Emissions')
dev.off()
plot(q1$Year, q1$x, main="PM2.5 emissions from all Sources", xlab='Year', ylab='Emissions')