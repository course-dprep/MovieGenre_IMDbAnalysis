first: ../../gen/output/IMDb_cleaned.csv 

../../gen/output/IMDb_cleaned.csv: ../../gen/temp/IMDb_transformed.csv clean_data.R
	Rscript clean_data.R
	
../../gen/temp/IMDb_transformed.csv: ../../gen/temp/IMDb_merged.csv remove_variables.R
	Rscript remove_variables.R
	
../../gen/temp/IMDb_merged.csv: ../../gen/temp/titles_movies_only.csv ../../data/title.ratings.tsv.gz merge_data.R
	Rscript merge_data.R
	
../../gen/temp/titles_movies_only.csv: ../../data/title.basics.tsv.gz filter.R
	Rscript filter.R

../../data/title.basics.tsv.gz ../../data/title.ratings.tsv.gz: download_data.R
	Rscript download_data.R

clean:
	R -e "unlink('../../gen/temp/*.*')"



