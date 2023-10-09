all: analysis data-preparation 

data-preparation:
	make -C src/data-preparation
	
analysis:
	make -C src/analysis 
	
clean:
	make -C data/temp_data -f Makefile clean