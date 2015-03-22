


directory="specdata"
pollutant<-"sulfate"
id=1:332


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

mean(df[[(pollutant)]],na.rm=TRUE)



