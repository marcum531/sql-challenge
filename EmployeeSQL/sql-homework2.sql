DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;


CREATE TABLE departments (
			dept_no VARCHAR NOT NULL,
			dept_name VARCHAR NOT NULl,
			PRIMARY KEY (dept_no)
			);

CREATE TABLE dept_emp (
			emp_no INT NOT NULL,
			dept_no VARCHAR NOT NULL,
			PRIMARY KEY (emp_no, dept_no),
			FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
			FOREIGN KEY (emp_no) REFERENCES employees (emp_no));

CREATE TABLE manager (
			dept_no VARCHAR NOT NULL,
			emp_no INT NOT NULL,
			PRIMARY KEY (emp_no),
			FOREIGN KEY (dept_no) REFERENCES departments (dept_no));
			
CREATE TABLE employees (
			emp_no INT NOT NULL,
			emp_title VARCHAR NOT NULL,
			birth_date DATE NOT NULL,
			first_name VARCHAR NOT NULL,
			last_name VARCHAR NOT NULL,
			sex VARCHAR NOT NULL,
			hire_date DATE NOT NULL,
			PRIMARY KEY (emp_no));
			
CREATE TABLE salaries (
			emp_no INT NOT NULL,
			salary INT NOT NULL,
			PRIMARY KEY (emp_no),
			FOREIGN KEY (emp_no) REFERENCES employees (emp_no));
			
CREATE TABLE titles (
			title_id VARCHAR NOT NULL,
			title VARCHAR NOT NULL,
			PRIMARY KEY (title_id));
-- Querying all information from each table 
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM manager;
SELECT * FROM salaries;
SELECT * FROM titles;

-- 1. List the following details of each employee: employee number, last name, first name, gender and salary
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex,
salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

-- 2. Last name, first name and hire date for employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
where EXTRACT(year FROM "hire_date") = 1986;

--3.  List the manager of each deparment with department number, department name, manager's employee number, last name, and first name
SELECT departments.dept_no, departments.dept_name, manager.emp_no, 
employees.last_name, employees.first_name
FROM departments
INNER JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
INNER JOIN manager ON dept_emp.emp_no = manager.emp_no
INNER JOIN employees ON manager.emp_no = employees.emp_no;

--4. List the department of each employee with employee number, last name, first name and department name
SELECT employees.emp_no, employees.last_name, employees.first_name, 
departments.dept_name
FROM departments
INNER JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no;

--5. List first name, last name, and gender for employees whose first name is Hercules and last names beginning with B
SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

--6. List all employees in Sales Dept including employee number, last name, first name, department name
SELECT employees.emp_no, employees.last_name, employees.first_name, 
departments.dept_name
FROM departments
INNER JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales'
ORDER BY employees.emp_no;

--7. List employees in Sales and Development departments including employee number, last name, first name, department name
SELECT employees.emp_no, employees.last_name, employees.first_name, 
departments.dept_name
FROM departments
INNER JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development'
ORDER BY employees.emp_no;

--8.  List the frequency count of employee last names
SELECT employees.last_name, COUNT(employees.last_name) FROM employees
GROUP BY last_name
ORDER BY last_name DESC;

SELECT employees.last_name, COUNT(employees.last_name) FROM employees
GROUP BY last_name
ORDER BY COUNT(employees.last_name) DESC;



