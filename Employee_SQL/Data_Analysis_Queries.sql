-- query that retrieves information by joining multiple tables
SELECT
    employees.emp_no,
    employees.first_name,
    employees.last_name,
    titles.title,
    salaries.salary,
    departments.dept_name,
    dept_emp.dept_no,
    dept_manager.dept_no AS manager_dept_no,
    dept_manager.emp_no AS manager_emp_no
FROM
    employees
JOIN titles ON employees.emp_title_id = titles.title_id
JOIN salaries ON employees.emp_no = salaries.emp_no
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
LEFT JOIN dept_manager ON employees.emp_no = dept_manager.emp_no;

-- List the employee number, last name, first name, sex, and salary of each employee
SELECT
    employees.emp_no,
    employees.last_name,
    employees.first_name,
    employees.sex,
    salaries.salary
FROM
    employees
JOIN
    salaries ON employees.emp_no = salaries.emp_no;
	
-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT
    first_name,
    last_name,
    hire_date
FROM
    employees
WHERE
    EXTRACT(YEAR FROM hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT
    departments.dept_no AS department_number,
    departments.dept_name AS department_name,
    dept_manager.emp_no AS manager_employee_number,
    employees.last_name AS manager_last_name,
    employees.first_name AS manager_first_name
FROM
    departments
JOIN
    dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN
    employees ON dept_manager.emp_no = employees.emp_no;
	
-- achieve an output that says "The manager of {department name} (department number) is {full name} (manager employee number)" for each department
SELECT
    'The manager of ' || departments.dept_name || ' (' || departments.dept_no || ') is ' ||
    employees.first_name || ' ' || employees.last_name || ' (' || dept_manager.emp_no || ')' AS "Department Managers"
FROM
    departments
JOIN
    dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN
    employees ON dept_manager.emp_no = employees.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT
    dept_emp.emp_no AS employee_number,
    employees.last_name,
    employees.first_name,
    dept_emp.dept_no AS department_number,
    departments.dept_name
FROM
    dept_emp
JOIN
    employees ON dept_emp.emp_no = employees.emp_no
JOIN
    departments ON dept_emp.dept_no = departments.dept_no;

-- generate an output that says "The department number for {employee full name} (employee number) is {department name}" for each employee
SELECT
    'The department number for ' || employees.first_name || ' ' || employees.last_name ||
    ' (' || employees.emp_no || ') is ' || dept_emp.dept_no || ' (' || departments.dept_name || ')' AS "Employee Department Number"
FROM
    employees
JOIN
    dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN
    departments ON dept_emp.dept_no = departments.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT
    first_name,
    last_name,
    sex
FROM
    employees
WHERE
    first_name = 'Hercules'
    AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
    employees.emp_no AS employee_number,
    employees.last_name,
    employees.first_name
FROM
    employees
JOIN
    dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN
    departments ON dept_emp.dept_no = departments.dept_no
WHERE
    departments.dept_name = 'Sales';

-- display with one heading saying "Employees in the Sales Department: " and list the full names and employee numbers in parentheses for everyone in this department

SELECT
    employees.first_name || ' ' || employees.last_name || ' (' || employees.emp_no || ')' AS "Employees in the Sales Department:"
FROM
    employees
JOIN
    dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN
    departments ON dept_emp.dept_no = departments.dept_no
WHERE
    departments.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
    employees.emp_no AS employee_number,
    employees.last_name,
    employees.first_name,
    departments.dept_name
FROM
    employees
JOIN
    dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN
    departments ON dept_emp.dept_no = departments.dept_no
WHERE
    departments.dept_name IN ('Sales', 'Development');

-- Modify output to show checkmarks specifying which department each employee is in
SELECT
    employees.first_name || ' ' || employees.last_name || ' (' || employees.emp_no || ')' AS "Employee Name (Employee Number)",
    COALESCE(MAX(CASE WHEN departments.dept_name = 'Sales' THEN '✔' END), '') AS sales_department,
    COALESCE(MAX(CASE WHEN departments.dept_name = 'Development' THEN '✔' END), '') AS development_department
FROM
    employees
JOIN
    dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN
    departments ON dept_emp.dept_no = departments.dept_no
WHERE
    departments.dept_name IN ('Sales', 'Development')
GROUP BY
    employees.emp_no, employees.first_name, employees.last_name;

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT
    last_name,
    COUNT(*) AS frequency_count
FROM
    employees
GROUP BY
    last_name
ORDER BY
    frequency_count DESC, last_name;