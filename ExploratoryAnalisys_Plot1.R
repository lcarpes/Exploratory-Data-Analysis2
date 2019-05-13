library(dplyr)
library(datasets)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

s<-group_by(NEI, year)
s<-summarize(s, sum(Emissions))

png("plot1.png", width=480, height=480)

barplot(
  s$`sum(Emissions)`/10^6,
  names.arg=s$year,
  xlab = "Year",
  ylab = "PM2.5 Emissions",
  main = "PM2.5 Emissions for all US Sources"
)

dev.off()


