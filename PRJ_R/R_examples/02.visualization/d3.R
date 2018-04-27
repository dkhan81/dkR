install.packages("d3Network")
library(d3Network)
library(RCurl)

Source <- c("A", "A", "A", "A", "B", "B", "C", "C", "D")
Target <- c("B", "C", "D", "J", "E", "F", "G", "H", "I")
NetworkData <- data.frame(Source, Target)
NetworkData
myOpenHtml <- function(filename) {
  if (Sys.info()["sysname"]=="windows") {
    shell.exec(filename)
  } else {
    system(paste("open",filename)) # mac case
  }
}

d3SimpleNetwork(NetworkData, width = 400, height = 250,file="test1.html")
myOpenHtml("test1.html")
