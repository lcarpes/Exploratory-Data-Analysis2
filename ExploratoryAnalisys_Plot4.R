library(dplyr)
library(datasets)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

comb <- grepl(pattern = "combust",x = SCC$SCC.Level.One,ignore.case = TRUE)
coal <- grepl(pattern = "coal",x = SCC$SCC.Level.Four,ignore.case = TRUE)
combSCC <- SCC[(comb & coal),]$SCC
combNEI <- NEI[NEI$SCC %in% combSCC,]


png("plot4.png", width=480, height=480)

ggplot(combNEI, aes(factor(year), Emissions/10^5)) +
  geom_bar(stat = "identity", fill = "blue", width = 0.50) +
  labs(x="Year", y=expression("Total PM 2.5 Emission (10^5 Tons)")) + 
  labs(title=expression("PM 2.5 Coal Combustion Source Emissions - 1999-2008"))


dev.off()


