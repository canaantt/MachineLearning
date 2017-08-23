dataset = read.csv('Data.csv')
dataset$Age = ifelse(is.na(dataset$Age),
              ave(dataset$Age, FUN = function(x) mean(x, na.rm=TRUE)),
              dataset$Age)
dataset$Salary = ifelse(is.na(dataset$Salary),
              ave(dataset$Salary, FUN = function(x) mean(x, na.rm=TRUE)),
              dataset$Salary)

# Encoding categorical data
dataset$Country = factor(dataset$Country,
                         level = c('France', 'Spain', 'Germany'),
                         label = c(1, 2, 3))
dataset$Purchased = factor(dataset$Purchase,
                           level = c('No','Yes'),
                           label = c(0, 1))
library(caTools)
set.seed(123)
split =  sample.split(dataset$Purchase, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
