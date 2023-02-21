CREATE TABLE titles (
	title_id CHAR(5) PRIMARY KEY,
	title VARCHAR(20) NOT NULL
);

CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title_id CHAR(5) NOT NULL REFERENCES titles(title_id),
	birth_date DATE,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex CHAR(1),
	hire_date DATE NOT NULL
);

CREATE TABLE salaries (
	emp_no INT PRIMARY KEY REFERENCES employees(emp_no),
	salary INT NOT NULL
);

CREATE TABLE departments (
	dept_no CHAR(5) PRIMARY KEY,
	dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL REFERENCES employees(emp_no),
	dept_no CHAR(5) NOT NULL REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
	dept_no CHAR(5) NOT NULL REFERENCES departments(dept_no),
	emp_no INT NOT NULL REFERENCES employees(emp_no),
	PRIMARY KEY(dept_no, emp_no)
);