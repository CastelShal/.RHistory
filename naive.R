library(class)
library(caret)
library(ggplot2)
library(e1071)
data = na.omit(iris)

normalize = function(x){
  return (x - min(x)) / (max(x) - min(x))
}


sampler = sample(nrow(data), size=0.9*nrow(data), replace=FALSE)

data$Sepal.Length = normalize(data$Sepal.Length)
data$Petal.Length = normalize(data$Petal.Length)
data$Sepal.Width = normalize(data$Sepal.Width)
data$Petal.Width = normalize(data$Petal.Width)

training_data = data[sampler,]
testing_data = data[-sampler,]

training_labels = training_data[,5]
training_data = training_data[,-5]

testing_labels = testing_data[,5]
testing_data = testing_data[,-5]

model = naiveBayes(training_data, training_labels)

prediction = predict(model, testing_data)
confusionMatrix(prediction, testing_labels)
