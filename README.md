# SQL Challenge - Pewlett Hackard Data Analysis

## Background
Welcome to Pewlett Hackard, a fictional company! As a newly hired data engineer, your primary task is to conduct a research project focusing on the employees hired during the 1980s and 1990s. The available data for this project is stored in six CSV files.

## Getting Started
1. **Create Repository:** Start by creating a new repository named `sql-challenge`. Do not add this assignment to an existing repository.

2. **Clone Repository:** Clone the newly created repository to your local machine.

3. **Directory Setup:** Inside your local Git repository, create a directory for this challenge. Use a folder name corresponding to the challenge, such as `EmployeeSQL`.

4. **Download Files:** Download the required files .

## Challenge Overview
This challenge is divided into three parts: data modeling, data engineering, and data analysis.

### Data Modeling
- Inspect the CSV files and create an Entity Relationship Diagram (ERD) using a tool like QuickDBD.
- Provide table schemas for all tables based on the ERD.

### Data Engineering
- Create table schemas for each CSV file, specifying data types, primary keys, foreign keys, and constraints.
- Import each CSV file into its corresponding SQL table.

### Data Analysis
1. **List Employee Information:**
   - Employee number, last name, first name, sex, and salary of each employee.

2. **Employees Hired in 1986:**
   - First name, last name, and hire date for employees hired in 1986.

3. **Department Managers:**
   - Manager details for each department, including department number, department name, employee number, last name, and first name.

4. **Employee Department Information:**
   - Department number for each employee, along with employee number, last name, first name, and department name.

5. **Specific Employee Details:**
   - First name, last name, and sex of employees named Hercules with a last name starting with the letter B.

6. **Employees in the Sales Department:**
   - Employee number, last name, and first name for each employee in the Sales department.

7. **Employees in Sales and Development:**
   - Employee number, last name, first name, and department name for employees in Sales and Development.

8. **Employee Last Name Frequency:**
   - Frequency counts, in descending order, of all employee last names.

## Requirements and Scoring

### Data Modeling (10 points)
- Include an Entity Relationship Diagram or provide table schemas for all tables (10 points).

### Data Engineering (70 points)
- Define all required columns for each table (10 points).
- Set columns to the correct data type (10 points).
- Establish primary keys for each table (10 points).
- Ensure correct referencing of related tables (10 points).
- Establish correct relationships using Foreign Keys (10 points).
- Use the NOT NULL condition correctly on necessary columns (10 points).
- Accurately define value length for columns (10 points).

### Data Analysis (20 points)
- Fulfill all data analysis requirements (2 points each).
- List employee number, last name, first name, sex, and salary.
- List employees hired in 1986.
- List department managers.
- List employee department information.
- List specific employee details.
- List employees in the Sales department.
- List employees in Sales and Development.
- List employee last name frequency.
