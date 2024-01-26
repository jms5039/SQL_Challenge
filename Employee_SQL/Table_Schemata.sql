-- Create titles table
CREATE TABLE titles (
  title_id VARCHAR(5) PRIMARY KEY NOT NULL,
  title VARCHAR(50) NOT NULL
);

-- Create employees table
CREATE TABLE employees (
  emp_no INT PRIMARY KEY NOT NULL,
  emp_title_id VARCHAR(5) REFERENCES titles(title_id) NOT NULL,
  birth_date DATE NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  sex VARCHAR(1) NOT NULL,
  hire_date DATE NOT NULL
);

-- Create departments table
CREATE TABLE departments (
  dept_no VARCHAR(5) PRIMARY KEY NOT NULL,
  dept_name VARCHAR(50) NOT NULL
);
	
-- Create dept_emp table
CREATE TABLE dept_emp (
  emp_no INT NOT NULL,
  dept_no VARCHAR(5) NOT NULL,
  PRIMARY KEY (emp_no, dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
	
-- Create salaries table
CREATE TABLE salaries (
  emp_no INT PRIMARY KEY NOT NULL,
  salary INT NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create dept_manager table
CREATE TABLE dept_manager (
  dept_no VARCHAR(5) NOT NULL,
  emp_no INT NOT NULL,
  PRIMARY KEY (dept_no, emp_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Import each CSV file into its corresponding SQL table
COPY titles FROM 'C:\Users\Jackie\Desktop\KU Data Analytics Bootcamp\Challenges\SQL-Challenge\data\titles.csv' DELIMITER ',' CSV HEADER;
COPY employees FROM 'C:\Users\Jackie\Desktop\KU Data Analytics Bootcamp\Challenges\SQL-Challenge\data\employees.csv' DELIMITER ',' CSV HEADER;
COPY departments FROM 'C:\Users\Jackie\Desktop\KU Data Analytics Bootcamp\Challenges\SQL-Challenge\data\departments.csv' DELIMITER ',' CSV HEADER;
COPY dept_emp FROM 'C:\Users\Jackie\Desktop\KU Data Analytics Bootcamp\Challenges\SQL-Challenge\data\dept_emp.csv' DELIMITER ',' CSV HEADER;
COPY salaries FROM 'C:\Users\Jackie\Desktop\KU Data Analytics Bootcamp\Challenges\SQL-Challenge\data\salaries.csv' DELIMITER ',' CSV HEADER;
COPY dept_manager FROM 'C:\Users\Jackie\Desktop\KU Data Analytics Bootcamp\Challenges\SQL-Challenge\data\dept_manager.csv' DELIMITER ',' CSV HEADER;

-- Display tables with imported data to confirm accurate creation and import
SELECT *
FROM titles

SELECT *
FROM employees

SELECT *
FROM departments

SELECT *
FROM dept_emp

SELECT *
FROM salaries

SELECT *
FROM dept_manager