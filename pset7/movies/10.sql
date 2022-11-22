SELECT name
FROM directors
JOIN ratings, people
ON ratings.movie_id = directors.movie_id
AND people.id = directors.person_id
WHERE rating >= 9;