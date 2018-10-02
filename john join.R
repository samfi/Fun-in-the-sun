library(tidyverse)
library(lubridate)

setwd("~/Documents/GitHub/fun-in-the-sun")

Temp <- read_csv("Temp.csv")
Veg <- read_csv("vegetables.csv")
Aqua <- read_csv("AQUA_PRODUCTION5.xls copy.csv")

leftJoin <-Veg %>% 
  left_join(Aqua, by="Year")

ggplot(leftJoin) +
  geom_bar(mapping = aes (x=Year, y=Vegetables), stat='identity', fill = "#F79F1E") +
  geom_bar(mapping = aes (x=Year, y=Fish), stat='identity', fill = "#9FC000") +
  labs(title = "Production Quantity of Vegetables and Fish in Australia 1961-2016") +
  ylab ("Production Quantity (tonnes)")

ggplot(leftJoin) +
  geom_bar(mapping = aes (x=Year, y=Vegetables), stat='identity', fill = "#65C8D0") +
  geom_bar(mapping = aes (x=Year, y=Fish), stat='identity', fill = "#9FC000", alpha = 3.25/5) +
  labs(title = "Production Quantity of Vegetables and Fish in Australia 1961-2016") +
  legend("topright", legend = c("Vegetables", "Fish")) +
  ylab ("Production Quantity (tonnes)")

#Aqua <- Aqua %>% 
 # select(-Type, -Item)

#Veg <- Veg %>% 
 # select(-Area,-Item,-Year)

#fullJoin <- Aqua %>%  // join code that works
 # full_join(Veg, by="Year") %>%
  #full_join(Temp, by="Year")


#ggplot(df1) +
 # geom_bar(mapping = aes (x=Year, y=Value, group=Area, fill=Area), stat='identity')

#ggplot(rightJoin) +
 # geom_col(mapping = aes(x = Year, y = Fish, group=Fish, fill=Fish)), stat = 'identity' +
  #geom_col(mapping = aes(x = Year, y = Vegetables, group=Vegetables, fill=Vegetables), stat = 'identity')
