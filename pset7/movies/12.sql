SELECT title
FROM movies
JOIN stars, people
ON stars.movie_id = movies.id
AND people.id = stars.person_id
WHERE name = "Johnny Depp"
AND title
IN (SELECT title
FROM movies
JOIN stars, people
ON stars.movie_id = movies.id
AND people.id = stars.person_id
WHERE name = "Helena Bonham Carter");