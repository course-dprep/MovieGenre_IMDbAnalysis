# What is the effect of a genre of a movie to the IMDb popularity score?
## Introduction
Is there a significant difference in the IMDb popularity scores among different movie genres. A film producer should perhaps consider producing an action genre movie rather than a thriller genre movie, despite that producer's preference for thriller. What other mediators could affect this effect. Some things that will be further explored and analyzed in this research. The research method will be discussed in more detail later in this project. So feel free to keep reading and get along with the prepared data.

## Research Motivation
The cinema industry is dynamic and has ever-changing landscape which is influenced by many factors that will  affect the success and popularity of a movie. Among these factors the genre of the movie plays a vital role. It is an important question that has captured the curiosity of the filmmakers, producers as well as the cinephiles. In this regard, the IMDb popularity score is a valuable metric that can show the engagement of a movie by its audience. Finding the relationship between genre of a movie and its popularity score has siginificant implications for the film industry. 
Film production is a substantial investment. Movie producers face the task of choosing the genre that will yield the best returns on their investment. By examining the relationship between genre and IMDb popularity scores, we aim to aid producers in making decisions to prioritize the genre of their movie.

## Methods and Results
#### **Methods**

#### **Visualization**
**Average rating per genre**

To be able to run this plot, the database first needed be separated in rows. Because of the fact that some observations(movies) have more than one genre. After that the mean rating per genre needed to calculated by grouping by genres and summarize by the mean of the variable average rating. After that the code for the plot was written and the result was stored into a pdf file named: Plot_avgRating_genres.pdf

**Logistic regression of genres_on_avg_rating**

According to [this article](https://www.quora.com/Is-a-movie-with-6-7-ratings-a-flop-or-a-hit) a movie with an IMDB rating of 7+ it is seen as a hit.
In the PDF Genres_onavgrating_estimate you see a bar plot which shows the result of a logistic regression.  In this regression the following was examined: the effect of movie genres on the likelihood of a movie being classified as a “hit” (1) or “no hit” (0). A movie was established as a hit when it has a rating equal to or greater than 7.0. The intercept of this regression is -1.58595, this is the estimated log-odds of a movie being a hit when all the other variables (genres) are zero. In the bar plot it can be seen that the genres “Horror”, “Adult”, “Western”, Sci-Fi”, and “Thriller” have a negative estimate. The numbers of these estimates represent the change in the log-odds of a movie being a ‘hit’. So, the genres where the estimate is negative, it means that there is a decrease in likelihood of being a “hit”. 

**Probability of movie being a hit over the years**

This plot displays a logistic regression model of the predicted probability to be a hit and the start year of movie. It can be seen that the probability of a movie to be a hit increases over the year. 

**Fixed effect**

This plot calculates the estimated effect of a genre on the average rating when all the other variables are zero. So, for example the genre sport has almost have an estimate of 1, this means the average rating of a movie changes by an estimation of almost 1, when all the other variables are zero. The other variables are the other genres and runtimes in minutes. In this model there is a controlling variable as well; start year. The little black line in each bar indicates the standard error.


#### **Results**

## Repository Overview
```
- data
  -output
  -raw-data
  -temp-data
- gen
  -output
  -temp
- src
  - analysis    
  - data-preparation
  - paper
- .gitignore
- README.md
- makefile
```

## Dependencies

Please follow the installation guides on http://tilburgsciencehub.com/.

- Python. [Installation guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/python/).
- R. [Installation guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/r/).
- Make. [Installation guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/).
- Pandoc. [Installation guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/pandoc/)

- For R, make sure you have installed the following packages:
```
install.packages("readr")
install.packages("data.table")
install.packages("broom")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("fixest")
install.packages("tidyverse")
```
  

## Running Instructions
#### **Running The Code By Make**
To run the code, follow these instructions:
1. Fork this repository
2. Open your command line/terminal and run the following code:
```
git clone https://github.com/course-dprep/MovieGenreIMDbAnalysis
```
3. Set your working directory to `MovieGenreIMDbAnalysis` and run the following command:
```
make
```
4. When make has successfully run all the code, it will generate multiple graphs with the presentation of our analysis. 
5. To clean the data of all raw and unnecessary data files created during the pipeline, run the following code in the command line/terminal: 
```
make clean
```
## Authors
Team 3: 
- [Dani Visser](https://github.com/danivisser), e-mail: d.visser@tilburguniversity.edu 
- [Dirk Beekmans](https://github.com/DirkBeekmans), e-mail: d.a.beekmans@tilburguniversity.edu 
- [Sjors Boelaars](https://github.com/SjorsBoelaars1), e-mail: s.boelaars@tilburguniversity.edu 
- [Parisa Vatankhah](https://github.com/pvatankhah), e-mail: p.vatankhah@tilburguniversity.edu
- [Hugo Reniers](https://github.com/hugoreniers), e-mail: h.b.reniers@tilburguniversity.edu 
