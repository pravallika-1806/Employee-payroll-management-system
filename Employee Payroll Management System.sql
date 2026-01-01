CREATE DATABASE Employee;
use Employee

create table employee(
emp_id int primary key,
emp_name varchar(100),
department_id int ,
department_name varchar(50),
join_date date
);

create table department(
department_id int primary key,
department_name varchar(50)
);

create table salary(
emp_id int,
basic_salary decimal(10,2),
hra decimal(10,2),
da decimal(10,2),
deductions decimal(10,2),
FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);

INSERT INTO department(department_id, department_name) VALUES
(1, 'HR'),
(2, 'Software Engineer'),
(3, 'Accountant'),
(4, 'Marketing Analyst'),
(5, 'Sales'),
(6, 'Operations'),
(7, 'IT Support'),
(8, 'Administration'),
(9, 'Research'),
(10, 'Quality Assurance');


INSERT INTO employee (emp_id, emp_name, department_id, department_name, join_date) VALUES
(101, 'Sai', 2, 'Software Engineer', '2022-01-10'),
(102, 'Chinnu', 2, 'Senior Engineer', '2021-03-15'),
(103, 'Venkata', 1, 'HR', '2023-06-01'),
(104, 'Abhi', 3, 'Accountant', '2020-08-20'),
(105, 'kittu', 4, 'Marketing Analyst', '2022-11-05'),
(106, 'Pravallika', 5, 'Sales', '2021-09-12'),
(107, 'Sai', 6, 'Operations', '2019-05-25'),
(108, 'abi', 7, 'IT Support', '2023-02-18'),
(109, 'Lakshmi', 8, 'Administration', '2020-12-30'),
(110, 'anji', 9, 'Research', '2018-07-14'),
(111, 'lucky', 4, 'Marketing Analyst', '2022-11-05'),
(112, 'Pravalli', 5, 'Sales', '2021-09-12');


INSERT INTO salary(emp_id, basic_salary, hra, da, deductions) VALUES
(101, 50000, 5000, 3000, 3000),
(102, 65000, 6500, 4000, 4000),
(103, 42000, 4200, 2500, 2000),
(104, 55000, 5500, 3500, 3500),
(105, 48000, 4800, 2800, 2500),
(106, 46000, 4600, 2700, 2200),
(107, 70000, 7000, 4500, 5000),
(108, 40000, 4000, 2400, 1800),
(109, 38000, 3800, 2200, 1500),
(110, 75000, 7500, 5000, 6000),
(111, 55000, 5500, 3500, 3500),
(112, 48000, 4800, 2800, 2500);

select * from employee;
select * from department;
select * from salary;

#Verify Relationships (JOIN Check)
SELECT e.emp_id, e.emp_name, d.department_name
FROM employee e
JOIN department d
ON e.department_id = d.department_id;

#Core Payroll Calculations (Must-Do)
#Gross Salary
SELECT emp_id,
       basic_salary + hra + da AS gross_salary
FROM salary;

#Net Salary
SELECT emp_id,
       basic_salary + hra + da - deductions AS net_salary
FROM salary;



#Complete Payroll Report
SELECT e.emp_id, e.emp_name, d.department_name,
       s.basic_salary, s.hra, s.da, s.deductions,
       (s.basic_salary + s.hra + s.da - s.deductions) AS net_salary
FROM employee e
JOIN department d ON e.department_id = d.department_id
JOIN salary s ON e.emp_id = s.emp_id;



#Business Analysis Queries
#Department-wise Average Salary
SELECT d.department_name,
       AVG(s.basic_salary) AS avg_salary
FROM employee e
JOIN department d ON e.department_id = d.department_id
JOIN salary s ON e.emp_id = s.emp_id
GROUP BY d.department_name;



#Highest Paid Employee
SELECT e.emp_name, s.basic_salary
FROM employee e
JOIN salary s ON e.emp_id = s.emp_id
ORDER BY s.basic_salary DESC
LIMIT 1;

#Data Modification Scenarios (Very Important)
#Salary Hike for Engineering Department
UPDATE salary
SET basic_salary = basic_salary * 1.10
WHERE emp_id IN (
    SELECT emp_id
    FROM employee
    WHERE department_id = 2
);


#Use CASE Statements
# Salary Category
SELECT e.emp_name, s.basic_salary,
       CASE
           WHEN s.basic_salary >= 70000 THEN 'High'
           WHEN s.basic_salary >= 50000 THEN 'Medium'
           ELSE 'Low'
       END AS salary_level
FROM employee e
JOIN salary s ON e.emp_id = s.emp_id;









