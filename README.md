# SQL-Challenge
Module 9 SQL challenge of the UCB Data Analytics & Vizualization Bootcamp. The objective of this exercise is to do a research project about people whom a ficticious company employed during the 1980s and 1990s. All that remains of the employee database from that period are six CSV files.

## Data Modeling
The EmployeeDepartment.png in the EmployeeSQL folder shows the entity relationship diagram of employees, departments, employees in each department and the department managers, in addition, the diagram also shows the relationship with employees and their title and salaries.

## Data Engineering
The EmployeeDeptDDL.sql script defines the table structure for the entities defined i.e. deparments, employees, dept_emp, dept_manager, salaries, and titles. The script does the following - 
Drops the tables if they exists
Creates the tables with the primary keys
The recommended next step is to import data from the csv's via pgadmin and verify the import.
Finally, it runs ALTER TABLE scripts to add the foreign ket constraints on the tables.

## Data Analysis
The EmployeeDeptQuestions.sql has the SQL scripts performs the following analysis:
1. Employee number, last name, first name, sex, and salary of each employee.

2. First name, last name, and hire date for the employees who were hired in 1986.

3. Manager of each department along with their department number, department name, employee number, last name, and first name.

4. Department number for each employee along with that employee’s employee number, last name, first name, and department name.

5. First name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

6. Employee in the Sales department, including their employee number, last name, and first name.

7. Each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

8. Frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).