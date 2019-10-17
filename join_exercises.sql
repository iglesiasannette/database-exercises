USE employees;

-- Using the example in the Associative Table Joins section as a guide, write a
-- query that shows each department along with the name of the current manager for
-- that department.



SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees as e
JOIN dept_manager as de
ON e.emp_no = de.emp_no
JOIN departments as d
ON d.dept_no = de.dept_no
WHERE de.to_date > NOW()
ORDER BY  d.dept_name;

-- Find the name of all departments currently managed by women.

SELECT  d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees AS e
JOIN dept_manager AS de
ON e.emp_no = de.emp_no
JOIN departments as d
ON d.dept_no = de.dept_no
WHERE de.to_date >  NOW()
AND e.gender = 'F'
ORDER BY d.dept_name;


-- Find the current titles of employees currently working in the Customer Service department.


SELECT t.title AS 'Title', COUNT(t.title) AS 'Count'
FROM employees AS e
JOIN titles AS t
ON e.emp_no = t.emp_no
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN departments AS d
WHERE d.dept_no = 'd009'
AND de.dept_no = 'd009'
AND t.to_date > NOW()
AND de.to_date > NOW()
GROUP BY t.title;

-- Find the current salary of all current managers.

SELECT d.dept_name as 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name', s.salary AS 'Salary'
FROM employees AS e
JOIN dept_manager AS dm
ON e.emp_no = dm.emp_no
JOIN salaries AS s
ON dm.emp_no = s.emp_no
JOIN departments as d
on dm.dept_no = d.dept_no
WHERE dm.to_date > NOW()
AND s.to_date > NOW()
ORDER BY d.dept_name;









