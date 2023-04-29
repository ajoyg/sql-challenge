--1. List the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no AS "Employee Number", e.last_name AS "Last Name",
e.first_name AS "First Name", e.sex AS "Sex", s.salary AS "Salary"
from employees e
INNER JOIN salaries s
ON e.emp_no=s.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name AS "FIRST NAME", last_name AS "LAST NAME", hire_date AS "HIRE DATE"
from employees where EXTRACT('Year' FROM hire_date) = 1986 ORDER BY hire_date;

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no AS "Department Number", d.dept_name AS "Department Name",
dm.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name"
FROM dept_manager dm
INNER JOIN departments d
ON dm.dept_no = d.dept_no 
INNER JOIN employees e
ON dm.emp_no=e.emp_no;

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
-- Using a different format, INNER JOIN is default
SELECT  de.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name", d.dept_name AS "Department Name"
FROM dept_emp de, departments d, employees e
WHERE de.dept_no = d.dept_no 
and de.emp_no=e.emp_no;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name AS "First Name", last_name AS "Last Name", sex AS "Sex"
FROM employees
WHERE first_name = 'Hercules' and last_name like 'B%' ORDER by last_name;

--6. List each employee in the Sales department, including their employee number, last name, and first name.
-- USING nested sub-queries
SELECT e.emp_no AS "Employee Number", e.first_name AS "First Name", e.last_name AS "Last Name"
FROM employees e 
WHERE emp_no in (SELECT emp_no FROM dept_emp 
				WHERE dept_no = (SELECT dept_no FROM departments WHERE dept_name= 'Sales'));
								 
--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no AS "Employee Number", e.first_name AS "First Name", e.last_name AS "Last Name", d.dept_name AS "Department Name"
from employees e
INNER JOIN dept_emp de
ON e.emp_no=de.emp_no 
INNER JOIN departments d
ON de.dept_no = d.dept_no
and d.dept_name in ('Sales','Development')

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name AS "Last Name", count(last_name) 
FROM employees 
GROUP BY last_name
ORDER BY count(last_name) DESC;