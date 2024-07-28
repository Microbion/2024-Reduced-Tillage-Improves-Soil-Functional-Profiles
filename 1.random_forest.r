library(tidyverse)
library(rfPermute)
gene <- read.delim("TC.txt", row.names = 1) %>% map_dfc(sum) %>% unlist
data1 <- read.delim("metabolic pathway.txt", row.names = 1) %>% t %>% as.data.frame %>%
mutate(y = gene)
set.seed(20) 
res <- rfPermute(y ~ ., data1)
importance(res) %>%
as.data.frame %>%
rownames_to_column("phylum") %>%
write.table("rf_result.xls", sep = "\t", quote = FALSE, row.names = FALSE)
plotImportance(res)
