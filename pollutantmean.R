pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  

  
  
  for (i in 1:length(id)) {
    
    if (id[i]<10){
      cid=paste("00",id[i],sep="")
    } else if ( 10 <= id[i] && id[i] < 100){
      cid=paste("0",id[i],sep="")  
    } else  cid=as.character(id[i])
    
    
    file<-paste(directory,"/",cid,".csv",sep="")
    
    
    if (i==1) {df<-read.csv(file);next}
    
    df <- rbind(df, read.csv(file)) 
    
  }
  
  round(mean(df[[(pollutant)]],na.rm=TRUE),digits=3)
  
}
