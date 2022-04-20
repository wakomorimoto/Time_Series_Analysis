#to do: do double differencing first

library(tidyverse)
library(ggplot2)

O3 <- read_csv(file = 'O3.csv')

time = 1:nrow(O3)
cosX = matrix(NA, ncol=6, nrow=nrow(O3))
sinX = matrix(NA, ncol=5, nrow=nrow(O3))
for (i in 1:6) {
  cosX[,i] = cos(2*pi*time*i/12)
  if (i<6){
    sinX[,i] = sin(2*pi*time*i/12)
  }
}

model1 = lm(O3$o3 ~ time + cosX + sinX)
plot(time, O3$o3, type='l')
lines(time, model1$fitted.values, col='red')

plot(time, model1$residuals, type='l', main='Residuals of Sinusoid Trend')
