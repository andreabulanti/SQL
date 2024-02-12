USE chinook;

SELECT track.Name from track
WHERE GenreId = ANY 
(SELECT genre.GenreId FROM genre WHERE genre.Name IN ("Pop", "Rock"))
ORDER BY 1;

SELECT artist.Name, album.Title
FROM artist
INNER JOIN album
ON artist.ArtistId = album.ArtistId and artist.Name LIKE "A%"
ORDER BY 1, 2;

SELECT track.Name, track.Milliseconds from track
WHERE GenreId = (SELECT genre.GenreId FROM genre WHERE genre.Name = "Jazz")
AND track.Milliseconds >= 180000
ORDER BY 2;

SELECT track.Name, track.Milliseconds from track
WHERE track.Milliseconds > (SELECT AVG(track.Milliseconds) from track)
ORDER BY 2;

SELECT DISTINCT(genre.Name) FROM genre
INNER JOIN track
ON genre.GenreId = track.GenreId
AND track.Milliseconds > (SELECT avg(track.Milliseconds) from track)
ORDER BY 1;

SELECT artist.Name, COUNT(*) AS NumeroAlbumVenduti
FROM artist
INNER JOIN album ON artist.ArtistId = album.ArtistId
GROUP BY artist.Name
HAVING COUNT(*) > 1
ORDER BY 2;

SELECT A.title, T.Milliseconds
FROM album A
INNER JOIN track T ON A.AlbumId = T.AlbumId
WHERE (T.Milliseconds, A.AlbumId) IN (
    SELECT MAX(t.Milliseconds), t.AlbumId
    FROM track t
    GROUP BY t.AlbumId
);

SELECT A.title, ROUND(AVG(T.Milliseconds),2) as durata_media
FROM album A
INNER JOIN track T ON A.AlbumId = T.AlbumId
GROUP BY A.title;

SELECT A.title, COUNT(*) as NumeroTracce
FROM album A
INNER JOIN track T ON A.AlbumId = T.AlbumId
GROUP BY A.title
HAVING COUNT(*) > 20
ORDER BY 1;
