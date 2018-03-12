library(readr)
library(dplyr)
library(tidyr)
library(stringr)

str(titanic_original)

titanic_clean<-titanic_original
str(titanic_clean)
table(titanic_clean$embarked, useNA = "always")

titanic_clean<-titanic_clean %>% mutate(embarked = replace(embarked,embarked %in% c("NA", " "),"S"))
str(titanic_clean$embarked)
sum(is.na(titanic_clean$embarked))


summary(titanic_clean$age)
table(titanic_clean$age, useNA = "always")
titanic_clean<-titanic_clean %>% mutate(age = replace(age,age %in% c(NA," " ),30))
sum(is.na(titanic_clean$age))


sum(is.na(titanic_clean$boat))
str(titanic_clean$boat)
titanic_clean<-titanic_clean %>% mutate(boat = replace(boat,boat %in% c(" ", NA),"NA"))

str(titanic_clean$cabin)

titanic_clean<-titanic_clean %>% mutate(cabin = replace(cabin,cabin %in% c(" ", NA),"NA"))
sum(is.na(titanic_clean$cabin))
titanic_clean$has_cabin_number<-ifelse(titanic_clean$cabin == "NA", "0", "1")


write.csv(titanic_clean, "C:/Users/Angie/Documents/_School/Angie/__Data Science/_Springboard/exercises/Exercise2/titanic_clean.csv")









