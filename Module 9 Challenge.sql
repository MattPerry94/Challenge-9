-- Drop Tables if needed
Drop Table if Exists departments;
Drop Table if Exists dept_emp;
Drop Table if Exists dept_manager;
Drop Table if Exists employees;
Drop Table if Exists salaries;
Drop Table if Exists titles;

-- Module 9 Challenge
Create Table "departments" (
    "dept_no" Varchar   Not NULL,
    "dept_name" Varchar   Not NULL,
    Constraint "pk_departments" Primary Key (
        "dept_no"
     )
);

Create Table "dept_emp" (
    "emp_no" Int   Not NULL,
    "dept_no" Varchar   Not NULL 
	
);

Create Table "dept_manager" (
    "dept_no" Varchar   Not NULL,
    "emp_no" Int   Not NULL
);

Create Table "employees" (
    "emp_no" Int   Not NULL,
	"emp_title_id" Varchar Not NULL,
    "birth_date" Date   Not NULL,
    "first_name" Varchar   Not NULL,
    "last_name" Varchar   Not NULL,
    "sex" Varchar   Not NULL,
    "hire_date" Date   Not NULL,
    Constraint "pk_employees" Primary Key (
        "emp_no"
     )
);

Create Table "salaries" (
    "emp_no" Int   Not NULL,
    "salary" Int   Not NULL
);

Create Table "titles" (
    "emp_no" Varchar   Not NULL,
    "title" Varchar   Not NULL
);


-- Double Check the Tables/Query's
Select * From departments;
Select * From dept_emp;
Select * From dept_manager;
Select * From employees;
Select * From salaries;
Select * From titles;

-- Questions/Data Analysis to Grab --
-- 1. List the employee number, last name, first name, sex, and salary of each employee (2 points)
Select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
From employees
Join salaries
On employees.emp_no = salaries.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
Select first_name, last_name, hire_date 
From employees
Where hire_date between '1986-01-01' and '1986-12-31';

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)
Select employees.last_name, employees.first_name, dept_manager.dept_no, departments.dept_name 
From dept_manager join employees
On dept_manager.emp_no = employees.emp_no
Join departments
On dept_manager.dept_no = departments.dept_no
order by 1;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)
Select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
From dept_emp
Join employees
On dept_emp.emp_no = employees.emp_no
Join departments
On dept_emp.dept_no = departments.dept_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)
Select first_name, last_name
From employees
Where first_name = 'Hercules'
And last_name Like 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name (2 points)
Select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
From dept_emp
Join employees
On dept_emp.emp_no = employees.emp_no
Join departments
On dept_emp.dept_no = departments.dept_no
Where departments.dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)
Select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
From dept_emp
Join employees
On dept_emp.emp_no = employees.emp_no
Join departments
On dept_emp.dept_no = departments.dept_no
Where departments.dept_name = 'Sales' 
Or departments.dept_name = 'Development';

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)
Select last_name,
Count(last_name) As "frequency"
From employees
Group By last_name
Order By
Count(last_name) Desc;


