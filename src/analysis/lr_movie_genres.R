# REGRESSION AND PLOT 2: lOGISTIC REGRESSION
# Load libraries
library(broom)
library(ggplot2)
library(dplyr)
library(tidyverse)

# Load data
IMDB_cleaned <- read_csv("../../gen/output/IMDb_cleaned.csv")
IMDb_separate_rows_genres <- IMDB_cleaned %>% select(primaryTitle, genres, averageRating, startYear, runtimeMinutes) %>% separate_rows(genres, sep = ",")

# Set new dummy variable whether a movie is a hit or not
IMDb_separate_rows_genres$isHit <- ifelse(IMDb_separate_rows_genres$averageRating >= 7.0, 1, 0)

# Convert 'genres' to a factor 
IMDb_separate_rows_genres$genres <- as.factor(IMDb_separate_rows_genres$genres)

# Run a the logistic regression model on genres to isHit
logistic_model_genres <- glm(isHit ~ genres, data = IMDb_separate_rows_genres, family = "binomial")


# Convert regression summary into data frame
DF_log_genres <- tidy(logistic_model_genres)

# Make a plot of the effect of genres on whether a movie is a hit
coefficient_plot <- ggplot(DF_log_genres, aes(x = reorder(term, estimate), y = estimate)) +
  geom_bar(stat = "identity") +  
  theme_minimal() +
  labs(title = "Logistic Regression Coefficients", x = "Genres", y = "Coefficient Estimate")

# Store it in a more clear variable with lay out settings
Genres_AvgRating_estimateplot <- coefficient_plot + theme(axis.text.x = element_text(angle = 90, hjust = 1))


# Save the plot as a pdf
ggsave("../../gen/output/Genres_on_avgrating_estimate.pdf", plot = Genres_AvgRating_estimateplot, width = 12, height = 10)

