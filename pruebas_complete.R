
directory="specdata"
id=30:25

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
       
