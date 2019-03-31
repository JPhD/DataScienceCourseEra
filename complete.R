getwd()

complete <- function(directory, id=1:332){
  df = data.frame() 
  for (i in id) {
    if (i < 10){
      j = paste("00", as.character(i), ".csv",sep="")
    } else if (i<100) {
      j = paste("0", as.character(i), ".csv",sep="")
    } else{
      j = paste(as.character(i),".csv",sep="")
    }
    fname = paste(directory, j, sep = "/")
    f = read.csv (fname) 
    a = is.na (f$su) 
    b = is.na (f$ni) 
    n = sum((!a) * (!b))  
    df = rbind(df,c(i,n))
  }
  colnames(df) = c("id","nobs")
  df
}


complete("specdata", 1)

complete("specdata", c(2, 4, 8, 10, 12))

complete("specdata", 30:25)

complete("specdata", 3)
