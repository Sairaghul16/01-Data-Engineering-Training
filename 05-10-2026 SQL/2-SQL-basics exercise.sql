-- 1. Create database
CREATE DATABASE shop_db;

USE shop_db;


-- 2 & 3. Create products table and make ProductID primary key
CREATE TABLE products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    StockQuantity INT
);


-- 4. Insert at least 6 products from different categories
INSERT INTO products
(ProductID, ProductName, Category, Price, StockQuantity)
VALUES
(1, 'Laptop', 'Electronics', 55000.00, 15),
(2, 'Smartphone', 'Electronics', 25000.00, 8),
(3, 'Office Chair', 'Furniture', 4500.00, 12),
(4, 'Running Shoes', 'Footwear', 3000.00, 20),
(5, 'Backpack', 'Accessories', 1200.00, 7),
(6, 'Wrist Watch', 'Accessories', 3500.00, 4);


-- 5. Display all products
SELECT * FROM products;


-- 6. Display only Product Name and Price
SELECT ProductName, Price
FROM products;


-- 7. Insert a new product named Wireless Mouse
INSERT INTO products
(ProductID, ProductName, Category, Price, StockQuantity)
VALUES
(7, 'Wireless Mouse', 'Electronics', 800.00, 25);


-- 8. Change the price of one product using Product ID
UPDATE products
SET Price = 58000.00
WHERE ProductID = 1;


-- 9. Increase the price of all Electronics products by 10%
UPDATE products
SET Price = Price * 1.10
WHERE Category = 'Electronics';


-- 10. Reduce stock quantity of one product after a sale
UPDATE products
SET StockQuantity = StockQuantity - 2
WHERE ProductID = 7;


-- 11. Change the category of one product
UPDATE products
SET Category = 'Electronics'
WHERE ProductID = 5;


-- 12. Display products costing more than 1000
SELECT *
FROM products
WHERE Price > 1000;


-- 13. Display products whose stock quantity is less than 10
SELECT *
FROM products
WHERE StockQuantity < 10;


-- 14. Display only Electronics products
SELECT *
FROM products
WHERE Category = 'Electronics';


-- 15. Sort products from highest price to lowest price
SELECT *
FROM products
ORDER BY Price DESC;


-- 16. Delete one product using Product ID
DELETE FROM products
WHERE ProductID = 6;


-- 17. Delete products whose stock quantity is less than 5
DELETE FROM products
WHERE StockQuantity < 5;


-- 18. Display all remaining products
SELECT * FROM products;
