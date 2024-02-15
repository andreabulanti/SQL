USE chinook;

-- Elencate il numero di tracce per ogni genere in ordine discendente, escludendo quei generi che hanno meno di 10 tracce.
SELECT track.GenreID, COUNT(*) as NumberOFTracks from track
group by track.GenreID
HAVING COUNT(*) > 10
order by 2 DESC;

-- Trovate le tre canzoni più costose.
SELECT TrackId, max(UnitPrice) FROM track 
GROUP BY TrackId
ORDER BY 2 DESC;

SELECT track.TrackId, track.Name, SUM(invoiceline.UnitPrice * invoiceline.Quantity) as Total
FROM track
INNER JOIN
invoiceline ON track.TrackId = invoiceline.TrackId
GROUP BY track.TrackId, track.Name
ORDER BY 3 desc
LIMIT 3;

-- Elencate gli artisti che hanno canzoni più lunghe di 6 minuti.
SELECT distinct(artist.name) from artist
INNER JOIN album ON
artist.ArtistId = album.ArtistId
inner join track ON track.TrackId=album.AlbumId
where track.Milliseconds > 360000
ORDER BY 1 asc;

-- Individuate la durata media delle tracce per ogni genere.
SELECT genre.GenreId, genre.Name, AVG(track.Milliseconds) FROM track, genre
WHERE  genre.GenreId = track.GenreId
GROUP BY GenreId;

-- Elencate tutte le canzoni con la parola “Love” nel titolo, ordinandole alfabeticamente prima per genere e poi per nome.
SELECT genre.Name, track.name FROM track, genre
WHERE  genre.GenreId = track.GenreId and ucase(track.name) LIKE "%love%"
ORDER BY 1, 2;

-- Trovate il costo medio per ogni tipologia di media
SELECT mediatype.Name, AVG(track.UnitPrice) as CostoMedio FROM mediatype, track
WHERE mediatype.MediaTypeId = track.MediaTypeId
GROUP BY mediatype.Name
order by 1;

-- Individuate il genere con più tracce.
SELECT genre.GenreId, genre.Name, count(*) as tracce_totali from genre, track
WHERE genre.GenreId = track.GenreId
GROUP BY genre.GenreId, genre.Name
ORDER BY tracce_totali desc
LIMIT 1;

-- Trovate gli artisti che hanno lo stesso numero di album dei Rolling Stones.
SELECT artist.Name, count(*) as NumeroAlbum from artist, album
WHERE artist.ArtistId = album.ArtistId
GROUP BY artist.Name
HAVING count(*) = (SELECT count(*) as NumeroAlbum from artist, album
WHERE artist.ArtistId = album.ArtistId and artist.Name = "The Rolling Stones") 
ORDER BY 1 asc;

-- Trovate l’artista con l’album più costoso.
SELECT artist.Name, album.Title, SUM(track.UnitPrice) TotalPrice from artist, album, track
WHERE artist.ArtistId = album.ArtistId and album.AlbumId = track.AlbumId
GROUP BY artist.Name, album.Title
order BY 3 DESC
LIMIT 1

