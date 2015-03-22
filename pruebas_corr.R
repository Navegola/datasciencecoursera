
directory="specdata"
threshold=150

## cr <- corr("specdata", 300)

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

source("corr.R")
source("complete.R")
cr <- corr("specdata", 150)
head(cr)
summary(cr)
