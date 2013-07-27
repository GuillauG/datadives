# CHANGE THIS LINE FOR YOU
setwd('~/datadive/London_July_13/oxfam')

raw_ken <- read.csv('data/Kenya (without comma).csv', as.is=TRUE)
raw_ken_rows_nb <- length(raw_ken[,1])

# remove headers (5 lines)
ken <- raw_ken[-(1:5),]

# renaming columns
colnames(ken)[c(3, 4)] <- c("Month", "Year")

# reformat, and convert before plotting
ken$Date <- as.Date(paste0("01", "-", ken$Month, "-", ken$Year), format="%d-%m-%Y")

plotColumn <- function(colnb) {
	colname <- paste0("Kenya.", colnb)
	colvals <- as.numeric(ken[[colname]])
	
	# R expert : find better way to concat plz
	titl = paste0(raw_ken[1, colname], " - ", raw_ken[2, colname], " - ", raw_ken[3, colname], " - ", raw_ken[4, colname], " - ", raw_ken[5, colname])
	
	# actual plotting
	plot(ken$Date, colvals, type="l", xlab = "Date", ylab = paste0("Price - ", raw_ken[5, colname]))
	
	title(paste0("Kenya : ", titl))	
}

for(i in 1:48) {
	plotColumn(i)
}