setwd("C:/R/Exploratory data analysis/week 4")
#read the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#extract data from baltimore and "ON-ROAD" type
NEI_Baltimore_vehicle <- subset(NEI, NEI$fips == "24510" & NEI$type == 'ON-ROAD')
#sum the PM2.5 by year
TE_Baltimore_vehicle <- aggregate(NEI_Baltimore_vehicle[,4], by = list(year = NEI_Baltimore_vehicle$year), FUN = sum)
#plot the data
png("plot5.png")
g <- ggplot(TE_Baltimore_vehicle, aes(year,x))
g+geom_point()+geom_line()+labs(x="year")+labs(y = "Total emission") + labs(title = "Total emission by vehicle in Baltimore")
dev.off()