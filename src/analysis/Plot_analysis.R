# Load library
library(ggplot2)
library(tidyverse)

setwd("../../team-project-team_3/data")
# Plot about average rating per movie genre
## First make sure that each observation has one genre
IMDB_cleaned <- read_csv("IMDb_cleaned.csv")
IMDb_separate_rows_genres <- IMDB_cleaned %>% select(genres, averageRating) %>% separate_rows(genres, sep = ",")

# Calculate the mean rating per genre
IMDB_genres_avgrating <- IMDb_separate_rows_genres %>%
  group_by(genres) %>%
  summarize(Average_Rating = mean(averageRating)) 

# Make plot about the main effect: How does the genre of a movie impact its IMDb popularity score?
Plot_AvgRating_genres <- ggplot(IMDB_genres_avgrating, aes(y = genres, x = Average_Rating)) + geom_point()
print(Plot_AvgRating_genres)

#Set working directory to Gen/Analysis/Output

library(fixest)

single_genres = IMDB_cleaned %>% filter(!grepl(',', genres))

m<-feols(averageRating~genres+runtimeMinutes|startYear,data=single_genres)
etable(m)

m$coeftable

# plot
library(data.table)
coefs = cbind(data.table(varname=rownames(m$coeftable)), m$coeftable)
library(ggplot2)

ggplot(coefs, aes(x=varname, y=Estimate)) + 
  geom_bar(position=position_dodge(), stat="identity") +
  geom_errorbar(aes(ymin=Estimate-1.96*`Std. Error`, ymax=Estimate+1.96*`Std. Error`),
                width=.2,                    # Width of the error bars
                position=position_dodge(.9))

m$coeftable


# Save plot as PDF File
ggsave(filename = "../../output/plot_avgrating_genres.pdf", plot = Plot_AvgRating_genres)

# Regression analysis on main effect with mediator runtime in minutes
IMDb_mediator_runtime <-IMDb_merged %>% 
  select(genres, averageRating, runtimeMinutes) %>%  
  separate_rows(genres, sep = ",") %>% 
  group_by(genres, runtimeMinutes)


model = lm(averageRating ~ genres + runtimeMinutes, data = IMDb_mediator_runtime)
summary(model)
