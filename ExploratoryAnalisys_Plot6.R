library(dplyr)
library(datasets)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data <- grepl(pattern = "vehicle",x = SCC$SCC.Level.Two,ignore.case = TRUE)
dataSCC <- SCC[data,]$SCC
dataNEI <- NEI[NEI$SCC %in% dataSCC,]
dataFim <- (dataNEI[dataNEI$fips == "24510",])

selecao <- (dataNEI[dataNEI$fips == "24510" | dataNEI$fips == "06037",])
selecao[,1] <- as.factor(x = selecao[,1])
selecao <- selecao 
levels(selecao$fips)[levels(selecao$fips)=="06037"] <- "Los Angeles"
levels(selecao$fips)[levels(selecao$fips)=="24510"] <- "Baltimore"

png("plot6.png", width=480, height=480)

ggplot(selecao, aes(factor(year), Emissions)) +
  geom_bar(stat = "identity", fill = "blue", width = 0.50) +
  facet_grid(facets = .~fips,scales = "free", space = "free") +

  labs(x="Year", y=expression("Total PM 2.5 Emission (10^5 Tons)")) + 
  labs(title=expression("PM 2.5 Vehicle Emissions LA and Baltimore"))


dev.off()


