##### Cluster, KMEANS, Euclidean, Centroid, Clustering only work on numerical continous data and does not work on boolean
# Decision tree -> classify and regression plot on clssified data
# These data can be used for recomendations.
# Random Forest, Agglomerative
# Max of 3 models should be built and worst case should be 10 and not more than that

###### When you don't know how many clusters to make then use Agglomeridean #################
# KMeans is used the most because it runs faster than agglomerative
mt = scale(mtcars)
View(mt)

fit = kmeans(mt, 3) # Clustering will be done based on data and business. like riskprofile needs only 3 cluster high, medium and low risk
fit
fit$cluster

mtcars$cluster = fit$cluster
View(mtcars)

mt_distance_matrix = dist(mt, method = 'euclidean')
fit = hclust(mt_distance_matrix, method = 'ward.D2')
plot(fit)
# This result will give us an idea about how many cluster is possible
# Semi partial R Squared - for finding loss homogenity. similar to above which is Graphical

# Now Clustering
groups = cutree(fit, k =5)
# With border - This diagram called Dendrogram
rect.hclust(fit, k = 5, border = 'red')

rect.hclust(fit, k = 6, border = 'red')

fit$merge

# In below data, -ve is observation and positive are steps(clusters grouped to form another cluster)
# Step where height increases drastically is the point where we stop clustering further
dataFrame = data.frame(fit$merge, fit$height)
View(dataFrame)

# Visualizing the increase in height for clustering
plot(rownames(dataFrame), dataFrame$fit.height)

# Pull groups/cluster to dataset
mtcars$hclustername = groups
View(mt)
