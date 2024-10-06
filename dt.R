library(rpart)
library(rpart.plot)
library(rattle)
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

#training_labels = training_data[,5]
#training_data = training_data[,-5]

#testing_labels = testing_data[,5]
#testing_data = testing_data[,-5]//

model = rpart(training_data$Species~., data=training_data, minsplit=2)
fancyRpartPlot(model)

model = ctree(training_data$Species~., data=training_data)
p = predict(model, testing_data[,-5])
CrossTable(p, testing_data[,5])
plot(model)
