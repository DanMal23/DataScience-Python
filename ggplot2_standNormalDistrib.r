# -------------------------------------------------
# data from external library 'SemiPar', 'ustem' dataset,
# shows Average minimum January temperature in US cities
# standard normal distribution formula was applied
# the top bars show cities with the highest min average temperature,
# the lowest bars cities with the lowest

library(SemiPar) # https://hofmann.public.iastate.edu/data_in_r_sortable.html
data(ustemp) # 56 observations on the temperature and location of 56 U.S. cities

#nrow(ustemp) # 56

# STANDARD NORMAL DISTRIBUTION, rouded:
ustemp$min.temp_stnd <- round((ustemp$min.temp - mean(ustemp$min.temp))/sd(ustemp$min.temp),2) 
ustemp$min.temp_type <- ifelse(ustemp$min.temp_stnd < 0, "below", "above")  
# order() function for sorting:
ustemp <- ustemp[order(ustemp$min.temp_stnd), ]  
# convert to factor for sorted order in plot:
# (factor categorizes data and stores it at levels)
ustemp$city <- factor(ustemp$city, levels=ustemp$city) 

ggplot(ustemp, aes(x=city, y=min.temp_stnd, label=min.temp_stnd)) + 
  geom_bar(stat='identity', aes(fill=min.temp_type), width=.5) +
  scale_fill_manual(name="min.temp", 
                    labels = c("above average", "below average"), 
                    values = c("above"="#2b4769", "below"="#b59696")) + 
  labs(title="Average minimum January temperature in US cities",
       subtitle="Data from SemiPar library,'ustemp' dataset",
       y='Lowest temperature - Standard normal distribution') +
  coord_flip()

# ggsave('ggplot2_usmintemp_stnd.png')

# --------------------------------------------
# codes inspired by: 
# http://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html

# ---------------------------------------------

# data from external library PASWR, 'Cars2004EU' dataset

library(PASWR) # https://hofmann.public.iastate.edu/data_in_r_sortable.html
data(Cars2004EU) # Cars in the European Union (2004) 
head(Cars2004EU)#25rows
#cars-numbers of cars per 1000 inhabitants
#population- country population/1000
library(repr)
options(repr.plot.width=6,repr.plot.height=5)

Cars2004EU$cars_stnd <- round((Cars2004EU$cars - mean(Cars2004EU$cars))/
                                   sd(Cars2004EU$cars),2) 
Cars2004EU$cars_type <- ifelse(Cars2004EU$cars_stnd < 0, "below", "above")  
Cars2004EU <- Cars2004EU[order(Cars2004EU$cars_stnd), ]  # sorting
# convertion to factor for sorted order in plot:
# (factor categorizes data and stores it at levels)
Cars2004EU$country <- factor(Cars2004EU$country, levels=Cars2004EU$country) 
ggplot(Cars2004EU, aes(x=country, y=cars_stnd, label=cars_stnd)) + 
  geom_bar(stat='identity', aes(fill=cars_type), width=.7) +
  scale_fill_manual(name="cars", 
                    labels = c("above average", "below average"), 
                    values = c("above"="#2a3542", "below"="#c29374")) + 
  labs(title="NSD - cars per 1000 inhabitants in 25 EU countries",
       subtitle="Data from PASWR library, 'Cars2004EU' dataset",
       x='countries', y='number of cars - Standard normal distribution') +
  coord_flip()
ggsave('ggplot2_EUcars_stnd.png')

# -----------------------------------------
