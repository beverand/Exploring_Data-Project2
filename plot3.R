#which of type (point, nonpoint, onroad, nonroad) have seen decreases in emissions from 1999-2008 for Baltimore City? 
#Which have seen increases in emissions from 1999-2008? 
#ggplot2 plotting system
q3<-NEI[NEI$fips == '24510' & !is.na(NEI$Emissions),]
q3i<-aggregate(q2$Emissions, by=list(year=q2$year), FUN=sum, na.rm=TRUE)
q3<-aggregate(q2$Emissions, by=list(year=q2$year, type=q2$type), FUN=sum, na.rm=TRUE)
names(q3)<- c('year', 'type', 'Emissions')
q3$type<-as.factor(q3$type)

png("plot3.png",width=480, height=480)
ggplot(data=q3, aes(x=year, y=Emissions, group=type, shape=type)) + 
  geom_line(size=1.5) + 
  geom_point(size=3, fill="white") 
dev.off()
ggplot(data=q3, aes(x=year, y=Emissions, group=type, shape=type)) + 
  geom_line(size=1.5) + 
  geom_point(size=3, fill="white") 