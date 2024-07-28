library(DESeq2)
otu <- read.delim("Cpathway.txt", row.names = 1)
grp <- data.frame(row.names = rownames(otu), group = rep(c("NTB", "RTB", "MPB", "NTR", "RTR", "MPR"), each = 8))
sub_grp <- filter(grp, group %in% c("NTB", "RTB"))
sub_otu <- otu[rownames(sub_grp),]
dds <- DESeqDataSetFromMatrix(countData = round(t(sub_otu)), colData = sub_grp, design = ~group)
dds$group <- relevel(dds$group, ref = "NTB") 
dds <- DESeq(dds, quiet = TRUE)
res <- results(dds, pAdjustMethod = "fdr", tidy = TRUE)
