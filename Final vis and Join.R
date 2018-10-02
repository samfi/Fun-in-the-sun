library(tidyverse)
library(lubridate)

setwd("~/Documents/GitHub/fun-in-the-sun")

Temp <- read_csv("Temp.csv")
Veg <- read_csv("vegetables.csv")
Aqua <- read_csv("AQUA_PRODUCTION5.xls.csv")
Veg2 <- read_csv("veg deluxe.csv")


fullJoin <- Aqua %>% 
  full_join(Veg, by="Year") %>%
  full_join(Temp, by="Year")
  
Veg2 <- Veg2 %>% 
  full_join(Temp, by="Year")

ggplot(data = Veg2) + 
  geom_bar(mapping = aes(x = Year, y = Vegetables), stat = 'identity')+
  geom_smooth(mapping = aes(x = Year, y = temp),stat = 'identity')
  

  
options(scipen=999)
