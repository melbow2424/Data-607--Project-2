library(dplyr)
library(tidyverse)
library(plyr)

#Analysis: Which animated TV series produced the most episodes and from which county.

# Reading in csv file from GitHub. There were two different csv files.     

animated_tv_1948_1986 = read.csv('https://raw.githubusercontent.com/melbow2424/Data-607--Project-2/main/Animated%20TV%20Shows%20Around%20the%20World%20(1948%20-%201986).csv',
                                 na.strings=c("","NA"))

animated_tv_1987_2022 = read.csv('https://raw.githubusercontent.com/melbow2424/Data-607--Project-2/main/Animated%20TV%20Shows%20Around%20the%20World%20(1987%20-%202022).csv',
                                 na.strings=c("","NA"))

# Can write in csv after combining 2 csv files  

write.csv(animated_tv_1948_1986, file = "Animated TV Shows Around the World (1948 - 1986).csv")
write.csv(animated_tv_1987_2022, file = "Animated TV Shows Around the World (1987 - 2022).csv")


# Combining csv file to get all years from 1948 ??? 2022 in years 

animated_tv <- rbind.fill(animated_tv_1948_1986,animated_tv_1987_2022) %>%
  filter(Episodes != "TBA") 

# Viewing dataframe

head(animated_tv)

#Checking structure of data frame

str(animated_tv)


#When checking the structure, Episodes of tv shows are in char variable. 
#To find the greatest number of episodes of tv shows, char needed to change to integer (or num).
#I chose integer 

animated_tv <- transform(animated_tv, Episodes = as.integer(Episodes))

# Checking structure of data frame
str(animated_tv)


#Creating data frame with just the max (greatest number) of episodes of tv shows.
most_episodes <- animated_tv[animated_tv$Episodes == max(animated_tv$Episodes, na.rm = TRUE) ,]


#Displaying that dataframe
head(most_episodes, 1) 

animated_tv