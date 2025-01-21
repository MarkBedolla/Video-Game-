USE VideoGamesDB;

/* All games in 2017 with genre*/
/*
SELECT g.Title, g.ReleaseYear, ge.GenreName, p.PlatformName 
FROM Games g
JOIN Genres ge ON g.GenreID = ge.GenreID
JOIN Platforms p ON g.PlatformID = p.PlatformID
WHERE g.ReleaseYear = 2017;
*/

/*Average rating*/
/*
SELECT g.Title, AVG(r.Rating) AS AverageRating
FROM Games g
JOIN Reviews r ON g.GameID = r.GameID
GROUP BY g.Title;
*/

/*All games with rating higher than 9*/
/*
SELECT g.Title, AVG(r.Rating) AS AverageRating
FROM Games g
JOIN Reviews r ON g.GameID = r.GameID
GROUP BY g.Title
HAVING AVG(r.Rating) > 9;
*/

/*Top 5 highest-rated games*/
/*
SELECT TOP 5 g.Title, AVG(r.Rating) AS AverageRating
FROM Games g
JOIN Reviews r ON g.GameID = r.GameID
GROUP BY g.Title
ORDER BY AverageRating DESC;
*/

/*Recent game reviews*/
/*
SELECT g.Title, r.Rating, r.ReviewDate, r.ReviewerName
FROM Games g
JOIN Reviews r ON g.GameID = r.GameID
ORDER BY r.ReviewDate DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;
*/

