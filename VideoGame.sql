CREATE DATABASE VideoGamesDB;

USE VideoGamesDB;

-- Table for Genres
CREATE TABLE Genres (
    GenreID INT PRIMARY KEY IDENTITY(1,1),
    GenreName VARCHAR(50) NOT NULL
);

-- Table for Platforms
CREATE TABLE Platforms (
    PlatformID INT PRIMARY KEY IDENTITY(1,1),
    PlatformName VARCHAR(50) NOT NULL
);

-- Table for Games
CREATE TABLE Games (
    GameID INT PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(100) NOT NULL,
    ReleaseYear INT,
    GenreID INT,
    PlatformID INT,
    Developer VARCHAR(100),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID),
    FOREIGN KEY (PlatformID) REFERENCES Platforms(PlatformID)
);

-- Table for Reviews
CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY IDENTITY(1,1),
    GameID INT,
    Rating DECIMAL(3, 2),
    ReviewDate DATE,
    ReviewerName VARCHAR(100),
    FOREIGN KEY (GameID) REFERENCES Games(GameID)
);

ALTER TABLE Reviews 
ALTER COLUMN Rating DECIMAL(4,2);



-- All games in 2017 with genre
/*
SELECT g.Title, g.ReleaseYear, ge.GenreName, p.PlatformName 
FROM Games g
JOIN Genres ge ON g.GenreID = ge.GenreID
JOIN Platforms p ON g.PlatformID = p.PlatformID
WHERE g.ReleaseYear = 2017;
*/

--Average rating
/*
SELECT g.Title, AVG(r.Rating) AS AverageRating
FROM Games g
JOIN Reviews r ON g.GameID = r.GameID
GROUP BY g.Title;
*/

--All games with rating higher than 9
/*
SELECT g.Title, AVG(r.Rating) AS AverageRating
FROM Games g
JOIN Reviews r ON g.GameID = r.GameID
GROUP BY g.Title
HAVING AVG(r.Rating) > 9;
*/

--Top 5 highest-rated games
/*
SELECT TOP 5 g.Title, AVG(r.Rating) AS AverageRating
FROM Games g
JOIN Reviews r ON g.GameID = r.GameID
GROUP BY g.Title
ORDER BY AverageRating DESC;
*/

--Recent game reviews
/*
SELECT g.Title, r.Rating, r.ReviewDate, r.ReviewerName
FROM Games g
JOIN Reviews r ON g.GameID = r.GameID
ORDER BY r.ReviewDate DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;
*/

