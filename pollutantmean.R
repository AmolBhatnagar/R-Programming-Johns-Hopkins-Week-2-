pollutantmean<-function(directory,pollutant,id=1:332){
        
        wd<-paste("C:/AMOL_HP/R Prog/",directory,sep="")
        setwd(wd)
        len<-0
        x<-0
        for( i in id){
                if(i<=9){
                        i<-paste("00",i,sep="")
                       
                }
                if(i>9 & i <100){
                        i<-paste("0",i,sep = "")
                        
                }
                fil<-paste(i,".csv",sep="")
                data<-read.csv(fil)
                x<-x+sum(data[[pollutant]],na.rm=TRUE)
                bad<-is.na(data[[pollutant]])
                len<-len + sum(!bad)
                
        }
        means<-x/len
        return(means)
}