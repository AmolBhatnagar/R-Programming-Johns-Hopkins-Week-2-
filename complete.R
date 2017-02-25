complete<-function(directory,id=1:332){
        
        wd<-paste("C:/AMOL_HP/R Prog/",directory,sep="")
        setwd(wd)
        id1<-0
        nobs1<-0
        for( i in id){
                g<-i
                if(i<=9){
                        i<-paste("00",i,sep="")
                        #i<-as.numeric(i)
                }
                if(i>9 & i<100){
                        i<-paste("0",i,sep = "")
                        #i<-as.numeric(i)
                }
                fil<-paste(i,".csv",sep="")
                data<-read.csv(fil)
                d<-is.na(data[["Date"]])
                s<-is.na(data[["sulfate"]])
                n<-is.na(data[["nitrate"]])
                k<-!d & !s & !n
                s<-sum(k)
                id1<-c(id1,g)
                nobs1<-c(nobs1,s)
        }
        p<-data.frame(id=id1[-1],nobs=nobs1[-1])
        return(p)
}
