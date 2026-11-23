#this is just an initial stage. I will continue to work on this over the upcoming weeks!

library(tidyverse)


#Exploring the dataset
pop <- read_csv(here("Data task practice", "cps_women_lfp (1).csv"))

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
  filter(sex == "Female", age >= 16) %>% 
  select(-c(cpsidp, covid_unemployed, covid_paid, covid_telework, telework_now, telework_before,telework_difference)) %>%  #I removed these columns out because they are not important for question1
  mutate(n_lfp = ifelse(lfp == "In labor force", 1,0))

female_pop$lfp
#plotting the data
q1 <- female_pop %>% 
  group_by(year) %>% 
  summarise(
    lfp_rate = weighted.mean(n_lfp, wgt, na.rm=T)*100
  )

ggplot(data = q1, mapping = aes(
  x = year,
  y = lfp_rate
)) + labs(
  title = "Female Labor Participation rate evolved since 1994",
  x = "Year",
  y = "Participation Rate(%)"
)+geom_line() + geom_point()

#The second question: Among women older than 25, which groups (race, age, income percentile etc) of people had the biggest changes in labor force participation since 1994?
#From the start they ask for women older than 25, we can use age > 25 from the get go
q2 <- female_pop %>% 
  filter(age>25) %>% 
  group_by(year, age) %>% 
  summarise(
    lfp_rate = weighted.mean(n_lfp, wgt, na.rm=T)*100, groups. = "drop"
  )

ggplot(data = q2, mapping = aes(
  x = year,
  y = lfp_rate,
  color = age
)) + labs(
  title = "Female Labor Participation rate for each age bracket since 1994",
  x = "Year",
  y = "Participation Rate(%)"
)+geom_line(size=0.5) + geom_point() + theme_bw()
