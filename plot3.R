setwd("C:/R/Exploratory data analysis/week 4")
#read the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#extract data from baltimore
NEI_Baltimore = subset(NEI, NEI$fips == "24510")
#sum the pm2.5 by year and type
TE_Baltimore_type <- aggregate(NEI_Baltimore[,4], by = list(year = NEI_Baltimore$year,type = NEI_Baltimore$type), FUN = sum)
#plot the data
png("plot3.png")
g <- ggplot(TE_Baltimore_type, aes(year, x))
g + geom_line()+geom_point()+facet_grid(. ~ type) + labs(y = "Total Emission")
dev.off()