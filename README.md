# What is the effect of a genre of a movie to the IMDb popularity score?
## Introduction
Is there a significant difference in the IMDb popularity scores among different movie genres. A film producer should perhaps consider producing an action genre movie rather than a thriller genre movie, despite that producer's preference for thriller. What other mediators could affect this effect. Some things that will be further explored and analyzed in this research. The research method will be discussed in more detail later in this project. So feel free to keep reading and get along with the prepared data.

## Research Motivation
The cinema industry is dynamic and has ever-changing landscape which is influenced by many factors that will  affect the success and popularity of a movie. Among these factors the genre of the movie plays a vital role. It is an important question that has captured the curiosity of the filmmakers, producers as well as the cinephiles. In this regard, the IMDb popularity score is a valuable metric that can show the engagement of a movie by its audience. Finding the relationship between genre of a movie and its popularity score has siginificant implications for the film industry. 
Film production is a substantial investment. Movie producers face the task of choosing the genre that will yield the best returns on their investment. By examining the relationship between genre and IMDb popularity scores, we aim to aid producers in making decisions to prioritize the genre of their movie.

## Methods and Results
#### **Methods**
To address our research question, we decided to run a logistic regression of genres of the movies on their likelihood of being classified as a hit (according to [this article](https://www.quora.com/Is-a-movie-with-6-7-ratings-a-flop-or-a-hit) a movie with an IMDB rating of 7+ is seen as a hit). Also, we determined a logistic regression model of the predicted probability to be a hit and the start year of movie. The estimated effect of a genre on the average rating when all the other variables are zero is shown in a plot with fixed effect, in this model there is a controlling variable, start year.

#### **Results**

##### __The average rating per genre__
<img src="gen/analysis/output/average_rating_per_genre.png" alt="__The average rating per genre__" width="600" />


##### __The estimated change in rating per genre__
<img src="gen/analysis/output/Estimate_on_avg_rating_per_genre.png" alt="__The estimate on average rating per genre__" width="650" />


##### __Probability of being a hit__
<img src="gen/analysis/output/Probability_of_being_a_hit.png" alt="__Probability of being a hit__" width="600" />


##### __The fixed effect__
<img src="gen/analysis/output/fixed_effects.png" alt="__The fixed effect__" width="600" />

## Repository Overview
```
- data
- gen
  -output
  -temp
- src
  - analysis    
  - data-preparation
- .gitignore
- README.md
- makefile
```

## Dependencies

Please follow the installation guides on http://tilburgsciencehub.com/.

- R. [Installation guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/r/).
- Make. [Installation guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/).
- Pandoc. [Installation guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/pandoc/)

- For R, make sure you have installed the following packages:
```
install.packages("data.table")
install.packages("broom")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("fixest")
install.packages("tidyverse")
install.packages("stargazer")
```
  

## Running Instructions
#### **Running The Code By Make**
To run the code, follow these instructions:
1. Fork this repository
2. Open your command line/terminal and run the following code:
```
git clone https://github.com/course-dprep/MovieGenre_IMDbAnalysis
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
