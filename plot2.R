setwd("C:/R/Exploratory data analysis/week 4")
#read the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#extract data from Baltimore
NEI_Baltimore = subset(NEI, NEI$fips == "24510")
#sum PM2.5 by year
TotalEmission_Baltimore <- aggregate(NEI_Baltimore[,4],by = list(year = NEI_Baltimore$year), FUN = sum)
#plot the data
png(filename = 'plot2.png')
barplot(TotalEmission_Baltimore$x, names.arg = TotalEmission_Baltimore$year, xlab = "year", ylab = "Total Emission", main = "total PM2.5 emossion in Baltimore")
dev.off()