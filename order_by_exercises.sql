-- # Update your queries for employees whose names start and end with 'E'. Use concat()
-- to combine their first and last name together as a single column in your results.

SELECT CONCAT(first_name, ' ', last_name)
FROM employees
WHERE last_name LIKE 'e%'
AND last_name LIKE '%e';

-- For your query of employees born on Christmas and hired in the 90s, use datediff() to
-- find how many days they have been working at the company (Hint: You will also need to
-- use now() or curdate())

SELECT CONCAT(first_name, ' ', last_name) AS name, CONCAT('Working at the company for ', DATEDIFF(NOW(), hire_date) / 365, ' days') as years_at_company_message
FROM employees
WHERE birth_date LIKE '%12-25'
AND hire_date LIKE '199%'
ORDER BY birth_date, hire_date DESC;