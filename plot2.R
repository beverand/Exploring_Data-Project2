#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
#base plotting system 

#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

NEI$year<-as.factor(NEI$year)
q2<-NEI[NEI$fips == '24510' & !is.na(NEI$Emissions),]
q2i<-aggregate(q2$Emissions, by=list(Category=q2$year), FUN=sum, na.rm=TRUE)
names(q2i)<- c('year','Emissions')
png("plot2.png",width=480, height=480)
plot(q2i$year, q2i$Emissions, main="Baltimore City PM2.5 Emissions", xlab='Year', ylab='Emissons')
dev.off()
plot(q2i$year, q2i$Emissions, main="Baltimore City PM2.5 Emissions", xlab='Year', ylab='Emissons')