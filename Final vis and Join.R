library(tidyverse)
library(lubridate)

setwd("~/Documents/GitHub/fun-in-the-sun")

Temp <- read_csv("Temp.csv")
Veg <- read_csv("vegetables.csv")
Aqua <- read_csv("AQUA_PRODUCTION5.xls.csv")


fullJoin <- Aqua %>% 
  full_join(Veg, by="Year") %>%
  full_join(Temp, by="Year")
  
