USE practice_adlister_db;

-- Queries
--
-- Write SQL queries to answer the following questions:
--
-- 1. For a given ad, what is the email address of the user that created it?
-- 2. For a given ad, what category, or categories, does it belong to?
-- 3. For a given category, show all the ads that are in that category.
-- 4.  For a given user, show all the ads they have posted.



-- 1. For a given ad, what is the email address of the user that created it?

SELECT email
FROM users
WHERE id = (
    SELECT user_id
    FROM ads
    WHERE id = 2
    );

-- 2. For a given ad, what category, or categories, does it belong to?

SELECT category
FROM categories
WHERE id IN (
    SELECT category_id
    FROM ad_category
    WHERE ad_id = 2
    );


-- 3. For a given category, show all the ads that are in that category.

SELECT *
FROM ads
WHERE id IN (
    SELECT ad_id
    FROM ad_category
    WHERE category_id = (
        SELECT id
        FROM categories
        WHERE id = '2'
        )
    );
