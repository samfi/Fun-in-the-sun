library(tidyverse)
library(lubridate)

setwd("~/Documents/GitHub/fun-in-the-sun")

Temp <- read_csv("Temp.csv")
Veg <- read_csv("veg deluxe.csv")
Aqua <- read_csv("AQUA_PRODUCTION6.xls.csv")

leftJoin <-Veg %>% 
  left_join(Aqua, by="Year")

ggplot(leftJoin) +
  geom_bar(mapping = aes (x=Year, y=Vegetables), stat='identity', fill = "#65C8D0") +
  geom_bar(mapping = aes (x=Year, y=Fish), stat='identity', fill = "#9FC000", alpha = 3.25/5) +
  labs(title = "Production Quantity of Vegetables and Fish in Australia 1961-2016") +
  ylab ("Production Quantity (tonnes in thousands)")
