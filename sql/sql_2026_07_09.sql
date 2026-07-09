CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (first_name, last_name, email, phone) VALUES 
('John', 'Doe', 'john@example.com', '555-1234'),
('Jane', 'Smith', 'jane@example.com', '555-5678');

INSERT INTO products (product_name, category, price, stock_quantity) VALUES 
('Laptop', 'Electronics', 999.99, 50),
('Mouse', 'Electronics', 25.50, 200);

INSERT INTO orders (customer_id, total_amount) VALUES (1, 1025.49), (2, 25.50);

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
(1, 1, 1, 999.99), (1, 2, 1, 25.50), (2, 2, 1, 25.50);

SELECT c.first_name, c.last_name, COUNT(o.order_id) as total_orders, SUM(o.total_amount) as total_spent 
FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.first_name, c.last_name;

SELECT p.product_name, SUM(oi.quantity) as total_sold, SUM(oi.quantity * oi.unit_price) as revenue 
FROM products p JOIN order_items oi ON p.product_id = oi.product_id 
GROUP BY p.product_id, p.product_name 
ORDER BY revenue DESC;
