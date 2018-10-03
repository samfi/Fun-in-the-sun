library(tidyverse)
library(lubridate)

setwd("~/Documents/GitHub/fun-in-the-sun")

Temp <- read_csv("Temp.csv")
Veg <- read_csv("vegetables.csv")
Aqua <- read_csv("AQUA_PRODUCTION5.xls.csv")
Veg2 <- read_csv("veg deluxe.csv")
Aqua2 <- read_csv("AQUA_PRODUCTION6.xls.csv")


join <- Aqua2 %>% 
  left_join(Veg2, by="Year") %>%
  left_join(Temp, by="Year")
  
Vegtemp <- Veg2 %>% 
  full_join(Temp, by="Year")

ggplot(data = Vegtemp) + 
  geom_bar(mapping = aes(x = Year, y = Vegetables), stat = 'identity')+
  geom_bar(mapping = aes(x = Year, y = temp),stat = 'identity', fill = 'blue')

ggplot(data = join) + 
  geom_bar(mapping = aes(x = Year, y = Vegetables), stat = 'identity', fill = 'green')+
  geom_bar(mapping = aes(x = Year, y = Fish),stat = 'identity', fill = 'blue', opacity = '50')+
  geom_smooth(mapping = aes(x = Year, y = temp),stat = 'identity', color = 'white')
  
options(scipen=999)
