use employees;

-- Create a new file called order_by_exercises.sql and copy and paste the contents
-- of your where_exercises.sql.
-- Modify your first query to order by first name. The first result should be
--  Irena Reutenauer and the last result should be Vidya Simmen.

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;

-- Update the query to order by first name and then last name.
-- The first result should now be Irena Acton and the last should be Vidya Zweizig.

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;

-- Change the order by clause so that you order by last name before
-- first name. Your first result should still be Irena Acton but now the last
-- result should be Maya Zyda.

SELECT *
FROM employees
WHERE first_name in ('Irena', 'Vidya', 'Maya')
ORDER BY  last_name, first_name;

-- Update your queries for employees with 'E' in their last name
-- to sort the results by their employee number. Your results should not change!

SELECT *
FROM employees
WHERE last_name LIKE 'E%'
ORDER BY emp_no;

SELECT *
FROM employees
WHERE last_name LIKE 'E%'
ORDER BY emp_no DESC ;


select *
from employees
where last_name like 'E%'
   or last_name like '%E' order by emp_no;


select *
from employees
where last_name like 'E%E' order by emp_no desc;

-- Change the query for employees hired in the 90s and born on Christmas such
-- that the first result is the oldest employee who was hired last. It should be Khun Bernini.

select *
from employees
where hire_date like '199%'
and birth_date like '%12-25'
order by birth_date desc,
         hire_date asc;
