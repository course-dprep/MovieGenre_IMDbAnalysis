library(tidyverse)

# Load titles dataset into variable
titles <-read_tsv(gzfile('../../data/title.basics.tsv.gz'))

# Filter for only movies (excluding other titleTypes)
titles_movies_only = titles %>% filter(titleType=='movie')

# Generate new csv file filtered on movies
write_csv(titles_movies_only, '../../gen/temp/titles_movies_only.csv')
