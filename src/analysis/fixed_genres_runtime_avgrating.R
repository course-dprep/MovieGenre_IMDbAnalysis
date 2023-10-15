## REGRESSION 4: ESTIMATING THE EFFECT OF GENRE AND RUNTIME IN MINUTES ON AVGRATING, CONTROLLING FOR STARTYEAR

# Load packages
library(fixest)
library(data.table)
library(ggplot2)
library(tidyverse)

# Load data
IMDB_cleaned <- read_csv("../../gen/output/IMDb_cleaned.csv")
IMDb_separate_rows_genres <- IMDB_cleaned %>% select(primaryTitle, genres, averageRating, startYear, runtimeMinutes) %>% separate_rows(genres, sep = ",")

# This model estimates the effect of 'genres' and 'runtimeMinutes' on 'averageRating' while controlling for 'startYear'.
m<-feols(averageRating~genres+runtimeMinutes|startYear,data=IMDb_separate_rows_genres)

# Extract the coefficient table from the model object 'm'
coefficient_table <- m$coeftable

# Combine the coefficient table with a data.table containing the 'Genre' column, this prepares the data for plotting
coefs = cbind(data.table(Genre=rownames(m$coeftable)), m$coeftable)

# Create an estimation plot for the coefficients
Estimation_plot_genre <- ggplot(coefs, aes(x = Genre , y = Estimate)) + 
  geom_bar(position = position_dodge(), stat = "identity") +
  
  # Add error bars based on standard errors
  geom_errorbar(aes(ymin = Estimate - 1.96 * `Std. Error`, ymax = Estimate + 1.96 * `Std. Error`),
                width = 0.2,
                position = position_dodge(0.9)) +
  # Customize the appearance of the plot
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))  # Rotate x-axis labels

# Save the estimation plot as a PDF file with specified dimensions
ggsave("../../gen/output/Fixed_effects_genre_avgrating.pdf", Estimation_plot_genre, width = 8, height = 6)
