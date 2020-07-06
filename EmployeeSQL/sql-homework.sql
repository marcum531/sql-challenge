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

SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no,
employees.last_name, employees.first_name
FROM departments
INNER JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
INNER JOIN dept_manager ON dept_emp.emp_no = dept_manager.emp_no
INNER JOIN employees on dept_manager.emp_no = employees.emp_no;

SELECT employees.emp_no, departments.dept_no, departments.dept_name,
employees.last_name, employees.first_name
FROM departments
INNER JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';
