
# using quick plot for data analysis & data visualization

# 'economics' built-in dataset 
# date vs. total population 

options(repr.plot.width=5,repr.plot.height=3)
qplot(date, pop, data=economics, geom='point',
     xlab='Date', ylab='Total population, in thousands', 
     main='US economic time series')
#----------------------------------------------

# date vs. number of unemployed 

library(repr)
options(repr.plot.width=5,repr.plot.height=3)
qplot(date,unemploy,data=economics, geom='point',
     xlab='Date',ylab='Number of unemployed in thousands')
# ---------------------------------------------

# 'infert' data set on
# Infertility after Spontaneous and Induced Abortion
# histogram of age
qplot(age, data=infert,geom='histogram')
# -----------------------------------------

# age vs induced abortions + education factor
library(repr) # plot size
options(repr.plot.widht=3, repr.plot.height=4)
qplot(age,induced,data=infert, color=factor(education),
    geom=c('smooth'), xlab='Age',
      ylab='Induced Abortions', main='Infertility after Induced Abortions')
# -----------------------------------------

# 'state.x77' dataset
# containing variables for all US states, as of 1977
#`data` must be a data frame, or other object coercible by `fortify()`, not a numeric vector

state.x77.df <- data.frame(state.x77)

# murder vs illiteracy

qplot(Murder, Illiteracy, data=state.x77.df, geom=c("point","smooth"),
    xlab='Murder - per 100,000 population (1976)', 
    ylab='% illiterate population(1970)', 
    main="Variables for all US states, as of 1977, from 'state.x77' dataset")
     
# -----------------------------------------

# HS graduates vs income

# plot's size:
library(repr)
options(repr.plot.widht=3, repr.plot.height=4)
# dataset in a data.frame:
state.x77.df <- data.frame(state.x77)
# dealing with empty spaces in some columns:
names(state.x77.df) <- c('Population', 'Income', 'Illiteracy', 'LifeExp','Murder', 'HSGrad', 'Frost', 'Area')
attach(state.x77.df)
qplot(HSGrad, Income, data=state.x77.df,
    geom=c('point','smooth'), xlab='% high-school graduates (1970)',
      ylab='Income', main='US, as of 1977')
# ----------------------------------------

