setwd("C:/R/Exploratory data analysis/week 4")
#read the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#extract data from baltimore and "on-road" type
NEI_Baltimore_vehicle <- subset(NEI, NEI$fips == "24510" & NEI$type == 'ON-ROAD')
#extract data from LA and "on-road" type
NEI_LA_vehicle <- subset(NEI, NEI$fips == "06037" & NEI$type == 'ON-ROAD')
#sum data from baltimore and LA by year, respectively, and add another column "city" to define their group
TE_Baltimore_vehicle <- aggregate(NEI_Baltimore_vehicle[,4], by = list(year = NEI_Baltimore_vehicle$year), FUN = sum)
TE_Baltimore_vehicle$city <- c(rep("Baltimore",nrow(TE_Baltimore_vehicle)))
TE_LA_vehicle <- aggregate(NEI_LA_vehicle[,4], by = list(year = NEI_LA_vehicle$year), FUN = sum)
TE_LA_vehicle$city <- c(rep("LA",nrow(TE_Baltimore_vehicle)))
#merge the two datasets as one
LA_Baltimore_Merge <- rbind(TE_Baltimore_vehicle, TE_LA_vehicle)
#plot the data
png("plot6.png")
g <- ggplot(LA_Baltimore_Merge, aes(year,x))
g+geom_point()+geom_line()+facet_grid(. ~ city)+labs(x="year")+labs(y="Total Emission")
dev.off()