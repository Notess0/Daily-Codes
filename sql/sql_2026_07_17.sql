CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE,
    manager_id INT
);

CREATE TABLE projects (
    id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    budget DECIMAL(12, 2),
    department VARCHAR(50)
);

CREATE TABLE assignments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,
    project_id INT NOT NULL,
    hours_allocated INT,
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (project_id) REFERENCES projects(id)
);

INSERT INTO employees (name, email, department, salary, hire_date) VALUES
('John Smith', 'john.smith@company.com', 'Engineering', 95000, '2020-01-15'),
('Sarah Johnson', 'sarah.johnson@company.com', 'Marketing', 75000, '2019-06-20'),
('Mike Chen', 'mike.chen@company.com', 'Engineering', 105000, '2018-03-10'),
('Emma Wilson', 'emma.wilson@company.com', 'HR', 65000, '2021-02-01');

INSERT INTO projects (project_name, start_date, end_date, budget, department) VALUES
('Mobile App Development', '2024-01-01', '2024-06-30', 250000, 'Engineering'),
('Brand Refresh Campaign', '2024-02-01', '2024-04-30', 80000, 'Marketing'),
('Cloud Migration', '2024-03-01', '2024-09-30', 500000, 'Engineering');

INSERT INTO assignments (employee_id, project_id, hours_allocated) VALUES
(1, 1, 40),
(3, 1, 35),
(2, 2, 30),
(1, 3, 20),
(3, 3, 40);

SELECT e.name, e.department, COUNT(a.id) as project_count, SUM(a.hours_allocated) as total_hours
FROM employees e
LEFT JOIN assignments a ON e.id = a.employee_id
GROUP BY e.id, e.name, e.department;

SELECT p.project_name, p.budget, COUNT(a.id) as employee_count, SUM(a.hours_allocated) as total_allocated_hours
FROM projects p
LEFT JOIN assignments a ON p.id = a.project_id
GROUP BY p.id, p.project_name, p.budget
ORDER BY p.budget DESC;

SELECT e.name, e.salary, p.project_name, a.hours_allocated
FROM employees e
INNER JOIN assignments a ON e.id = a.employee_id
INNER JOIN projects p ON a.project_id = p.id
WHERE a.hours_allocated > 30
ORDER BY e.salary DESC;
