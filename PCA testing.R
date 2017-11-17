
# Grace Daher
# 5.16.16


### includes ###
require(reshape2)
require(ggplot2)


### Example PCA plot ###

str(iris)
ir.pca <- prcomp(iris[,1:3])
df <- as.data.frame(ir.pca$x[,1:2])
ggplot(data = df, aes(x = PC1, y = PC2)) +
 geom_point(aes(shape = iris$Species, color = iris$Species))


### PCA with array data ###

## transpose  expression matrix
affy <- read.table("G:/liver muscle sample data/liver_muscle_sstRMA_for_r.txt", sep = "\t", header = TRUE, row.names = 1,   stringsAsFactors = FALSE)
affy.t <- t(affy)
stopifnot(nrow(affy)==ncol(affy.t), rownames(affy) == colnames(affy.t))

## load phenotype
pheno <- read.table("G:/liver muscle sample data/phenotypes.txt", sep = "\t", header = FALSE)
pheno <- t(pheno)

## by phenotype
end <- ncol(affy.t)
affy.pca <- prcomp(affy.t[,3:end])
df2 <- as.data.frame(affy.pca$x[,1:2])
ggplot(data = df2, aes(x = PC1, y = PC2)) +
  geom_point(aes(color = pheno[,1], shape = pheno[,1])) + labs(color = "Groups", shape = "Groups")


