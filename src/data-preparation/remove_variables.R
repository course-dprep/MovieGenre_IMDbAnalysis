library(dplyr)
# Load merged data 
load("../../gen/data-preparation/temp/data_merged.RData")

# Remove variables that we do not need
IMDb_merged <- IMDb_merged %>% 
  select(tconst, originalTitle, isAdult, genres, averageRating)

