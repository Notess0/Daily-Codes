CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2),
    status VARCHAR(20) DEFAULT 'pending',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_name VARCHAR(100),
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO customers (first_name, last_name, email, phone) VALUES
('John', 'Doe', 'john.doe@email.com', '555-0001'),
('Jane', 'Smith', 'jane.smith@email.com', '555-0002'),
('Bob', 'Johnson', 'bob.johnson@email.com', '555-0003');

INSERT INTO orders (customer_id, total_amount, status) VALUES
(1, 150.00, 'completed'),
(2, 225.50, 'pending'),
(1, 99.99, 'completed');

INSERT INTO order_items (order_id, product_name, quantity, unit_price) VALUES
(1, 'Laptop', 1, 150.00),
(2, 'Mouse', 2, 25.00),
(2, 'Keyboard', 1, 75.50),
(3, 'Monitor', 1, 99.99);

SELECT c.first_name, c.last_name, COUNT(o.order_id) as total_orders, SUM(o.total_amount) as total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC;

SELECT o.order_id, c.first_name, c.last_name, o.order_date, o.total_amount, o.status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.status = 'pending'
ORDER BY o.order_date DESC;

SELECT o.order_id, oi.product_name, oi.quantity, oi.unit_price, (oi.quantity * oi.unit_price) as line_total
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
WHERE o.customer_id = 1;
