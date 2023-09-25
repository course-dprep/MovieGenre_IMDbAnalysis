# Copy the raw data into input folder 
# This step really depends no how files are shared across the different stages (e.g. if whole pipeline
# is on a single machine, could directly access data from data directory)
file.copy("./data/title.basics.tsv.gz","./gen/data-preparation/input/title.basics.tsv.gz")
file.copy("./data/title.ratings.tsv.gz","./gen/data-preparation/input/title.ratings.tsv.gz")
