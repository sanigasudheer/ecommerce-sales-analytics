-- ============================================================
--       ECOMMERCE SALES ANALYTICS
-- ============================================================

CREATE DATABASE ecommerce_db; 
USE ecommerce_db;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50),
    registration_date DATE
);

-- Customers table 
INSERT INTO Customers
(customer_id, customer_name, email, city, registration_date)
VALUES
(101, 'Anu Thomas', 'anu@gmail.com', 'Kochi', '2025-01-15'),
(102, 'Rahul Kumar', 'rahul@gmail.com', 'Thrissur', '2025-02-10'),
(103, 'Meera Nair', 'meera@gmail.com', 'Kozhikode', '2025-02-18'),
(104, 'Arjun Menon', 'arjun@gmail.com', 'Kollam', '2025-03-05'),
(105, 'Sneha Raj', 'sneha@gmail.com', 'Trivandrum', '2025-03-12'),
(106, 'Vishnu Das', 'vishnu@gmail.com', 'Kochi', '2025-03-20'),
(107, 'Devika S', 'devika@gmail.com', 'Kannur', '2025-04-01'),
(108, 'Akhil P', 'akhil@gmail.com', 'Thrissur', '2025-04-15'),
(109, 'Fathima K', 'fathima@gmail.com', 'Malappuram', '2025-05-02'),
(110, 'Nikhil R', 'nikhil@gmail.com', 'Kozhikode', '2025-05-10');
SELECT * FROM Customers;

-- Categories Table
CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) UNIQUE
);
INSERT INTO Categories
(category_id, category_name)
VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home Appliances'),
(4, 'Books'),
(5, 'Beauty');
SELECT * FROM Categories;

-- Product table 
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10,2),
    stock INT,
    FOREIGN KEY (category_id)
    REFERENCES Categories(category_id)
);

INSERT INTO Products
(product_id, product_name, category_id, price, stock)
VALUES
(201, 'Wireless Headphones', 1, 2499.00, 50),
(202, 'Smart Watch', 1, 3999.00, 35),
(203, 'Bluetooth Speaker', 1, 1999.00, 40),
(204, 'Cotton T-Shirt', 2, 799.00, 100),
(205, 'Denim Jeans', 2, 1499.00, 60),
(206, 'Kitchen Mixer', 3, 3499.00, 25),
(207, 'Electric Kettle', 3, 1299.00, 45),
(208, 'Python Programming Book', 4, 899.00, 30),
(209, 'Data Analytics Book', 4, 1099.00, 25),
(210, 'Face Wash', 5, 499.00, 80),
(211, 'Hair Dryer', 5, 1799.00, 40),
(212, 'Laptop Stand', 1, 1599.00, 30);
SELECT * FROM Products;

-- Orders table 
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30),
    
    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id)
);

INSERT INTO Orders
(order_id, customer_id, order_date, order_status)
VALUES
(1001, 101, '2025-06-01', 'Delivered'),
(1002, 102, '2025-06-02', 'Delivered'),
(1003, 103, '2025-06-03', 'Cancelled'),
(1004, 101, '2025-06-05', 'Delivered'),
(1005, 104, '2025-06-07', 'Pending'),
(1006, 105, '2025-06-08', 'Delivered'),
(1007, 106, '2025-06-10', 'Delivered'),
(1008, 107, '2025-06-12', 'Cancelled'),
(1009, 108, '2025-06-15', 'Delivered'),
(1010, 109, '2025-06-18', 'Delivered'),
(1011, 110, '2025-06-20', 'Pending'),
(1012, 103, '2025-06-22', 'Delivered'),
(1013, 104, '2025-06-25', 'Delivered'),
(1014, 105, '2025-06-27', 'Delivered'),
(1015, 101, '2025-06-28', 'Delivered');

-- Order_item Table 
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    
    FOREIGN KEY (order_id)
    REFERENCES Orders(order_id),
    
    FOREIGN KEY (product_id)
    REFERENCES Products(product_id)
);
INSERT INTO Order_Items
(order_item_id, order_id, product_id, quantity)
VALUES
(1, 1001, 201, 1),(2, 1001, 204, 2),(3, 1002, 202, 1),
(4, 1002, 210, 2),(5, 1003, 203, 1),(6, 1004, 205, 1),
(7, 1004, 208, 2),(8, 1005, 206, 1),(9, 1006, 201, 1),
(10, 1006, 207, 1),(11, 1007, 209, 2),(12, 1007, 210, 1),
(13, 1008, 204, 1),(14, 1009, 202, 1),(15, 1009, 212, 1),
(16, 1010, 211, 1),(17, 1010, 210, 2),(18, 1011, 206, 1),
(19, 1012, 201, 1),(20, 1012, 209, 1),(21, 1013, 203, 2),
(22, 1013, 205, 1),(23, 1014, 202, 1),(24, 1014, 204, 2),
(25, 1015, 201, 1),(26, 1015, 212, 2);

