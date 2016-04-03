setwd("C:/R/Exploratory data analysis/week 4")
#read the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#extract data concerning to "coal" from scc dataset
SCC_coal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE),]
#merge the extracted scc dataset and NEI dataset
NEI_coal <- merge(NEI, SCC_coal, by = "SCC")
#sum the pm2.5 by year
TE_coal_year <- aggregate(NEI_coal[,4], by = list(year = NEI_coal$year),FUN = sum)
#plot the data
png("plot4.png")
g <- ggplot(TE_coal_year,aes(year,x))
g + geom_line() + geom_point() + labs(x = "year") + labs(y = "Total emission") + labs(title = "Coal related info")
dev.off()