library(tidyverse)

# Read filtered csv
titles_movies_only<- read_csv("../../data/titles_movies_only.csv")

# Read rating data set
ratings <- read_tsv(gzfile('../../data/title.ratings.tsv.gz'))

# Merge on tconst
IMDb_merged<-left_join(titles_movies_only,ratings,by="tconst")

# Save merged data
write_csv(IMDb_merged, file = "../../data/IMDb_merged.csv")
