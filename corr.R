setwd("C:\\Data Science\\NyiNyi\\ProjectExercise\\data")

corr <- function(directory, threshold = 0) 
{
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result 
  
  # set working directory
  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }
  
  # get the complete table
  complete_table <- complete("specdata", 1:332)
  nobs <- complete_table$nobs
  
  # finding the valid ids
  ids <- complete_table$id[nobs > threshold]
  
  # get the length of vector ids
  id_len <- length(ids)
  corr_vector <- rep(0, id_len)
  
  
  # Finding the file from specdata folder
  all_files <- as.character( list.files(directory) )
  file_paths <- paste(directory, all_files, sep="")
  
  j <- 1
  
  for(i in ids) {
    current_file <- read.csv(file_paths[i], header=T, sep=",")
    corr_vector[j] <- cor(current_file$sulfate, current_file$nitrate, use="complete.obs")
    j <- j + 1
  }
  
  result <- corr_vector
  return(result)   
}

print(R.version.string)
# source(corr.R)
# source(complete.R)
cr <- corr("specdata", 150)
head(cr)
summary(cr)

cr <- corr("specdata", 400)
head(cr)
summary(cr)

cr <- corr("specdata", 5000)
summary(cr)
