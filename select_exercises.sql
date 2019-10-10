USE codeup_test_db;

SELECT name "These are the top selling Pink Floyd Albums: "
FROM albums
WHERE artist = 'Pink Floyd' ;

SELECT release_date "The Beatles released Sgt. Pepper's Lonley Hearts Club in:  "
FROM albums
WHERE name = '%Sgt';

SELECT genre "The album Nevermind is categorized in the this genre: "
FROM albums
WHERE name = 'Nevermind' ;


SELECT name "The top selling albums released in the 90's were: "
FROM albums
WHERE release_date >= 1990
AND release_date <=1999;

SELECT name "The albums categorized in the rock genre are: "
FROM albums
WHERE genre = 'rock' ;

