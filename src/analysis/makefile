first:../../gen/output/Plot_AvgRating_genres.pdf ../../gen/output/Genres_on_avgrating_estimate.pdf ../../gen/output/plot_probability_of_being_a_hit.pdf ../../gen/output/Fixed_effects_genre_avgrating.pdf

../../gen/output/IMDb_cleaned.csv: 
	make -C ../data-preparation -f Makefile first

../../gen/output/Plot_AvgRating_genres.pdf: ../../gen/output/IMDb_cleaned.csv average_rating_genres.R
	Rscript average_rating_genres.R
	
../../gen/output/Genres_on_avgrating_estimate.pdf: ../../gen/output/IMDb_cleaned.csv lr_movie_genres.R
	Rscript lr_movie_genres.R

../../gen/output/plot_probability_of_being_a_hit.pdf: ../../gen/output/IMDb_cleaned.csv lr_startyear.R
	Rscript lr_startyear.R

../../gen/output/Fixed_effects_genre_avgrating.pdf: ../../gen/output/IMDb_cleaned.csv fixed_genres_runtime_avgrating.R
	Rscript fixed_genres_runtime_avgrating.R
	
clean:
	R -e "unlink('../../gen/temp/*.*')"