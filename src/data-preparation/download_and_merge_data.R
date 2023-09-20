# Set up
library(tidyverse)
library(readr)
library(dplyr)
# Loading webdata & setting variables 
download.file('https://datasets.imdbws.com/title.basics.tsv.gz','../data/title.basics.tsv.gz')
download.file('https://datasets.imdbws.com/title.ratings.tsv.gz','../data/title.ratings.tsv.gz')

titles <- read_tsv(gzfile('../data/title.basics.tsv.gz'))
ratings <- read_tsv(gzfile('../data/title.ratings.tsv.gz'))

IMDb_merged<-left_join(titles,ratings,by="tconst")

save(IMDb_merged, file = "../data/data_merged.RData")
