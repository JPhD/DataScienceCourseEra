getwd()

corr <- function(directory, threshold = 0){
  v = numeric() 
  for (i in 1:332) {
    if (i < 10){
      j = paste("00", as.character(i), ".csv", sep = "")
    } else if (i < 100) {
      j = paste("0", as.character(i) ,".csv", sep = "")
    } else {
      j = paste (as.character(i), ".csv" , sep = "")
    }
    fname = paste(directory, j, sep = "/")
    f = read.csv(fname) 
    a = is.na(f$su) 
    b = is.na(f$ni) 
    c = (!a) * (!b)
    n = sum(c)  
    if (n > threshold){
      v = c(v, cor(f$su, f$ni, use = "complete.obs"))
    }
  }
  v
}

cr <- corr("specdata", 150)
head(cr)

summary(cr)

cr <- corr("specdata", 400)
head(cr)

summary(cr)

cr <- corr("specdata", 5000)
summary(cr)

length(cr)
