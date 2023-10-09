first: ../../data/output/IMDb_cleaned.csv ../../gen/output/Plot_AvgRating_genres.pdf ../../gen/output/Genres_on_avgrating_estimate.pdf ../../gen/output/plot_probability_of_being_a_hit.pdf ../../gen/output/Fixed_effects_genre_avgrating.pdf

../../data/output/IMDb_cleaned.csv: 
	make -C ../data-preparation -f Makefile first

../../gen/output/Plot_AvgRating_genres.pdf: ../../data/output/IMDb_cleaned.csv Average_rating_genres.R
	Rscript Average_rating_genres.R
	
../../gen/output/Genres_on_avgrating_estimate.pdf: ../../data/output/IMDb_cleaned.csv LR_movie_genres.R
	Rscript LR_movie_genres.R

../../gen/output/plot_probability_of_being_a_hit.pdf: ../../data/output/IMDb_cleaned.csv LR_StartYear.R
	Rscript LR_StartYear.R

../../gen/output/Fixed_effects_genre_avgrating.pdf: ../../data/output/IMDb_cleaned.csv Fixed_genre_runtime_avgrating.R
	Rscript Fixed_genre_runtime_avgrating.R