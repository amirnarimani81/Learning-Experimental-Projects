-- Netflix Data Analysis using SQL

-- Solutions of 15 business problems
1. Count the number of Movies vs TV Shows
2. Find the most common rating for movies and TV shows
3. List all movies released in a specific year (e.g., 2020)
4. Find the top 5 countries with the most content on Netflix
5. Identify the longest movie
6. Find content added in the last 5 years
7. Find all the movies/TV shows by director 'Rajiv Chilaka'!
8. List all TV shows with more than 5 seasons
9. Count the number of content items in each genre
10.Find each year and the average numbers of content release in United States on netflix. 
return top 5 year with highest avg content release!
11. List all movies that are documentaries
12. Find all content without a director
13. Find the top 10 actors who have appeared in the highest number of movies produced in United States.
14.Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
the description field. Label content containing these keywords as 'Bad' and all other 
content as 'Good'. Count how many items fall into each category.

Create table netflix (
show_id varchar(8),
type varchar(10),
title varchar (10),
director varchar(200),
casts varchar(1000),
country varchar(100),
date_added varchar (50),
release_year int, 
rating varchar (10));


select* from netflix 

SELECT COUNT(*) AS total_content
FROM netflix;

SELECT COUNT(*) AS total_movies
FROM netflix
WHERE type = 'Movie';

-- 1. Count the number of Movies vs TV Shows

SELECT 
	type,
	COUNT(*) AS TOTAL_CONTENT
FROM netflix
GROUP BY type

-- 2. Find the most common rating for movies and TV shows


    SELECT 
        type,
        rating,
        COUNT(*) AS rating_count
         RANK() OVER (PARTITION BY type ORDER BY rating_count DESC) AS rank
    FROM netflix
    GROUP BY type, rating

-- 3. List all movies released in a specific year (e.g., 2020)

SELECT * 
FROM netflix
WHERE release_year = 2020


-- 4. Find the top 5 countries with the most content on Netflix

SELECT country, 
       COUNT(*) AS total_content
FROM netflix
GROUP BY country
ORDER BY total_content DESC
LIMIT 5;


SELECT * 
FROM
(
	SELECT 
		-- country,
		UNNEST(STRING_TO_ARRAY(country, ',')) as country,
		COUNT(*) as total_content
	FROM netflix
	GROUP BY 1
)as t1
WHERE country IS NOT NULL
ORDER BY total_content DESC
LIMIT 5


-- 5. Identify the longest movie

SELECT *
FROM netflix
WHERE type = 'Movie'
and duration = (select max(duration) from netflix)


-- 6. Find content added in the last 5 years
SELECT
*
FROM netflix
WHERE TO_DATE(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years'


-- 7. Find all the movies/TV shows by director 'Rajiv Chilaka'!

SELECT *
FROM netflix
WHERE director ILIKE '%Rajiv Chilaka%';



-- 8. List all TV shows with more than 5 seasons

SELECT *
FROM netflix
WHERE 
	TYPE = 'TV Show'
	AND
	SPLIT_PART(duration, ' ', 1)::INT > 5


-- 9. Count the number of content items in each genre

SELECT 
	UNNEST(STRING_TO_ARRAY(listed_in, ',')) as genre,
	COUNT(*) as total_content
FROM netflix
GROUP BY 1


-- 10. Find each year and the average numbers of content release by United States on netflix. 
-- return top 5 year with highest avg content release !


SELECT 
    EXTRACT(YEAR FROM TO_DATE(date_added,'Month DD, YYYY')) AS year,
    COUNT(*) AS total_content
FROM netflix
WHERE country ILIKE '%United States%'
GROUP BY 1
ORDER BY 2 DESC, AVG
LIMIT 5;


-- 11. List all movies that are documentaries
SELECT * FROM netflix
WHERE listed_in LIKE '%Documentaries'



-- 12. Find all content without a director
SELECT * FROM netflix
WHERE director IS NULL



-- 13. Find the top 10 actors who have appeared in the highest number of movies produced in United States.
SELECT cast, COUNT(*) AS total_movies
FROM netflix
WHERE type = 'Movie' AND country ILIKE '%United States%'
GROUP BY cast
ORDER BY total_movies DESC
LIMIT 10;


-- Question 14:Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
-- the description field. Label content containing these keywords as 'Bad' and all other 
-- content as 'Good'. Count how many items fall into each category.



SELECT 
    category,
	TYPE,
    COUNT(*) AS content_count
FROM (
    SELECT 
		*,
        CASE 
            WHEN description ILIKE '%kill%' OR description ILIKE '%violence%' THEN 'Bad'
            ELSE 'Good'
        END AS category
    FROM netflix
) AS categorized_content
GROUP BY 1,2
ORDER BY 2





