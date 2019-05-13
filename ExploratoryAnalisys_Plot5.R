library(dplyr)
library(datasets)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data <- grepl(pattern = "vehicle",x = SCC$SCC.Level.Two,ignore.case = TRUE)
dataSCC <- SCC[data,]$SCC
dataNEI <- NEI[NEI$SCC %in% dataSCC,]
dataFim <- (dataNEI[dataNEI$fips == "24510",])


png("plot5.png", width=480, height=480)

ggplot(dataFim, aes(factor(year), Emissions)) +
  geom_bar(stat = "identity", fill = "blue", width = 0.50) +
  labs(x="Year", y=expression("Total PM 2.5 Emission (10^5 Tons)")) + 
  labs(title=expression("PM 2.5 Motor Vehicle Sources Baltimore - 1999-2008"))


dev.off()


