set.seed(1000)
data <- iris[,-5]
centers = 3
model=kmeans(x=data, centers=centers, iter.max = 10, nstart = 1, trace=FALSE)
plot(data$Sepal.Length,data$Petal.Width, col=model$cluster)