install.packages("ggmap")
install.packages("lubridate")
install.packages("RJSONIO")
library(ggmap)
library(lubridate)
# Satellite Map
mapImageData1 <- get_map(location=c(lon=126.97947, lat=37.54893)
                         ,color="color",source="google"
                         ,maptype="satellite",zoom=10)
ggmap(mapImageData1,extent="device",ylab="Latitude"
      ,xlab="Longitude")

# Terrain Map
mapImageData1 <- get_map(location=c(lon=126.97947, lat=37.54893),color="color",source="google",maptype="terrain",zoom=10)
ggmap(mapImageData1,extent="device",ylab="Latitude",xlab="Longitude")

# Various Maps
ggmap(get_googlemap(center='korea',zoom=7,maptype='roadmap'),extent='device')
ggmap(get_googlemap(center='korea',zoom=7,maptype='hybrid'),extent='device')




# earthquake in korea ###############################################
eq<-read.table("data\\eq.txt",sep="\t",header=T,stringsAsFactors=F)
head(eq)
eq$latitude<-unlist(strsplit(eq$latitude," "))[seq(from=1,to=nrow(eq),by=2)]
eq$latitude<-as.double(eq$latitude)
eq$longitude<-unlist(strsplit(eq$longitude," "))[seq(from=1,to=nrow(eq),by=2)]
eq$longitude<-as.double(eq$longitude)

eq$date<-ymd_hm(eq$date) # this may not be working, but it doesn't matter. Go ahead!
eq$year<-substr(eq$date,1,4)
head(eq)
ggmap(get_googlemap(center='korea',zoom=7,maptype='terrain'),extent='device')+geom_point(aes(x=longitude,y=latitude,size=power),data=eq, alpha=0.7)
#ggpath

