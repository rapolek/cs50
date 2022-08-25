SELECT name
FROM people
JOIN stars, movies
ON stars.person_id = people.id
AND stars.movie_id = movies.id
WHERE title = "Toy Story";