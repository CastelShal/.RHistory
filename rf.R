library(caret)
library(randomForest)

model = randomForest(Species~.,data=iris, ntree=100, mtry=4)
pred = predict(model,iris)
confusionMatrix(pred, iris$Species)
