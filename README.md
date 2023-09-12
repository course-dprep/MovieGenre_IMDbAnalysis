# Research question with possible mediators/moderators
We are planning to use the IMDb data files for this project. Our main research question will be:
How does the genre of a movie impact its IMDb popularity score?
To go more in dept on this research, some of the underneath moderators/mediators could help to achieve this:
1. Runtime in minutes
2. Start year/end year with a specific focus on the Covid-19 time period
3. Adult movie or not

## Dependencies
- R 
- R packages: `install.packages("stargazer")`
- [Gnu Make](https://tilburgsciencehub.com/get/make) 
- [TeX distribution](https://tilburgsciencehub.com/get/latex/?utm_campaign=referral-short)
- For the `makefile` to work, R, Gnu make and the TeX distribution (specifically `pdflatex`) need to be made available in the system path 
- Detailed installation instructions can be found here: [tilburgsciencehub.com](http://tilburgsciencehub.com/)


## Notes
- `make clean` removes all unncessary temporary files. 
- Tested under Linux Mint (should work in any linux distro, as well as on Windows and Mac) 
- IMPORTANT: In `makefile`, when using `\` to split code into multiple lines, no space should follow `\`. Otherwise Gnu make aborts with error 193. 
- Many possible improvements remain. Comments and contributions are welcome!

## Preliminary research question
What is the effect of the amount of titles a director is known for to the average user ratings of a movie? 
