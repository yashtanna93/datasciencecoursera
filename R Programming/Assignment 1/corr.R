corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  files <- list.files(directory)
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  cr <- c()
  id = 1:332
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
    temp <- read.csv(filelocation)[,c("sulfate","nitrate")]
    completedata <- temp[complete.cases(temp),]
    if ( nrow(completedata) > threshold ) {
      cr <- c(cr, cor(completedata$sulfate, completedata$nitrate) ) # append corralations
    }
  }
  ## Return a numeric vector of correlations
  return(cr)
}