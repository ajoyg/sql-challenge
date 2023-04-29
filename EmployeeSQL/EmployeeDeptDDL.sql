DROP TABLE IF EXISTS departments CASCADE;
CREATE TABLE departments (
dept_no CHAR(4) PRIMARY KEY,
dept_name VARCHAR(50) NOT NULL
);
select * from departments;

DROP TABLE IF EXISTS employees CASCADE;
CREATE TABLE employees (
emp_no INTEGER PRIMARY KEY,
emp_title_id VARCHAR(5) NOT NULL,
birth_date DATE,
first_name VARCHAR(50),
last_name VARCHAR(50),
sex VARCHAR(2),
hire_date DATE NOT NULL
);
select * from employees LIMIT 100;

DROP TABLE IF EXISTS dept_emp CASCADE;
CREATE TABLE dept_emp(
emp_no INTEGER NOT NULL,
dept_no VARCHAR(4) NOT NULL
);
SELECT * from dept_emp LIMIT 100;

DROP TABLE IF EXISTS dept_manager CASCADE;
CREATE TABLE dept_manager (
dept_no CHAR(4) NOT NULL,
emp_no INTEGER NOT NULL
);
SELECT * from dept_manager;

DROP TABLE IF EXISTS salaries CASCADE;
CREATE TABLE salaries (
emp_no INTEGER NOT NULL,
salary INTEGER NOT NULL
);
SELECT * from salaries;

DROP TABLE IF EXISTS titles;
CREATE TABLE titles(
title_id VARCHAR(5) PRIMARY KEY,
title VARCHAR(50) NOT NULL
);
select * from titles;

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES titles (title_id);
ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);
ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES department (dept_no);
ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES department (dept_no);
ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);
ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);