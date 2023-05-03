--Drop all the tables
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS titles;

--Create all tables
CREATE TABLE departments (
dept_no VARCHAR(4) PRIMARY KEY,
dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
emp_no INTEGER PRIMARY KEY,
emp_title_id VARCHAR(5) NOT NULL,
birth_date DATE,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
sex VARCHAR(2),
hire_date DATE NOT NULL
);

CREATE TABLE dept_emp(
emp_no INTEGER NOT NULL,
dept_no VARCHAR(4) NOT NULL
);

CREATE TABLE dept_manager (
dept_no CHAR(4) NOT NULL,
emp_no INTEGER NOT NULL
);

CREATE TABLE salaries (
emp_no INTEGER NOT NULL,
salary INTEGER NOT NULL
);

CREATE TABLE titles(
title_id VARCHAR(5) PRIMARY KEY,
title VARCHAR(50) NOT NULL
);

--Run the following select statements after importing the data to check if the import was successful
select * from departments;
select * from employees LIMIT 50;
select * from dept_emp LIMIT 50;
select * from dept_manager;
select * from salaries LIMIT 50;
select * from titles;

-- Run the alter table scripts to add foreign key constraints after import so the order of import does not matter.
ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES titles (title_id);
ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);
ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);
ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);
ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);
ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);