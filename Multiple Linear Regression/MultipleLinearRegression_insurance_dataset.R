
getwd()

dataset = read.csv("insurance.csv")

# install.packages('caTools')


dataset$sex = factor(dataset$sex,
                     levels = c('male', 'female'),
                     labels = c(1,0))
dataset$smoker = factor(dataset$smoker,
                     levels = c('yes', 'no'),
                     labels = c(1,0))
dataset$region = factor(dataset$region,
                     levels = c('southwest', 'southeast', 'northwest', 'northeast'),
                     labels = c(1, 2, 3, 4))




set.seed(121)
split = sample.split(dataset$charges, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


regressor = lm(formula = charges ~., data = training_set)
summary(regressor)

# Eliminating region
regressor = lm(formula = charges ~ age + sex + bmi + children + smoker,
               data = training_set)
summary(regressor)

# Eliminating sex
regressor = lm(formula = charges ~ age + bmi + children + smoker,
               data = training_set)
summary(regressor)





