******************************************
* Readme for Accountability Data Cohort 2011-2014
* 
* Software Used:
* - data exported from warehouse using pl_sql
* - - exported to pipe "|" delimited text files by YEAR/MONTH
* 
* - 'R' statistical computing software on OSX 10.11.3
* -- "dplyr" library for data munging
* -- "readr" library for advanced file importing
* -- "lubridate" library for date/time analysis
* -- "stringr" library for data munging
* -- "foreign" for reading/writing SAS .dbf files
*
*
* FILE DESCRIPTION
* 
*
*********************************************

1. Write function to import individual text files and concatenate into one file

library(readr)
library(dplyr)
library(lubridate)
library(stringr)
library(foreign)


    readFunc <- function(file) {
        read_delim(file, delim = "|", progress = interactive(), quote = "", NA = "",
        col_names = FALSE, col_types = "iiciiccccccicccccccccc")
    }

2. Read list of files, read the data for each filename and concatenate the whole thing

    dir(path = "$FILE.PATH.HERE", pattern = "txt$", recursive = TRUE, full.names = T) %>%       # get list of filenames
        lapply(FUN = readFunc) %>%          # apply the 'readFunc' function to each filename from above
        rbind_all %>%       # append data from current filename to existing data

3. Apply strinr and lubridate functions to convert dates to ISO8601 format

4. use calcPeerGrade function to calculate peergrade and append column with peergrades

    calcPeerGrade <- function(bDate,curYear) {        # function takes birth date and current year as args
        curYearStart <- as.Date(paste(curYear, "09", "01",
            sep = "-"),format = "Y%-%m-%d")                     # convert current year to start date for calculation
        currentAge <- as.period(interval(bDate,curYearStart),
            unit = "days")                                      # calculate time between birthday and 01SEP of current year
        currentAge <- day(currentAge)                           # recast
        temp <- currentAge %/% 365.25                           # divide days by 365.25 IAW pGrade standard
        pGrade <- temp - 5                                      # subtract 5 IAW pGrade standard
        pGrade                                                  # return pGrade
    }
