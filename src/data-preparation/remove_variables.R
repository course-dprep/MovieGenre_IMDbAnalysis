library(tidyverse)

# Load merged data 
IMDb_merged<-read_csv("../../gen/temp/IMDb_merged.csv")

# Remove variables that we do not need
IMDb_merged <- IMDb_merged %>% 
  select(tconst, primaryTitle, isAdult, genres, startYear, runtimeMinutes, averageRating)

# Write new file with subset of variables
write_csv(IMDb_merged,file = "../../gen/temp/IMDb_transformed.csv")