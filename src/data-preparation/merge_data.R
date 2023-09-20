library(data.table)
library(tidyverse)

# Load datasets into R 
titles <- setDT(read_tsv(gzfile('../../data/title.basics.tsv.gz')))
ratings <- setDT(read_tsv(gzfile('../../data/title.ratings.tsv.gz')))

# Merge on tconst
IMDb_merged<-left_join(titles,ratings,by="tconst")

# Save merged data
save(IMDb_merged, file = "../../gen/data-preparation/temp/data_merged.Rdata")