-- Payment Table
 
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(30),
    payment_status VARCHAR(30),
    FOREIGN KEY (order_id)
    REFERENCES Orders(order_id)
);
INSERT INTO Payments
(payment_id, order_id, payment_method, payment_status)
VALUES
(501, 1001, 'UPI', 'Paid'),
(502, 1002, 'Credit Card', 'Paid'),
(503, 1003, 'UPI', 'Refunded'),
(504, 1004, 'Debit Card', 'Paid'),
(505, 1005, 'Cash on Delivery', 'Pending'),
(506, 1006, 'UPI', 'Paid'),
(507, 1007, 'Credit Card', 'Paid'),
(508, 1008, 'UPI', 'Refunded'),
(509, 1009, 'Debit Card', 'Paid'),
(510, 1010, 'UPI', 'Paid'),
(511, 1011, 'Cash on Delivery', 'Pending'),
(512, 1012, 'Credit Card', 'Paid'),
(513, 1013, 'UPI', 'Paid'),
(514, 1014, 'Debit Card', 'Paid'),
(515, 1015, 'UPI', 'Paid');
SHOW TABLES;





-- ORDER STATUS ANALYSIS
-- Find the number of orders for each order status.
SELECT 
    order_status,
    COUNT(*) AS order_count
FROM orders
GROUP BY order_status
ORDER BY order_count DESC;


-- PAYMENT METHOD ANALYSIS
-- Find the number of orders made using each payment method.
SELECT 
    p.payment_method,
    COUNT(DISTINCT p.order_id) AS order_count
FROM payments p
GROUP BY p.payment_method
ORDER BY order_count DESC;


-- ORDER STATUS BY PAYMENT METHOD
-- Analyze how different payment methods are distributed across order statuses.
SELECT 
    p.payment_method,
    o.order_status,
    COUNT(DISTINCT o.order_id) AS order_count
FROM payments p
JOIN orders o
    ON p.order_id = o.order_id
GROUP BY p.payment_method, o.order_status
ORDER BY p.payment_method, order_count DESC;


-- CUSTOMER ORDER ANALYSIS
-- Find the number of orders placed by each customer.
SELECT 
    c.customer_name,
    c.city,
    COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name, c.city
ORDER BY order_count DESC;


-- HIGHEST-PRICED PRODUCTS
-- Find the top 5 highest-priced products.
SELECT 
    product_name,
    price
FROM products
ORDER BY price DESC
LIMIT 5;


--  TOTAL REVENUE
-- Calculate the total revenue generated from delivered orders.
SELECT 
    SUM(p.price * oi.quantity) AS total_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered';


--  REVENUE BY PRODUCT
-- Find which products generate the highest revenue.
SELECT 
    p.product_name,
    SUM(p.price * oi.quantity) AS total_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC;


-- TOP 5 BEST-SELLING PRODUCTS
-- Find the products with the highest quantity sold.

SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_quantity
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity DESC
LIMIT 5;


-- REVENUE BY CATEGORY
-- Identify which product categories generate the most revenue.

SELECT 
    c.category_name,
    SUM(p.price * oi.quantity) AS total_revenue
FROM categories c
JOIN products p
    ON c.category_id = p.category_id
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY c.category_id, c.category_name
ORDER BY total_revenue DESC;


-- TOP CUSTOMERS BY SPENDING
-- Find customers who have spent the most.

SELECT 
    c.customer_name,
    c.city,
    SUM(p.price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_id, c.customer_name, c.city
ORDER BY total_spent DESC
LIMIT 5;


-- HIGH-VALUE CUSTOMERS
-- Find customers whose total spending is above ₹5,000.
SELECT 
    c.customer_name,
    SUM(p.price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_id, c.customer_name
HAVING total_spent > 5000
ORDER BY total_spent DESC;


-- PRODUCTS ABOVE AVERAGE PRICE
-- Find products whose price is higher than the average product price.

SELECT 
    product_name,
    price
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
)
ORDER BY price DESC;


-- PRODUCTS NEVER ORDERED
-- Identify products that have never been included in any order.

SELECT 
    p.product_id,
    p.product_name,
    p.price
FROM products p
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;


-- REPEAT CUSTOMERS
-- Find customers who have placed more than one order.

SELECT 
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 1
ORDER BY total_orders DESC;


-- ORDER PERFORMANCE SUMMARY
-- Calculate the percentage of orders in each status.

SELECT 
    order_status,
    COUNT(*) AS order_count,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM orders),
        2
    ) AS percentage
FROM orders
GROUP BY order_status
ORDER BY percentage DESC;