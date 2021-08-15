rm(list = ls()) # Remove all variable stored previous / Menghapus semua variable sebelumnya
library(Hmisc) # Import library Hmisc / jika belum punya maka download terlebih dahulu

data <- read.csv("C:/TUGAS RAYHAN/Data Scientist/R language/R Project/Covid 19/Data Excel Covid 19 First/COVID19_line_list_data.csv") # Import dari excel database

describe(data) # Hmisc command to show data / command untuk menunjukan variable data

# cleaned up death colom / menghapus colom data
data$death_dummy <- as.integer(data$death != 0)

# death rate / rata-rata mati
sum(data$death_dummy) / nrow(data)


# Age / umur
# Claim : people who died are older
dead = subset(data, death_dummy == 1)
alive = subset(data, death_dummy == 0)
mean(dead$age, na.rm = TRUE)
mean(alive$age, na.rm = TRUE)

# Data significant
t.test(alive$age, dead$age, alternative="two.sided", conf.level = 0,99)

# Gender
# claim : gender tidak berpengaruh
men = subset(data, gender == "male") # 8.4 %
women = subset(data, gender == "female") # 3.6 %
mean(men$death_dummy, na.rm = TRUE)
mean(women$death_dummy, na.rm = TRUE)

# Data significant
t.test(women$death_dummy,men$death_dummy, alternative = "two.sided", conf.level = 0.99)
# 99% confidence, men have from 0.8 % to 8.8 % higher chance
