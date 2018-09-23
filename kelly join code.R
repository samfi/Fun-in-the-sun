library(tidyverse)
library(lubridate)

setwd("~/Documents/GitHub/oohwowsers")

rain <- read_csv("rain.csv")
maxTemp <- read_csv("maxtemp.csv")
minTemp <- read_csv("mintemp.csv")
solar <- read_csv("solarexp.csv")

##get number of rows and cols for each
##what can we merge on?

##date

rain <- rain %>% 
  mutate(Date=paste(Year, Month, Day, sep="-")) %>% 
  mutate(Date = ymd(Date)) %>% 
  select(-Year, -Month, -Day, -`Product code`, -`Bureau of Meteorology station number`, -`Period over which rainfall was measured (days)`, -Quality) %>% 
  rename(rainfall =  `Rainfall amount (millimetres)`) 


maxTemp <- maxTemp %>% 
  mutate(Date=paste(Year, Month, Day, sep="-")) %>% 
  mutate(Date = ymd(Date)) %>% 
  select(-Year, -Month, -Day, -`Product code`, -`Bureau of Meteorology station number`, -`Days of accumulation of maximum temperature`, -Quality) %>% 
  rename(maxTemp = `Maximum temperature (Degree C)`)

minTemp <- minTemp %>% 
  mutate(Date=paste(Year, Month, Day, sep="-")) %>% 
  mutate(Date = ymd(Date)) %>%
  select(-Year, -Month, -Day, -`Product code`, -`Bureau of Meteorology station number`, -`Days of accumulation of minimum temperature`, -Quality) %>% 
  rename(minTemp = `Minimum temperature (Degree C)`)

solar <- solar %>% 
  mutate(Date=paste(Year, Month, Day, sep="-")) %>% 
  mutate(Date = ymd(Date)) %>%
  select(-Year, -Month, -Day, -`Product code`, -`Bureau of Meteorology station number`) %>% 
  rename(SolarExp= `Daily global solar exposure (MJ/m*m)`)


##join all rows and cols - ignore NAs for all - merging on data field
##FULL JOIN
fullJoin <- rain %>% 
  full_join(maxTemp, by="Date") %>%
  full_join(minTemp, by="Date") %>% 
  full_join(solar, by="Date") %>%
  select(Date, rainfall, maxTemp, minTemp, SolarExp)

##left join
leftJoin <- rain %>% 
  left_join(maxTemp) %>%
  left_join(minTemp, by="Date") %>% 
  left_join(solar, by="Date") %>%
  select(Date, rainfall, maxTemp, minTemp, SolarExp)

##rightjoin
rightJoin <- rain %>% 
  right_join(maxTemp, by="Date") %>%
  right_join(minTemp, by="Date") %>% 
  right_join(solar, by="Date") %>%
  select(Date, rainfall, maxTemp, minTemp, SolarExp)

 
# exercise in class
# mix the joins up depending on the need -
#   is max_temp impacted by solarExposure in any way? 
#   what is the min and max temp in Sydney?
#   does high rainfall correlate with low temperatures?