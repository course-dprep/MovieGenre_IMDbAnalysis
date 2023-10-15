library(tidyverse)

# Load transformed data
IMDb_merged<-read_csv("../../gen/temp/IMDb_transformed.csv")

# Convert startYear to numeric, non-numeric values get NA
IMDb_merged$startYear <- as.numeric(as.character(IMDb_merged$startYear))

# Remove NA's in startYear 
IMDb_merged <- IMDb_merged[!is.na(IMDb_merged$startYear), ]

# Convert runtimeMinutes to numeric, replacing non-numeric values with NA
IMDb_merged$runtimeMinutes <- as.numeric(as.character(IMDb_merged$runtimeMinutes))

# Remove NA's in movies runtime
IMDb_merged <- IMDb_merged[!is.na(IMDb_merged$runtimeMinutes), ]

# Exclude extreme values, set realistic range
IMDb_merged <- subset(IMDb_merged, runtimeMinutes >= 30 & runtimeMinutes <= 300)

# Remove rows with "\N" in the 'genres' column
IMDb_merged <- IMDb_merged[IMDb_merged$genres != "\\N", ]

# Remove NA'S in ratings
IMDb_merged <- IMDb_merged[!is.na(IMDb_merged$averageRating), ]

# Write new file with final output data
write_csv(IMDb_merged,file = "../../gen/output/IMDb_cleaned.csv")
