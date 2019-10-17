DROP DATABASE IF EXISTS ceres_db;
CREATE DATABASE ceres_db;

USE ceres_db;

CREATE TABLE owners (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  address VARCHAR(255) DEFAULT 'Undisclosed'
);

CREATE TABLE pets (
  id INT UNSIGNED AUTO_INCREMENT,
  pet_name VARCHAR(30) NOT NULL,
  owner_id INT UNSIGNED DEFAULT NULL,
  age INT,
  PRIMARY KEY (id),
  FOREIGN KEY (owner_id) REFERENCES owners(id)
);

CREATE TABLE toys (
id INT UNSIGNED AUTO_INCREMENT,
type VARCHAR(30) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE pets_toys (
pet_id INT UNSIGNED,
toy_id INT UNSIGNED,
FOREIGN KEY (pet_id) REFERENCES pets(id),
FOREIGN KEY (toy_id) REFERENCES toys(id)
);

INSERT INTO owners (name, address)
VALUES
('Darth Smith', '1138 Death Star Rd.'),
('Padme Smith', '1138 Death Star Rd.'),
('Luke Douglas', '18 Tatooine Ln.'),
('Lando Johnson', '777 Bespin Street');

INSERT INTO pets (pet_name, owner_id, age)
VALUES
('Spot', 1, 2),
('Puddle', 1, 2),
('Elrond', 1, 5),
('Mr. Pig', 2, 10),
('Mack', 2, 7),
('Bud', 3, 2),
('Bubbles', 4, 1);

INSERT INTO toys (type)
VALUES
('ball'),
('bone'),
('squeaky toy'),
('rope');
#
 INSERT INTO pets_toys (pet_id, toy_id)
 VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 3),
(4, 2),
(4, 4);