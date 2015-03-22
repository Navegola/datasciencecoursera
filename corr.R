
corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  umbral_selec<- complete(directory, 1:332)[complete(directory, 1:332)[2]>=threshold,]
  
  us<-complete(directory, 1:332)
  us1<-c(us[2]>threshold)
  umbral_selec<-us[us1,]
  
  
  
  usid<-umbral_selec[,1]
  
  #if (length(usid)==0) return()
  
  for (n in 1:length(usid)) {
    
    if (length(usid)==0) {correla<-c(); break }
    
    if (usid[n]<10){
      cusid=paste("00",usid[n],sep="")
    } else if ( 10 <= usid[n] && usid[n] < 100){
      cusid=paste("0",usid[n],sep="")  
    } else  cusid=as.character(usid[n])
    
    
    corfile<-paste(directory,"/",cusid,".csv",sep="")
    
    
    
    if (n==1) {iddf<-read.csv(corfile);
               ciddf<-iddf[complete.cases(iddf[,1],iddf[,2],iddf[,3],iddf[,4]),1:4];
               correla<-cor(ciddf[2],ciddf[3],use = "na.or.complete");
               next}
    
    iddf<-read.csv(corfile)
    ciddf<-iddf[complete.cases(iddf[,1],iddf[,2],iddf[,3],iddf[,4]),1:4];
    correla<-append(correla,cor(ciddf[2],ciddf[3],use = "na.or.complete"))
    
    
    
    
  }
  
  correla
}