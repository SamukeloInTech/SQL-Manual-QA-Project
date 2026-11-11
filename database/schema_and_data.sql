CREATE DATABASE qa_shop;
USE qa_shop;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(150) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    stock INT NOT NULL DEFAULT 0 CHECK (stock >= 0),
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    status ENUM('pending', 'paid', 'shipped', 'cancelled') DEFAULT 'pending',
    total_price DECIMAL(10,2) NOT NULL CHECK (total_price >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10,2) NOT NULL CHECK (unit_price > 0),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO users (email, full_name, is_active) VALUES 
('alice@example.com', 'Alice Johnson', TRUE),
('bob@example.com', 'Bob Smith', TRUE),
('carol@example.com', 'Carol White', FALSE);

INSERT INTO products (name, price, stock) VALUES 
('Laptop', 999.99, 10),
('Mouse', 19.99, 0),
('Keyboard', 49.99, 25);

INSERT INTO orders (user_id, status, total_price) VALUES 
(1, 'paid', 999.99),
(1, 'pending', 19.99),
(2, 'cancelled', 49.99);

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
(1, 1, 1, 999.99),
(2, 2, 1, 19.99),
(3, 3, 1, 49.99);
