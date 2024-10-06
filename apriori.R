library(arules)
library(arulesViz)
library(RColorBrewer)

data = list(c('A','B','C','D'),c('A','C','D','E','F'),c('A','D','E','M','N'),c('E','F','M','N'),c('A','C','D'),c('A','B','C','D'),c('P','Q','R'),c('A','B','C'),c('A','B','C','P','Q','R'))
items = as(data, "transactions")
itemFrequencyPlot(items, type="absolute")

model = apriori(items, parameter = c(conf=0.8, supp=0.3))
inspect(model)

a = Groceries
itemFrequencyPlot(Groceries)
rules = apriori(Groceries, parameter = c(conf=0.5, supp=0.001))
inspect(rules)
