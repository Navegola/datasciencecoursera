complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  for (i in 1:length(id)) {
    
    if (id[i]<10){
      cid=paste("00",id[i],sep="")
    } else if ( 10 <= id[i] && id[i] < 100){
      cid=paste("0",id[i],sep="")  
    } else  cid=as.character(id[i])
    
    
    file<-paste(directory,"/",cid,".csv",sep="")
    
    if (i==1) {df<-read.csv(file);
               cdf<-data.frame(id=id[i],nobs=sum(completos<-complete.cases(df[,1],df[,2],df[,3],df[,4])));
               next}
    
    df <- read.csv(file);
    cdf<-rbind(cdf,data.frame(id=id[i],nobs=sum(completos<-complete.cases(df[,1],df[,2],df[,3],df[,4]))))
    
    
  }
  
  cdf
  
  }