library(dplyr)
library(datasets)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

s<-filter(NEI, NEI$fips == "24510")

png(filename = "plot3.png",width = 750, height = 602,units = "px",)

ggplot(s, aes(factor(year), Emissions, fill=type)) + 
   facet_grid(facets = .~type, scales = "free",space = "free") +
   geom_bar(stat = "identity") +
   labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Tons)")) +
   labs(title=expression("PM 2.5 Emissions, Baltimore 1999-2008 by Source Type"))


dev.off()


