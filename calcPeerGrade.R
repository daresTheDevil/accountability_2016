calcPeerGrade <- function(bDate,curYear) {
  require(lubridate)
  curYearStart <- as.Date(paste(curYear,"09","01",sep = "-"),format = "%Y-%m-%d")
  currentAge <- as.period(interval(bDate,curYearStart),
                      unit = "days")
  currentAge <- day(currentAge)
  temp <- currentAge %/% 365.25
  pGrade <- temp - 5
  pGrade
}



