library(tidyverse)

# Read filtered csv
titles_movies_only<- read_csv("../../gen/temp/titles_movies_only.csv")

# Load ratings dataset into variable
ratings <- read_tsv(gzfile('../../data/title.ratings.tsv.gz'))

# Merge titles dataset and ratings dataset on common variable "tconst"
IMDb_merged<-left_join(titles_movies_only,ratings,by="tconst")

# Write new file with merged data
write_csv(IMDb_merged, file = "../../gen/temp/IMDb_merged.csv")
