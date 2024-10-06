library(class)
library(caret)
library(ggplot2)
data = iris

normalize = function(x){
  return (x - min(x)) / (max(x) - min(x))
}



data$Sepal.Length = normalize(data$Sepal.Length)
data$Petal.Length = normalize(data$Petal.Length)
data$Sepal.Width = normalize(data$Sepal.Width)
data$Petal.Width = normalize(data$Petal.Width)

x_train = data[0:(nrow(data)-10),0:4]
x_test = data[(nrow(data) - 10):nrow(data),0:4]
y_train = data[0:(nrow(data)-10),5]
y_test = data[(nrow(data)-10):nrow(data),5]


model = knn(x_train, x_test, y_train, k = 10)
confusionMatrix(model, y_test)
