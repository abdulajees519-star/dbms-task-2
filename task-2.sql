-- Task 2 – Product & Category Management
-- Database: ProductManagement

CREATE DATABASE ProductManagement;
USE ProductManagement;

-- 1. Create Category Table
CREATE TABLE Category (
    Category_ID INT PRIMARY KEY,
    Category_Name VARCHAR(50) NOT NULL UNIQUE,
    Description VARCHAR(200)
);

-- 2. Create Product Table
CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL UNIQUE,
    Category_ID INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price > 0),
    Stock_Quantity INT NOT NULL CHECK (Stock_Quantity >= 0),
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)
);

-- 3. Insert Category Data
INSERT INTO Category VALUES
(1, 'Electronics', 'Electronic devices and accessories'),
(2, 'Clothing', 'Men and women clothing'),
(3, 'Books', 'Educational and general books'),
(4, 'Home Appliances', 'Appliances for home use'),
(5, 'Sports', 'Sports equipment and accessories');

-- 4. Insert Product Data
INSERT INTO Product VALUES
(101, 'Laptop', 1, 55000.00, 20),
(102, 'Smartphone', 1, 25000.00, 35),
(103, 'Headphones', 1, 2500.00, 50),
(104, 'Smart Watch', 1, 5000.00, 25),
(105, 'T-Shirt', 2, 800.00, 60),
(106, 'Jeans', 2, 1800.00, 40),
(107, 'Jacket', 2, 2500.00, 15),
(108, 'Python Programming', 3, 900.00, 30),
(109, 'Database Systems', 3, 1200.00, 25),
(110, 'Mixer Grinder', 4, 3500.00, 18),
(111, 'Microwave Oven', 4, 8500.00, 10),
(112, 'Cricket Bat', 5, 4500.00, 12),
(113, 'Football', 5, 1200.00, 30);

-- 5. CRUD Operations

-- INSERT
INSERT INTO Product
VALUES (114, 'Keyboard', 1, 1500.00, 20);

-- SELECT
SELECT * FROM Product;

-- UPDATE
UPDATE Product
SET Price = 1600.00
WHERE Product_ID = 114;

-- DELETE
DELETE FROM Product
WHERE Product_ID = 114;

-- 6. Category-wise Analysis Queries

-- Display products category-wise
SELECT
    c.Category_Name,
    p.Product_Name,
    p.Price,
    p.Stock_Quantity
FROM Category c
JOIN Product p
    ON c.Category_ID = p.Category_ID
ORDER BY c.Category_Name, p.Product_Name;

-- Count products in each category
SELECT
    c.Category_Name,
    COUNT(p.Product_ID) AS Product_Count
FROM Category c
LEFT JOIN Product p
    ON c.Category_ID = p.Category_ID
GROUP BY c.Category_ID, c.Category_Name
ORDER BY c.Category_ID;
SELECT *
FROM Product
WHERE Price = (SELECT MAX(Price) FROM Product);

SELECT
    c.Category_Name,
    COUNT(p.Product_ID) AS Product_Count
FROM Category c
JOIN Product p
    ON c.Category_ID = p.Category_ID
GROUP BY c.Category_ID, c.Category_Name
HAVING COUNT(p.Product_ID) > 5;
SELECT AVG(Price) AS Average_Product_Price
FROM Product;
