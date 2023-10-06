library(tidyverse)

# Load dataset big data set plus sample
titles <-read_tsv(gzfile('../../data/raw_data/title.basics.tsv.gz'))

# Filter for only movies 
titles_movies_only = titles %>% filter(titleType=='movie')

# Generate new filtered csv files
write_csv(titles_movies_only, '../../data/temp_data/titles_movies_only.csv')
