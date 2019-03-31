pollutantmean <- function(directory, pollutant, id = 1:332) {
  csv_files <- list.files(directory, full.names = TRUE)
  z <- data.frame()
  for(i in id){
    x <- read.csv(csv_files[i])
    z <- rbind(z, x)
  }
  return(mean(z[, pollutant], na.rm = TRUE))
}

x = read.csv("specdata/001.csv")

pollutantmean("specdata", "sulfate", 1:10)

pollutantmean("specdata", "nitrate", 70:72)

pollutantmean("specdata", "nitrate", 23)
