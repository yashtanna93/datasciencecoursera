pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  files <- list.files(directory)
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  for(i in id) {
    if(i<10) {
      itemp <- paste("00", i, sep="")
    }
    else if(i<100) {
      itemp <- paste("0", i, sep="")
    }
    else {
      itemp <- i
    }
    filelocation <- paste(directory, itemp, sep = "/", collapse = NULL)
    filelocation <- paste(filelocation, "csv", sep = ".", collapse = NULL)
    temp <- read.csv(filelocation)[,c(pollutant)]
    if(exists("values")) {
      values <- append(values, temp)
    }
    else {
      values <- temp
    }
  }
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  values <- values[!is.na(values)]
  round(mean(values),digits=3)
}