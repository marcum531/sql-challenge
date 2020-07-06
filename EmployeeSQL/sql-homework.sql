CREATE TABLE departments (
			dept_no VARCHAR,
			dept_name VARCHAR);

CREATE TABLE dept_emp (
			emp_no INT, 
			dept_no VARCHAR);
			
CREATE TABLE dept_manager (
			dept_no VARCHAR,
			emp_no INT);
			
CREATE TABLE employees (
			emp_no INT,
			emp_title VARCHAR,
			birth_date DATE,
			first_name VARCHAR,
			last_name VARCHAR,
			sex VARCHAR,
			hire_date DATE);

CREATE TABLE salaries (
			emp_no INT,
			salary INT);
			
CREATE TABLE titles (
			title_id VARCHAR,
			title VARCHAR);
			
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM dept_emp;


SELECT employees.emp_no, employees.last_name, employees.first_name, 
employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON
salaries.emp_no = employees.emp_no
ORDER BY emp_no;

SELECT first_name, last_name, hire_date
FROM employees
where EXTRACT(year FROM "hire_date") = 1986;


