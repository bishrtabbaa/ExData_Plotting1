mydownload <- function() {
  
  # create data folder
  if (!dir.exists("./data")) {
    dir.create("data")
  }
  
  # download data
  if (!file.exists("data/ucipowerdata.zip")) {
    print('Downloading...')
    download.file( url = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile = 'data/ucipowerdata.zip')
  }
  
  # extract data
  if (!file.exists('data/household_power_consumption.txt')) {
    print('Extracting...')
    unzip( 'data/ucipowerdata.zip', overwrite=TRUE, exdir="data")
  }
}

myread <- function() {
  print('Reading file into in-memory data frame...')
  # read file
  powerdata <- read.table('data/household_power_consumption.txt', sep=";",header=TRUE, na.strings = c("?"))
  # convert date column
  powerdata$DateTime = strptime(paste(powerdata$Date,powerdata$Time), format="%d/%m/%Y %H:%M:%S")
  # return filtered subset of original power data
  return (subset(powerdata, DateTime >= '2007-02-01' & DateTime < '2007-02-03'))
}

