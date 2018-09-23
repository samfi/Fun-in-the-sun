library(tidyverse)
library(lubridate)

setwd("~/Documents/GitHub/Fun-in-the-sun")

options(scipen = 999)

(df1 <- read_csv("vegetables.csv"))
(df1 <- read_csv("AQUA_PRODUCTION5.xls.csv"))
(df1 <- read_csv("temp.csv"))

vegi <- read_csv("vegetables.csv", colClasses = c("Year"))
temp <- read_csv("Temp.csv", colClasses = c("Year"))
fish <- read_csv("AQUA_PRODUCTION5.xls.csv", colClasses = c("Year"))

#ggplot(df1, aes(Year, Value, group=Item, colour=Item)) +
  #geom_line() +
  #facet_wrap(~Area) +
  #labs(title = "Production of Vegetables 1961-2016")

fish <- fish %>% 
  gather('Year', 'Value', c(-Country, -Code))

fish$Country <- NULL

View (fish)

fullJoin <- temp %>% 
  full_join(vegi, by="Year") %>%
  full_join(fish, by="Year") %>% 
  select(Year, temp, vegi, fish)

leftJoin <- temp %>% 
  left_join(vegi, by="Year") %>%
  left_join(fish, by="Year") %>%
  select(Year, fish, temp, vegi)

rightJoin <- temp %>% 
  right_join(vegi, by="Year") %>%
  right_join(fish, by="Year") %>%
  select(Year, fish, temp, vegi)
