# setup
library(tidyverse)

# input
titles <- read_tsv(gzfile('../../data/title.basics.tsv.gz'), n_max=200)

ratings <- read_tsv(gzfile('../../data/title.ratings.tsv.gz'), n_max=200)
