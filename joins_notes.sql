CREATE DATABASE IF NOT EXISTS ceres_db;

# ============================== JOINS

# Use joins when you need columns of data across multiple tables

# Use of foreign keys ensures referential integrity
#   (can't insert record with id for record that doesn't exist) and to clearly describe DB structure


# Posts
#
# id(PK) | title | content | user_id (FK) | created_at | updated_at
#
# Users
#
# id(PK) | email | pass    | created_at | updated_at


# ================== JOIN BASICS

CREATE TABLE owners (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  address VARCHAR(255) DEFAULT 'Undisclosed'
);

CREATE TABLE pets (
  id INT UNSIGNED AUTO_INCREMENT,
  pet_name VARCHAR(30) NOT NULL,
  owner_id INT UNSIGNED,
  age INT,
  FOREIGN KEY (owner_id) REFERENCES owners(id),
  PRIMARY KEY (id)
);

# seed tables

INSERT INTO pets (pet_name, owner_id, age)
VALUES ('Puddle', null, 2);

INSERT INTO pets (pet_name, owner_id, age)
VALUES ('Spot', 1, 2); -- error (referential integrity at work!)

INSERT INTO owners (name, address)
VALUES ('Darth Smith', '1138 Death Star Rd.');

INSERT INTO pets (pet_name, owner_id, age)
VALUES ('Puddle', 1, 2); -- will run


SELECT * FROM pets;
SELECT * FROM owners;

# re-migrate and seed using separate file

# BASIC JOIN
# list the name and address of a pet

SELECT pets.pet_name, owners.address
FROM pets
JOIN owners ON owners.id = pets.owner_id;

# TODO: List the pet name, pet age, and owner name

select p.pet_name, p.age, o.name
from pets as p
join owners as o
on p.owner_id = o.id;

# BASIC JOIN WITH ALIASES

SELECT p.pet_name, o.address
FROM pets AS p
JOIN owners AS o ON o.id = p.owner_id;


# JOIN WITH GROUP BY
# List the number of pets at each address

SELECT owners.address, COUNT(owners.address) AS `number of pets at address` FROM pets
JOIN owners ON owners.id = pets.owner_id
GROUP BY owners.address;



# ================== INNER, LEFT, and RIGHT JOINS

USE join_test_db;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS roles;

CREATE TABLE roles (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  role_id INT UNSIGNED DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
  ('bob', 'bob@example.com', 1),
  ('joe', 'joe@example.com', 2),
  ('sally', 'sally@example.com', 3),
  ('adam', 'adam@example.com', 3),
  ('jane', 'jane@example.com', null),
  ('mike', 'mike@example.com', null);

SELECT * FROM roles;
SELECT * FROM users;

# output user name and role for all records with a non-null user name and role name

SELECT users.name, roles.name
FROM users
JOIN roles -- same as INNER JOIN
ON roles.id = users.role_id;


# output user name and their role name for all matches and all users regardless of null roles

SELECT users.name, roles.name
FROM users
LEFT JOIN roles
ON roles.id = users.role_id;


# output user name and role for all non-null matches and all roles with null users

SELECT users.name, roles.name
FROM users
RIGHT JOIN roles
ON roles.id = users.role_id;





# ================== MULTIPLE JOINS

# output all current employee names and their current titles
USE employees;

SELECT * FROM employees;
SELECT * FROM titles;

SELECT CONCAT(employees.first_name, ' ', employees.last_name), titles.title
FROM employees
JOIN titles
ON titles.emp_no = employees.emp_no
WHERE titles.to_date > NOW();



# using aliases
SELECT CONCAT(e.first_name, ' ', e.last_name), t.title
FROM employees AS e
JOIN titles as t
ON t.emp_no = e.emp_no
WHERE t.to_date > NOW();



# output name and current department for employee number 10001
USE employees;

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees as e
JOIN dept_emp as de
ON de.emp_no = e.emp_no
JOIN departments as d
ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND e.emp_no = 10001;

SELECT * FROM departments;