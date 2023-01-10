-- select all movies that Kevin Bacon stars in:
-- SELECT title
-- FROM movies
-- JOIN stars, people
-- ON stars.movie_id = movies.id
-- AND people.id = stars.person_id
-- WHERE name = "Kevin Bacon"
-- AND birth = 1958;

SELECT name
FROM people
JOIN stars, movies
ON stars.person_id = people.id
AND movies.id = stars.movie_id
WHERE title
IN (SELECT title
FROM movies
JOIN stars, people
ON stars.movie_id = movies.id
AND people.id = stars.person_id
WHERE name = "Kevin Bacon"
AND birth = 1958)
AND name != "Kevin Bacon";

