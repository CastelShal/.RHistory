data = data.frame(X=c(25,28,35,32,31,36,29,38,34,32), Y = c(43,46,49,41,36,32,31,30,33,39))
model = lm(Y~X, data=data)
predict(model,list(X=28))

data = read.csv("houses.csv")

train = head(data, -5)
test = tail(data, 5)

model = lm(MEDV~., data=train)
pred = predict(model, test[-14])

compare = data.frame(predictions=pred, actual=test[,14])
