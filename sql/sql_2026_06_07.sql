CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    department_id INT,
    salary DECIMAL(10, 2),
    hire_date DATE
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    manager_id INT
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(100) NOT NULL,
    department_id INT,
    start_date DATE,
    end_date DATE,
    budget DECIMAL(15, 2)
);

CREATE TABLE employee_projects (
    assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    project_id INT,
    hours_allocated INT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

INSERT INTO departments (department_name, manager_id) VALUES ('Engineering', NULL), ('Sales', NULL), ('HR', NULL);

INSERT INTO employees (first_name, last_name, email, department_id, salary, hire_date) VALUES 
('John', 'Smith', 'john.smith@company.com', 1, 85000, '2020-01-15'),
('Sarah', 'Johnson', 'sarah.johnson@company.com', 2, 75000, '2019-05-20'),
('Michael', 'Brown', 'michael.brown@company.com', 1, 95000, '2018-03-10');

INSERT INTO projects (project_name, department_id, start_date, end_date, budget) VALUES 
('Website Redesign', 1, '2024-01-01', '2024-06-30', 50000),
('Mobile App', 1, '2024-02-15', '2024-12-31', 120000),
('Sales Training', 2, '2024-03-01', '2024-04-30', 15000);

SELECT e.first_name, e.last_name, d.department_name, e.salary FROM employees e JOIN departments d ON e.department_id = d.department_id ORDER BY e.salary DESC;

SELECT p.project_name, COUNT(ep.employee_id) as team_size, SUM(ep.hours_allocated) as total_hours FROM projects p LEFT JOIN employee_projects ep ON p.project_id = ep.project_id GROUP BY p.project_id;

SELECT d.department_name, AVG(e.salary) as avg_salary, COUNT(e.employee_id) as employee_count FROM employees e JOIN departments d ON e.department_id = d.department_id GROUP BY d.department_id;

SELECT e.first_name, e.last_name, COUNT(ep.project_id) as projects_assigned FROM employees e LEFT JOIN employee_projects ep ON e.employee_id = ep.employee_id GROUP BY e.employee_id HAVING COUNT(ep.project_id) > 0;
