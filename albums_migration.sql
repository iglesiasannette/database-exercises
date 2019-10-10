USE codeup_test_db;

DROP TABLE IF EXISTS albums;

CREATE TABLE  albums (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id),
  artist VARCHAR(255),
  name VARCHAR(255),
  release_date INT(4),
  sales FLOAT(10,2),
  genre VARCHAR(255)
);