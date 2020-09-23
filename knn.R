#### imported data as "houses"

#### DATA SPLIT
set.seed(0)
library(caTools)
sample <- sample.split(houses$Sold, SplitRatio = 0.8)
train<- subset(houses, sample==TRUE)
test<- subset(houses, sample==FALSE)

#### PRE PROCESSING
train_indep <- train %>% select(-Sold)
train_labels <- train$Sold

test_indep <- test %>% select(-Sold)
test_labels <- test$Sold

#### SCALING
# we scale the variables as distances are compared and their actual values may lead to bias

train_indep_scaled <- scale(train_indep)
test_indep_scaled <- scale(test_indep)

#### MODEL
library(class)
k_value = 3
set.seed(0)

knn_predictions <- knn(train_indep_scaled,
                       test_indep_scaled,
                       train_labels,
                       k = k_value)

#### CONFUSION MATRIX
table(knn_predictions,test_labels)
#                test_labels
#knn_predictions     0  1
#                 0 38 19
#                 1 17 27

error <- mean(knn_predictions != test_labels)
# [1] 0.3564356

#### VARYING K

predicted <- NULL
error_rate<- NULL

for(i in 1:20){
         predicted <- knn(train_indep_scaled,
                          test_indep_scaled,
                          train_labels,
                          k = i)
         error_rate[i]<- mean( test_labels != predicted)
}
error_rate

library(ggplot2)
k.values <- 1:20
error_df <- data.frame(error_rate,k.values)
ggplot(error_df,aes(x=k.values, y=error_rate)) + geom_point() +geom_line(lty="dotted", colour="red")

# hence choose k=3