
all: ../../data/raw_data/title.ratings.tsv.gz ../../data/raw_data/title.basics.tsv.gz ../../data/temp_data/IMDb_merged.csv ../../data/temp_data/IMDb_merged.csv ../../data/temp_data/IMDb_transformed.csv ../../data/output/IMDb_cleaned.csv ../../data/temp_data/titles_movies_only.csv

../../data/raw_data/title.ratings.tsv.gz: download_data.R
	Rscript download_data.R

../../data/raw_data/title.basics.tsv.gz: download_data.R
	Rscript download_data.R

../../data/temp_data/titles_movies_only.csv: filter.R
	Rscript filter.R

../../data/temp_data/IMDb_merged.csv: merge_data.R
	Rscript merge_data.R

../../data/temp_data/IMDb_transformed.csv: subset_variables.R
	Rscript subset_variables.R

../../data/output/IMDb_cleaned.csv: clean_data.R
	Rscript clean_data.R