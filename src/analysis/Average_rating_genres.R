# Load library
library(ggplot2)
library(tidyverse)

# PLOT 1: AVERAGE RATING PER MOVIE
# Plot about average rating per movie genre
## First make sure that each observation has one genre
IMDB_cleaned <- read_csv("../../data/output/IMDb_cleaned.csv")
IMDb_separate_rows_genres <- IMDB_cleaned %>% select(primaryTitle, genres, averageRating, startYear, runtimeMinutes) %>% separate_rows(genres, sep = ",")

# Calculate the mean rating per genre
IMDB_genres_avgrating <- IMDb_separate_rows_genres %>%
  group_by(genres) %>%
  summarize(Average_Rating = mean(averageRating)) 

#Set working directory to Gen/Analysis/Output
setwd("../gen/analysis/output")

# Make plot about: How does the genre of a movie impact its IMDb popularity score?
Plot_AvgRating_genres <- ggplot(IMDB_genres_avgrating, aes(x = genres, y = Average_Rating)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +  # Add a linear regression line
  theme_minimal() +
  labs(
    title = "Average Rating by Genre",
    x = "Genre",
    y = "Average Rating"
  ) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))  # Rotate x-axis labels for readability

ggsave("../../gen/output/Plot_AvgRating_genres.pdf", plot = Plot_AvgRating_genres, width = 8, height = 6)