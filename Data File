#this is just an initial stage. I will continue to work on this over the upcoming weeks!

library(tidyverse)


#Exploring the dataset
pop <- read_csv("filepath/cps_women_lfp (1).csv")

#I am using these 2 functions to see what top and last few data look like
head(pop)
tail(pop)
unique(pop$sex) # there are female and male under the sex column


#It occurs to me that there are missing values "NA". I used anyNA to double check
anyNA(pop)
anyDuplicated(pop)) #I used this function to count how many duplicated data there are

#The first question on the data task: How has female labor force participation evolved since 1994? Please provide graphs and/or tables to support your answer.
#Firstly, I will remove male out of the sex column so I could only see the female data
female_pop <- pop %>%
  filter(sex == "Female") %>% 
  select(-race)

female_pop 

unique(female_pop$education)
unique(female_pop$age)
unique(female_pop$lfp)
