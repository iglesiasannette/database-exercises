USE practice_adlister_db;

INSERT INTO users (email, password)
VALUES  ('annette@gmail.com', 'annette123'),
        ('joseph@gmail.com', 'joseph123'),
        ('diego@gmail.com', 'diego123');

INSERT INTO ads (title, description, user_id)
VALUES  ('1 bed/1 bath Studio For Rent', 'Charming studio apartment for rent in the heart of Alamo Heights!', 1),
        ('Neighborhood Block Party', 'Family friendly event, this Sunday, in the King Williams district!', 2),
        ('Dog Training', 'Certified Professional Dog Trainer with over 1500 hours training dogs! Call me today! 210-123-4567', 3),
        ('Servers For Hire ', 'New local restaurant looking for servers with fine dining experience.', 3);


INSERT INTO categories (category)
VALUES ('Jobs'),
       ('Housing'),
       ('For Sale'),
       ('Services'),
       ('Community Events');

INSERT INTO ad_category (ad_id, category_id)
VALUES (1, 2),
       (2, 5),
       (3, 4),
       (4, 1);