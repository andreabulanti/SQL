USE chinook;
SHOW TABLES;

SELECT * from album LIMIT 10;

SELECT COUNT(*) FROM track;

SELECT DISTINCT(Name) FROM genre;

SELECT g.Name, t.Name from genre g
INNER JOIN track t ON
g.GenreId = t.GenreId;

SELECT artist.Name FROM artist
WHERE EXISTS (SELECT album.AlbumId FROM album WHERE artist.ArtistId = album.ArtistId)
ORDER BY 1;

SELECT count(*) as artist_with_sales FROM artist
WHERE EXISTS (SELECT album.AlbumId FROM album WHERE artist.ArtistId = album.ArtistId)
ORDER BY 1;

SELECT artist.Name FROM artist
WHERE NOT EXISTS (SELECT album.AlbumId FROM album WHERE artist.ArtistId = album.ArtistId)
ORDER BY 1;

SELECT COUNT(*) as artist_without_sales FROM artist
WHERE NOT EXISTS (SELECT album.AlbumId FROM album WHERE artist.ArtistId = album.ArtistId)
ORDER BY 1;

SELECT g.Name, t.Name, m.Name from genre g
INNER JOIN track t ON
g.GenreId = t.GenreId
INNER JOIN mediatype m ON
t.MediaTypeId =  m.MediaTypeId;

SELECT artist.Name as Artist_Name, album.Title as Album_Title FROM artist, album
WHERE artist.ArtistId = album.ArtistId
ORDER BY 1, 2;






