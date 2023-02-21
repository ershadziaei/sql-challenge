-- 1) List the employee number, last name, first name, sex, and salary of each employee.

SELECT emp_no, last_name, first_name, sex, (
	SELECT salary
	FROM salaries
	WHERE salaries.emp_no = employees.emp_no
)
FROM employees;


-- 2) List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;


-- 3) List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT 	dept_manager.dept_no, 
		departments.dept_name, 
		dept_manager.emp_no, 
		employees.last_name, 
		employees.first_name
FROM dept_manager
LEFT JOIN departments ON departments.dept_no = dept_manager.dept_no
LEFT JOIN employees ON employees.emp_no = dept_manager.emp_no;


-- 4) List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT	dept_emp.dept_no,
		employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM employees
LEFT JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
LEFT JOIN departments ON departments.dept_no = dept_emp.dept_no;


-- 5) List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';


-- 6) List each employee in the Sales department, including their employee number, last name, and first name.

SELECT	employees.emp_no, 
		employees.last_name, 
		employees.first_name
FROM employees
	LEFT JOIN dept_emp 
		ON dept_emp.emp_no = employees.emp_no
	LEFT JOIN departments 
		ON departments.dept_no = dept_emp.dept_no
	WHERE departments.dept_name = 'Sales';


-- 7) List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT 	employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM employees
	LEFT JOIN dept_emp
		ON dept_emp.emp_no = employees.emp_no
	LEFT JOIN departments
		ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'
	OR departments.dept_name = 'Development';


-- 8) List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name) as name_count
FROM employees
GROUP BY last_name
ORDER BY name_count DESC;