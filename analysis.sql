

--List the movies that were played by actor ‘Schwarzenegger, Arnold’ and directed by ‘Cameron, James’?
--Show the id, title and year of these movies--
SELECT M.ID, M.TITLE, M.YR
FROM CASTING C
INNER JOIN MOVIE M
ON C.MOVIE_ID = M.ID
INNER JOIN ACTOR A
ON C.ACTOR_ID = A.ID
WHERE A.NAME = 'Schwarzenegger, Arnold' AND M.DIRECTOR = 'Cameron, James';

--Show the title and the lead actor’s name of the movie with ID = 2579806.
--Label the tile of the movie Movie_Title, and the lead actor’s name Lead_Actor.
SELECT M.TITLE AS Movie_Title, A.NAME AS Lead_Actor
FROM CASTING C
INNER JOIN MOVIE M
ON C.MOVIE_ID = M.ID
INNER JOIN ACTOR A
ON C.ACTOR_ID = A.ID
WHERE M.ID = 2579806 AND ORD = 1;

--Calculate the average score of all the movies starring actor ‘DiCaprio, Leonardo’.
--Round the average score to two decimal places
SELECT ROUND(AVG(M.SCORE),2)
FROM CASTING C
INNER JOIN MOVIE M
ON C.MOVIE_ID = M.ID
INNER JOIN ACTOR A
ON C.ACTOR_ID = A.ID
WHERE A.NAME = 'DiCaprio, Leonardo';

--List the actors who played in at least 30 movies. Show the ID, name and the number of movies in which he/she played (Label this number Num_of_Movies).
--Sort the results in descending order of the Num_of_Movies.
SELECT A.ID, A.NAME, COUNT(A.ID) AS Num_of_Movies
FROM CASTING C
INNER JOIN MOVIE M
ON C.MOVIE_ID = M.ID
INNER JOIN ACTOR A
ON C.ACTOR_ID = A.ID
HAVING COUNT(A.ID) >= 30
GROUP BY A.NAME, A.ID
ORDER BY Num_of_Movies DESC;

--Show all the movies that were directed by the director of the movie ‘Avatar’.
SELECT DISTINCT M.TITLE, M.DIRECTOR
FROM CASTING C
INNER JOIN MOVIE M
ON C.MOVIE_ID = M.ID
INNER JOIN ACTOR A
ON C.ACTOR_ID = A.ID
WHERE M.DIRECTOR IN (SELECT M.DIRECTOR FROM MOVIE M WHERE M.TITLE = 'Avatar');

--Which movie has the highest score? Show the title as well as the score of this movie.
--Do NOT use the “Order By” clause. If multiple movies share the same highest score, show all of these movies.
SELECT TITLE, SCORE
FROM MOVIE
WHERE SCORE = (SELECT MAX(SCORE) FROM MOVIE);

--Find the movies that played by both ‘Chan, Jackie’ and ‘Li, Jet’.
--Show all the attributes of these movies.
SELECT M.*
FROM CASTING C
INNER JOIN MOVIE M
ON C.MOVIE_ID = M.ID
INNER JOIN ACTOR A
ON C.ACTOR_ID = A.ID
WHERE A."NAME" = 'Chan, Jackie' INTERSECT
SELECT M.*
FROM CASTING C
INNER JOIN MOVIE M
ON C.MOVIE_ID = M.ID
INNER JOIN ACTOR A
ON C.ACTOR_ID = A.ID
WHERE A."NAME" = 'Li, Jet';
