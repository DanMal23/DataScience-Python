
# using ggploy2 for data visualization

# CO2 built-in dataset
# CO2 concentration vs uptake rates, with jitter plot
# Type levels: Quebec and Mississippi
require(ggplot2)
options(repr.plot.widht=6, repr.plot.height=4) # sets graph's size
colnames(CO2)

ggplot(data = CO2) + 
  geom_jitter(mapping = aes(x = conc, y = uptake, color=Type))+
    labs(x='CO2 concentrations', y='CO2 uptake rates')
ggsave("CO2_concentr_uptake_forType_jitter.png")

#---------------------------------------------------

# CO2 concentration vs uptake rates, with density_2d plot
# Type levels

ggplot(data = CO2) + 
  geom_density_2d(mapping = aes(x = conc, y = uptake, color=Type))+
    labs(x='CO2 concentrations', y='CO2 uptake rates')
ggsave("CO2_concentr_uptake_forType_density2d.png")  
  
#---------------------------------------------------

# CO2 concentration vs uptake rates, with density_2d plot
#Treatment: a factor with levels: nonchilled, chilled

ggplot(data = CO2) + 
  geom_hex(mapping = aes(x = conc, y = uptake, color=Treatment))+
    labs(x='CO2 concentrations', y='CO2 uptake rates')

#----------------------------------------------------

# CO2 concentration vs uptake rates, with density_2d plot
# Plant factor
ggplot(data = CO2, mapping = aes(x = conc, y = uptake)) + 
  geom_point(mapping=aes(color=Plant)) +
  geom_smooth(data=dplyr::filter(CO2, Plant == "Qn1"), se = FALSE)
# filtering for a specific plant (Qn1)

#----------------------------------------------------

# 'state.x77' dataset - US all states data as of 1977
# set plot's size:
library(repr)
options(repr.plot.widht=3, repr.plot.height=4)
# putting dataset in a data.frame:
state.x77.df <- data.frame(state.x77)
# dealing with empty spaces in some columns:
names(state.x77.df) <- c('Population', 'Income', 'Illiteracy', 'LifeExp','Murder', 'HSGrad', 'Frost', 'Area')
attach(state.x77.df)
ggplot(data=state.x77.df, mapping=aes(x=HSGrad, y=Income, size=Income,color=Murder))+
    geom_point()+
      labs(x='% high-school graduates (1970)',
           y='Income per capita(1974)')

#---------------------------------------------------

