# this functioni reads a list of files in tabdelim and returns dataframe
# with appended column containing filename source

readFunc<-function(filename){
  # take filename and read pipdelim file
  temp <- read_delim(filename,
                     delim="|",
                     progress = interactive(),
                     quote = "",
                     na = "",
                     col_names = F,
                     col_types = colTypes)
  # split file name from directories and add filename to column
  temp$fileSource <- unlist(strsplit(filename,split = "/"))[2]
  # return new dataframe
  temp
}