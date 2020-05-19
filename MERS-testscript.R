# Lambodhar Damodaran
# 05/19/2020
#test script using mers data for IDEAS 2020 Computational Workshop

library(lubridate)
library(ggplot2)

mers <- read.csv('cases.csv')
mers$hospitalized[890] <- c('2015-02-20')
mers <- mers[-471,]
mers$onset2 <- ymd(mers$onset)
mers$hospitalized2 <- ymd(mers$hospitalized)
class(mers$onset2)

day0 <- min(na.omit(mers$onset2))
mers$epi.day <- as.numeric(mers$onset2 - day0)

ggplot(data=mers) +
  geom_bar(mapping = aes(x=epi.day)) +
  labs(x='Epidemic day', y='Case count', title = 'Global MERS case count by dat of onset', caption = 'Data from Rambaut - MERS')

