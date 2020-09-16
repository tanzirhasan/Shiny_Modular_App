library(tidyverse)
library(gapminder)
all_data <-gapminder %>%filter(country!="Kuwait") # removing kuwait as it distorts the gap sacle
africa_data <-gapminder%>%filter(continent == "Africa")
americas_data <- gapminder %>% filter(continent =="Americas")
asia_data <- gapminder%>% filter(continent=="Asia",country!="Kuwait")
europe_data <- gapminder%>% filter(continent=="Europe")
oceania_data <- gapminder%>% filter(continent=="Oceania")
