# Load library
library(ggplot2)

# Plot about average rating per movie genre
## First make sure that each observation has one genre
IMDb_separate_rows_genres <- IMDb_merged %>% select(genres, averageRating) %>% separate_rows(genres, sep = ",")

# Calculate the mean rating per genre
IMDB_genres_avgrating <- IMDb_separate_rows_genres %>%
  group_by(genres) %>%
  summarize(Average_Rating = mean(averageRating)) 

# Make plot about the main effect: How does the genre of a movie impact its IMDb popularity score?
Plot_AvgRating_genres <- ggplot(IMDB_genres_avgrating, aes(y = genres, x = Average_Rating)) + geom_point()
print(Plot_AvgRating_genres)

#Set working directory to Gen/Analysis/Output
setwd("C:/Users/sboel/OneDrive/Tilburg University/Dprep/Group_project/team-project-team_3/gen/analysis/output")

# Save plot as PDF File
ggsave(filename = "plot_avgrating_genres.pdf", plot = Plot_AvgRating_genres)

# Regression analysis on main effect with mediator runtime in minutes
IMDb_mediator_runtime <-IMDb_merged %>% 
  select(genres, averageRating, runtimeMinutes) %>%  
  separate_rows(genres, sep = ",") %>% 
  group_by(genres, runtimeMinutes)


model = lm(averageRating ~ genres + runtimeMinutes, data = IMDb_mediator_runtime)
summary(model)
