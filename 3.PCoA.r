library(vegan)
library(ape)
otu=read.delim("C gene_rpkm.txt", sep=",", row.names=1)
otu.t=t(otu)
otu.D <- vegdist(otu.t, "bray")
res <- pcoa(otu.D)
res$values
biplot(res)
sink("output.txt")
res
sink()
