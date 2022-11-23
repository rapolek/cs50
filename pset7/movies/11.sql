SELECT title
FROM movies
JOIN ratings, stars, people
ON ratings.movie_id = movies.id
AND stars.movie_id = movies.id
AND people.id = stars.person_id
WHERE name = "Chadwick Boseman"
ORDER BY rating DESC
LIMIT 5;
