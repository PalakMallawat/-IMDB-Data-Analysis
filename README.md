# IMDB-Data-Analysis
Retrieving data from IMDB’s top rated titles Implemented using Python’s Beautiful Soup and preprocessing in R
Beautiful Soup

Beautiful Soup is a Python package used to parse HTML pages mainly and extract data. The usage of this package was very simple and I hit the ground running with this easy to use package despite having no experience in web scraping

Procedure
IMDB Web Links were collected for all the genres(Action, Animation, Biography, Comedy, Crime, Drama, Fantasy, Horror, Mystery, Romance, Sci-fi, Thriller, and War were stored into different excel sheets. Using jupyter notebook various data were extracted and saved in the form of dataframe. Features like Ranking, Title, release year were extracted together and then split in python and stored in different columns. Features like votes was extracted by separating gross value. All of these features were then combined to form a single dataframe. This process was repeated for all genres and then later combined to further clean and preprocess using R.

Extracted Raw Data

The 32135 Movie titles extracted were parsed into different columns which were namely: Ranking, Movie Title, Release Year, Movie Duration, Primary Genre, Sub Genres (Non-Primary Genres), User Rating, User Votes![image](https://user-images.githubusercontent.com/73734221/216719120-e5fe6c0b-b68b-4e04-86bd-5ba4156c878a.png)

