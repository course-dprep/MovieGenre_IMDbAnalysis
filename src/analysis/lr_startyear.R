## REGRESSION AND PLOT 3: LOGISTIC REGRESSION OF START YEAR ON WHETHER MOVIE IS A HITOR NOT
# Load packages
library(ggplot2)
library(dplyr)
library(broom)
library(tidyverse)

# Load data
IMDB_cleaned <- read_csv("../../data/output/IMDb_cleaned.csv")
IMDb_separate_rows_genres <- IMDB_cleaned %>% select(primaryTitle, genres, averageRating, startYear, runtimeMinutes) %>% separate_rows(genres, sep = ",")

# Set new dummy variable whether a movie is a hit or not
IMDb_separate_rows_genres$isHit <- ifelse(IMDb_separate_rows_genres$averageRating >= 7.0, 1, 0)

# Run a the logistic regression model on genres to isHit
logistic_model_startYear <- glm(isHit ~ startYear, data = IMDb_separate_rows_genres, family = "binomial")

# Generate predicted probabilities from the logistic regression model
IMDb_separate_rows_genres$predicted_prob <- predict(logistic_model_startYear, type = "response")

# Create a plot of the predicted probabilities
plot_startYear <- ggplot(data = IMDb_separate_rows_genres, aes(x = startYear, y = predicted_prob)) +
  geom_smooth(method = "lm", formula = y ~ poly(x, 2), se = FALSE, color = "blue") +
  theme_minimal() +
  labs(title = "Probability of Being a Hit vs. Start Year", x = "Start Year", y = "Probability (P(isHit))")

#Save it into a PDF file
ggsave("../../gen/output/plot_probability_of_being_a_hit.pdf", plot = plot_startYear, width = 8, height = 6)
