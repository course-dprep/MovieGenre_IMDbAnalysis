# Set working directory to the location of this script

# Download files from IMDb
download.file('https://datasets.imdbws.com/title.basics.tsv.gz','../../data/raw_data/title.basics.tsv.gz')
download.file('https://datasets.imdbws.com/title.ratings.tsv.gz','../../data/raw_data/title.ratings.tsv.gz')

