DROP database if EXISTS practice_adlister_db;

-- Specifications:
-- Users sign up for the site with an email and password
-- Users create ads with a title and description and category.
-- Each ad is associated with the user that created it.
-- An ad can be in one or more categories (for example, "help wanted", "giveaway", or "furniture")


CREATE database practice_adlister_db;
USE practice_adlister_db;

CREATE TABLE users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    email varchar(100) NOT NULL,
    password varchar(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE ads (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title varchar(255) NOT NULL,
    description text NOT NULL,
    user_id INT UNSIGNED,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE categories (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    category VARCHAR(100),
    PRIMARY KEY (id)
);

create table ad_category (
    ad_id INT UNSIGNED,
    category_id INT UNSIGNED,
    FOREIGN KEY (ad_id) REFERENCES ads(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

