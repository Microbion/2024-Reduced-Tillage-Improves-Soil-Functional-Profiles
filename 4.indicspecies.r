library(indicspecies)
otu=read.table("C gene_rpkm.txt",header=T)
otu=t(otu)
groups = c(rep(4, 8), rep(6, 8))
indval = multipatt(otu,groups,restcomb=c(1,2),control = how(nperm=999))
indval
summary(indval,indvalcomp=TRUE)
