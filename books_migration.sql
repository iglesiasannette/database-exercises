USE codeup_test_db;

DROP TABLE IF EXISTS albums;

CREATE TABLE books (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  title VARCHAR(255),
  author_first_name VARCHAR(255) NOT NULL DEFAULT 'Unknown',
  author_last_name DATE NOT NULL,
  description TEXT,
  genre VARCHAR(255),
  published INT NOT NULL DEFAULT '0',
  PRIMARY KEY (id)
);

--
-- //TABLE BONUSES...
-- Create a migration file for the following tables:
-- 1. A books table with the following columns...
--  id , required and will be primary key
--  title , required
--  author , required and 'Unknown' by default
--  date_published , required
--  description ,
--  bestseller_weeks , required and 0 by default