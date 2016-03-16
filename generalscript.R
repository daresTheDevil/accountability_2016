library(readr)
library(dplyr)



readfunc<-function(file){
read_delim(file,delim="|",progress=interactive(),quote="",na="",col_names=FALSE,col_types="iiciiccccccicccccccccc")}


dir(path="C:/Users/dkay/Documents/New_with_Pipe/",pattern='txt$',recursive=T,full.names=T) %>%
lapply(FUN=readfunc) %>%
rbind_all %>%
write_rds("C:/Users/dkay/Documents/allthethings.rds")