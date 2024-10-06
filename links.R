library(sparcl)
#x = c(3, 5, 6, 10, 12, 17, 2, 4)
#y = c(4, 2, 3, 11, 16, 15, 2, 2)

#data = data.frame(x, y)
data <- iris[-5]
dist_mat = dist(data, method="euclidean")

model = hclust(dist_mat, method="single")
#model = hclust(dist_mat, method="average")
#model = hclust(dist_mat, method="complete")
cut = cutree(model, 4)
ColorDendrogram(model, cut, branchlength = 50)
plot(model, hang=-1)
