corr<-function(directory,threshold=0){
        
        wd<-paste("C:/AMOL_HP/R Prog/",directory,sep="")
        setwd(wd)
        c1<-numeric(0)
        d<-complete("specdata")
        
        for(i in 1:nrow(d)) {
                row <- d[i,]
                if(row["nobs"] > threshold){
                        if(row["id"]<=9){
                                k<-paste("00",row["id"],sep="")
                                
                        }
                        if(row["id"]>9 & row["id"]<100){
                                k<-paste("0",row["id"],sep = "")
                                
                        }
                        if(row["id"]>100){
                                k<-row["id"]
                        }
                        fil<-paste(k,".csv",sep="")
                        data<-read.csv(fil)
                        c1<-c(c1,cor(data$nitrate, data$sulfate,use="complete.obs"))
                        
                        
                }
                
        }
        if(length(c1)<0){
                return(numeric(0))
        }
        else {
                
                return(c1)       
        }
        
        
        
}