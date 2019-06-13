
setwd("C:\\Data Science\\NyiNyi\\ProjectExercise\\data")
#getwd()
#list.files()

pollutantmean <- function(directory, pollutant = "sulfate", id = 1:332) 
{

  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  # set the working directory
  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }
  
  mean_vector <- c()
  
  # Finding the file from specdata folder
  Get_all_files <- as.character( list.files(directory) )
  Get_all_file_paths <- paste(directory, Get_all_files, sep="")
  
  for(i in id) 
  {
    Current_file <- read.csv(Get_all_file_paths[i], header=T, sep=",")
    head(Current_file)
    
    #To Remove na
    removed_na <- Current_file[!is.na(Current_file[, pollutant]), pollutant]
    mean_vector <- c(mean_vector, removed_na)
  }
  
  result <- mean(mean_vector)
  return(result)
  
}

print(R.version.string)

#source ("pollutantmean.R")
pollutantmean("specdata", "sulfate", 1:10) 
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)