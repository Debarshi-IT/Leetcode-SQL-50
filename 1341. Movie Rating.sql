/*
Table: Movies
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| title         | varchar |
+---------------+---------+
movie_id is the primary key (column with unique values) for this table.
title is the name of the movie.
Each movie has a unique title.
Table: Users
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| name          | varchar |
+---------------+---------+
user_id is the primary key (column with unique values) for this table.
The column 'name' has unique values.
Table: MovieRating
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| user_id       | int     |
| rating        | int     |
| created_at    | date    |
+---------------+---------+
(movie_id, user_id) is the primary key (column with unique values) for this table.
This table contains the rating of a movie by a user in their review.
created_at is the user's review date. 
*/
(
  SELECT u.name AS results
  FROM Users u
  JOIN MovieRating mr ON mr.user_id = u.user_id
  GROUP BY u.user_id, u.name
  ORDER BY COUNT(*) DESC, u.name ASC
  LIMIT 1
)
UNION ALL
(
  SELECT m.title AS results
  FROM Movies m
  JOIN MovieRating mr ON mr.movie_id = m.movie_id
  WHERE mr.created_at >= '2020-02-01' AND mr.created_at < '2020-03-01'
  GROUP BY m.movie_id, m.title
  ORDER BY AVG(mr.rating) DESC, m.title ASC
  LIMIT 1
);
