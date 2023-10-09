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
library(ggplot2)
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

ggsave("Plot_AvgRating_genres.pdf", plot = Plot_AvgRating_genres, width = 8, height = 6)

# REGRESSION AND PLOT 2: lOGISTIC REGRESSION
# Set new dummy variable whether a movie is a hit or not
IMDb_separate_rows_genres$isHit <- ifelse(IMDb_separate_rows_genres$averageRating >= 7.0, 1, 0)

# Convert 'genres' to a factor 
IMDb_separate_rows_genres$genres <- as.factor(IMDb_separate_rows_genres$genres)

# Run a the logistic regression model on genres to isHit
logistic_model_genres <- glm(isHit ~ genres, data = IMDb_separate_rows_genres, family = "binomial")

# View the summary of the logistic regression 
summary(logistic_model_genres)

#Save this logistic regression in a pdf file
## install required packages
install.packages("broom")
install.packages("ggplot2")
install.packages("dplyr")

# Load libraries
library(broom)
library(ggplot2)
library(dplyr)

# Convert regression summary into data frame
DF_log_genres <- tidy(logistic_model_genres)

# Make a plot of the effect of genres on whether a movie is a hit
coefficient_plot <- ggplot(DF_log_genres, aes(x = reorder(term, estimate), y = estimate)) +
  geom_bar(stat = "identity") +  
  theme_minimal() +
  labs(title = "Logistic Regression Coefficients", x = "Genres", y = "Coefficient Estimate")

# Store it in a more clear variable with lay out settings
Genres_AvgRating_estimateplot <- coefficient_plot + theme(axis.text.x = element_text(angle = 90, hjust = 1))
Genres_AvgRating_estimateplot

# Save the plot as a pdf
ggsave("Genres_on_avgrating_estimate.pdf", plot = Genres_AvgRating_estimateplot, width = 12, height = 10)
print("Genres_AvgRating_estimateplot")
dev.off()


## REGRESSION AND PLOT 3: LOGISTIC REGRESSION OF START YEAR ON WHETHER MOVIE IS A HITOR NOT
# Run a the logistic regression model on genres to isHit
logistic_model_startYear <- glm(isHit ~ startYear, data = IMDb_separate_rows_genres, family = "binomial")

# View the model summary
summary(logistic_model_startYear)

# Make a plot so that the regression will be visualized

# Generate predicted probabilities from the logistic regression model
IMDb_separate_rows_genres$predicted_prob <- predict(logistic_model_startYear, type = "response")

# Create a plot of the predicted probabilities
plot_startYear <- ggplot(data = IMDb_separate_rows_genres, aes(x = startYear, y = predicted_prob)) +
  geom_smooth(method = "lm", formula = y ~ poly(x, 2), se = FALSE, color = "blue") +
  theme_minimal() +
  labs(title = "Probability of Being a Hit vs. Start Year", x = "Start Year", y = "Probability (P(isHit))")

# Print the plot
print(plot_startYear)

#Save it into a PDF file
ggsave("plot_probability_of_being_a_hit.pdf", plot = plot_startYear, width = 8, height = 6)

## REGRESSION 4: ESTIMATING THE EFFECT OF GENRE AND RUNTIME IN MINUTES ON AVGRATING, CONTROLLING FOR STARTYEAR
library(fixest)

m<-feols(averageRating~genres+runtimeMinutes|startYear,data=IMDb_separate_rows_genres)
etable(m)
summary(m)

m$coeftable

# plot
library(data.table)
coefs = cbind(data.table(Genre=rownames(m$coeftable)), m$coeftable)
library(ggplot2)

Estimation_plot_genre <- ggplot(coefs, aes(x = Genre , y = Estimate)) + 
  geom_bar(position = position_dodge(), stat = "identity") +
  geom_errorbar(aes(ymin = Estimate - 1.96 * `Std. Error`, ymax = Estimate + 1.96 * `Std. Error`),
                width = 0.2,
                position = position_dodge(0.9)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))  # Rotate x-axis labels

ggsave("Fixed_effects_genre_avgrating.pdf", Estimation_plot_genre, width = 8, height = 6)




