USE employees;

-- Find all the employees with the same hire date as employee 101010 using a subquery.
-- 69 Rows

SELECT *
FROM employees
WHERE hire_date = (
    SELECT hire_date
    FROM employees
    WHERE emp_no = 101010
    );

-- Find all the titles held by all employees with the first name Aamod.
-- 314 total titles, 6 unique titles

SELECT title
FROM titles
WHERE emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE first_name = 'Aamod'
)
ORDER BY title;

-- Find all the current department managers that are female.
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
    WHERE emp_no IN (
        SELECT emp_no
        FROM employees
        WHERE gender='F'
        )
    AND to_date > now()
    );

-- Find all the department names that currently have female managers.
select dept_name
from departments
where dept_no IN (
    select dept_no
    from dept_manager
    where to_date > now()
    and emp_no IN (
        select emp_no
        from employees
        where gender = 'F'
        )
    );

-- Find the first and last name of the employee with the highest salary.

select first_name, last_name
from employees
where emp_no IN (
    select emp_no
    from salaries
    where salary =(
    select MAX(salary)
    from salaries
    )
    );