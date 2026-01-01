# Employee-payroll-management-system

## 📌 Project Description
This project is an Employee Payroll Management System developed using MySQL.
It manages employee details, salary components, and generates payroll reports.

## 🛠️ Technologies Used
- MySQL
- SQL

## 📊 Database Tables
- Departments
- Employees
- Salaries

## 🔑 Features
- Salary calculation (Gross & Net)
- Department-wise salary reports

## ▶️ How to Run
1. Execute `01_create_database.sql`
2. Execute `02_create_tables.sql`
3. Execute `03_insert_sample_data.sql`
4. Execute remaining SQL files in order

## 🧪 Sample Queries
SELECT e.emp_name, d.department_name,
      (s.basic_salary + s.hra + s.da - s.deductions) AS net_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN salaries s ON e.emp_id = s.emp_id;

## 👤 Author
Pravallika
