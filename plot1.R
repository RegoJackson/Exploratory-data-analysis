setwd("C:/R/Exploratory data analysis/week 4")
#read datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#sum the pm2.5 by year
TotalEmission_year <- aggregate(NEI[,4],by = list(year = NEI$year), FUN = sum)
#plot the data
png(filename = 'plot1.png')
barplot(TotalEmission_year$x, names.arg = TotalEmission_year$year, xlab = "year", ylab = "Total Emission", main = "total PM2.5 emission")
dev.off()