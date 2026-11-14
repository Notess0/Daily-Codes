CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    department_id INT,
    salary DECIMAL(10, 2),
    hire_date DATE,
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    manager_id INT
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(150) NOT NULL,
    department_id INT,
    start_date DATE,
    end_date DATE,
    budget DECIMAL(12, 2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO departments (department_name, location) VALUES
('Engineering', 'Building A'),
('Sales', 'Building B'),
('Human Resources', 'Building C');

INSERT INTO employees (first_name, last_name, email, department_id, salary, hire_date) VALUES
('John', 'Smith', 'john.smith@company.com', 1, 85000, '2020-01-15'),
('Sarah', 'Johnson', 'sarah.johnson@company.com', 2, 75000, '2021-03-20'),
('Michael', 'Brown', 'michael.brown@company.com', 1, 95000, '2019-06-10'),
('Emily', 'Davis', 'emily.davis@company.com', 3, 65000, '2022-02-01');

INSERT INTO projects (project_name, department_id, start_date, budget) VALUES
('Website Redesign', 1, '2024-01-01', 50000),
('Mobile App Development', 1, '2024-02-15', 120000),
('Q1 Sales Campaign', 2, '2024-01-10', 30000);

SELECT e.first_name, e.last_name, d.department_name, e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary > 75000
ORDER BY e.salary DESC;

SELECT d.department_name, COUNT(e.employee_id) as employee_count, AVG(e.salary) as avg_salary
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) > 0;

SELECT p.project_name, d.department_name, p.budget, p.start_date
FROM projects p
JOIN departments d ON p.department_id = d.department_id
WHERE p.budget > 40000
ORDER BY p.budget DESC;

SELECT first_name, last_name, salary,
CASE 
    WHEN salary >= 90000 THEN 'Senior'
    WHEN salary >= 75000 THEN 'Mid-Level'
    ELSE 'Junior'
END as salary_grade
FROM employees
WHERE is_active = TRUE;
