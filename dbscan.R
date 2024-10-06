library(fpc)
library(class)

x_cor = c(dim=c(720))
y_cor = c(dim=c(720))
for(i in 1:360)
{
  x_cor[i] = 3*cos(i)
  y_cor[i] = 3*sin(i)
  x_cor[i+360]=6*cos(i)
  y_cor[i+360]=6*sin(i)
}

plot(x_cor, y_cor)
data = data.frame(x_cor, y_cor)

model = kmeans(data, 2)
model$cluster

plot(x_cor, y_cor, col=model$cluster)

dbs = dbscan(data, eps=0.5, MinPts = 4)
plot(x_cor, y_cor, col=dbs$cluster)

data = iris[,-5]
dm = dist(data, method="euclidean")

dbs2 = dbscan(dm, eps=4, MinPts = 4)
plot(data[,1:2], col=dbs2$cluster)
