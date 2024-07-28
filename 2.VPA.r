library(tidyverse)
library(vegan)
otu <- read.delim("metabolic pathway.txt", row.names = 1)
c_com <- read.delim("C gene_rpkm.txt", row.names = 1)
get_m <- function(df) {
    rda_res <- rda(t(c_com), df)
    rda_p <- anova.cca(rda_res)[1, 4]
    sumr <- summary(rda_res)
    rda_chi <- sumr$constr.chi / sumr$tot.chi * 100
    return(list(chi = rda_chi, p = rda_p))
}
res <- otu %>% map_df(get_m, .id = "path")
res
write.table(res, "vpa.txt", sep="\t")
ggplot(res, aes(path, chi)) +
geom_bar(stat = "identity", show.legend = FALSE, fill = "#87CEFA", color = "black") +
coord_polar(theta = "x") +
labs(x = "", y = "") +
theme_bw()
