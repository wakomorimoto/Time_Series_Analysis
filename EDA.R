
library(tidyverse)
library(ggplot2)
phoenix <- read.csv('phoenix.csv')

#combine year, month, and date columns
phoenix$time <- as.Date(with(phoenix, paste(year,month,day, sep="-")), "%Y-%m-%d")

#NO2
NO2 <- phoenix %>%
  select('year','month','day','time','no2')
ggplot(NO2, aes(x=time, y=no2)) + geom_line() + ggtitle('NO2')

#O3
O3 <- phoenix %>%
  select('year','month','day','time','o3')
ggplot(O3, aes(x=time, y=o3)) + geom_line() + ggtitle('O3')

#SO2
so2 <- phoenix %>%
  select('year','month','day','time','so2')
ggplot(so2, aes(x=time, y=so2)) + geom_line() + ggtitle('SO2')

#CO
co <- phoenix %>%
  select('year','month','day','time','co')
ggplot(co, aes(x=time, y=co)) + geom_line() + ggtitle('CO')
