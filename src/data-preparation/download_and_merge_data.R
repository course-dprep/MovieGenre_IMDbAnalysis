# Set up
library(tidyverse)
library(readr)
library(dplyr)
library(data.table)
# Loading webdata & setting variables 
download.file('https://datasets.imdbws.com/title.basics.tsv.gz','../data/title.basics.tsv.gz')
download.file('https://datasets.imdbws.com/title.ratings.tsv.gz','../data/title.ratings.tsv.gz')


# Creating sample data file
titles_sample <- setDT(read_tsv(gzfile('../data/title.basics.tsv.gz'),n_max=200))
ratings_sample <- setDT(read_tsv(gzfile('../data/title.ratings.tsv.gz'),n_max=200))

IMDb_merged_sample<-left_join(titles_sample,ratings_sample,by="tconst")

save(IMDb_merged_sample, file = "../data/data_merged_sample.RData")

# Creating total data file
titles <- setDT(read_tsv(gzfile('../data/title.basics.tsv.gz')))
ratings <- setDT(read_tsv(gzfile('../data/title.ratings.tsv.gz')))

IMDb_merged<-left_join(titles,ratings,by="tconst")

save(IMDb_merged, file = "../data/data_merged.RData")
