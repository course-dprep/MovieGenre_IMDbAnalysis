library(tidyverse)

# Load merged data 
IMDb_merged<-read_csv("../../data/IMDb_merged.csv")

# Remove variables that we do not need
IMDb_merged <- IMDb_merged %>% 
  select(tconst, primaryTitle, isAdult, genres, startYear, runtimeMinutes, averageRating)

# Write new file
write_csv(IMDb_merged,file = "../../data/IMDb_transformed.csv")
