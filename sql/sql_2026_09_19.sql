CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    hire_date DATE NOT NULL,
    department_id INT,
    salary DECIMAL(10, 2)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    budget DECIMAL(12, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO departments (department_name, location) VALUES
('IT', 'New York'),
('HR', 'Boston'),
('Sales', 'Chicago');

INSERT INTO employees (first_name, last_name, email, hire_date, department_id, salary) VALUES
('John', 'Doe', 'john.doe@company.com', '2020-01-15', 1, 85000),
('Jane', 'Smith', 'jane.smith@company.com', '2019-06-20', 2, 65000),
('Michael', 'Johnson', 'michael.j@company.com', '2021-03-10', 1, 75000);

INSERT INTO projects (project_name, start_date, end_date, budget, department_id) VALUES
('Website Redesign', '2024-01-01', '2024-06-30', 50000, 1),
('Training Program', '2024-02-15', '2024-05-15', 25000, 2);

SELECT e.first_name, e.last_name, d.department_name, e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
ORDER BY e.salary DESC;

SELECT d.department_name, COUNT(e.employee_id) as employee_count, AVG(e.salary) as avg_salary
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

SELECT p.project_name, d.department_name, p.budget
FROM projects p
JOIN departments d ON p.department_id = d.department_id
WHERE p.end_date > CURDATE();
