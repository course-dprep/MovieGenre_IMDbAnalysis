first: ../../data/output/IMDb_cleaned.csv 

../../data/output/IMDb_cleaned.csv: ../../data/temp_data/IMDb_transformed.csv clean_data.R
	Rscript clean_data.R
	
../../data/temp_data/IMDb_transformed.csv: ../../data/temp_data/IMDb_merged.csv remove_variables.R
	Rscript remove_variables.R
	
../../data/temp_data/IMDb_merged.csv: ../../data/temp_data/titles_movies_only.csv ../../data/raw_data/title.ratings.tsv.gz merge_data.R
	Rscript merge_data.R
	
../../data/temp_data/titles_movies_only.csv: ../../data/raw_data/title.basics.tsv.gz filter.R
	Rscript filter.R

../../data/raw_data/title.basics.tsv.gz ../../data/raw_data/title.ratings.tsv.gz: download_data.R
	Rscript download_data.R

clean:
	make -C ../../data/temp_data -f Makefile clean



