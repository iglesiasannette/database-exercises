USE codeup_test_db;

SELECT name "All the albums on this table are: "
FROM albums;

SELECT name "All the albums released before 1980: "
FROM albums
WHERE release_date < 1980;

SELECT name "The albums released by Michael Jackson include: "
FROM albums
WHERE artist = 'Michael Jackson';