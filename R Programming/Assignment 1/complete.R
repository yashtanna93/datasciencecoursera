complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  files <- list.files(directory)
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  idd <- c()
  nobb <- c()
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
    idd <- append(idd, i)
    temp <- read.csv(filelocation)[,c("sulfate","nitrate")]
    nobb <- append(nobb, nrow(na.omit(temp)))
  }
  return(data.frame(id=idd, nobs=nobb))
}