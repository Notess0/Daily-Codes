CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10, 2),
    department_id INT,
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    budget DECIMAL(12, 2)
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

INSERT INTO departments (department_name, location, budget) VALUES
('Engineering', 'New York', 500000),
('Sales', 'Los Angeles', 300000),
('HR', 'Chicago', 150000);

INSERT INTO employees (first_name, last_name, email, salary, department_id, hire_date) VALUES
('John', 'Smith', 'john.smith@company.com', 85000, 1, '2020-01-15'),
('Sarah', 'Johnson', 'sarah.johnson@company.com', 75000, 2, '2019-06-20'),
('Mike', 'Davis', 'mike.davis@company.com', 65000, 1, '2021-03-10');

SELECT e.first_name, e.last_name, e.salary, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
ORDER BY e.salary DESC;

SELECT d.department_name, COUNT(e.employee_id) as employee_count, AVG(e.salary) as avg_salary
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) > 0;

SELECT * FROM employees WHERE salary > 70000 AND department_id = 1;

UPDATE employees SET salary = salary * 1.05 WHERE department_id = 1;

DELETE FROM employees WHERE employee_id = 3;
