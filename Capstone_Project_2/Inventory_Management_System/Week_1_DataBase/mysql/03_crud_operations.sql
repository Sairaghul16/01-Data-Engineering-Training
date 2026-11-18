USE inventory_db;

INSERT INTO categories (category_name, description)
VALUES ('Sports', 'Sports and fitness equipment');

INSERT INTO suppliers (supplier_name, contact_name, phone, email, city)
VALUES ('FitGear India', 'Vikram Rao', '9840055555', 'vikram@fitgear.com', 'Pune');

INSERT INTO products (sku, product_name, category_id, supplier_id, unit_price, reorder_level)
VALUES ('SPO-6001', 'Yoga Mat 6mm',
        (SELECT category_id FROM categories WHERE category_name = 'Sports'),
        (SELECT supplier_id FROM suppliers WHERE supplier_name = 'FitGear India'),
        899.00, 20);

INSERT INTO stock (product_id, warehouse_id, quantity)
VALUES ((SELECT product_id FROM products WHERE sku = 'SPO-6001'), 1, 75);

INSERT INTO customers (customer_name, email, phone, city)
VALUES ('Greenleaf Mart', 'hello@greenleaf.com', '9900066666', 'Pune');

INSERT INTO sales_orders (customer_id, warehouse_id, order_date, status)
VALUES ((SELECT customer_id FROM customers WHERE customer_name = 'Greenleaf Mart'),
        1, '2026-11-15', 'PENDING');

SET @new_so = LAST_INSERT_ID();

INSERT INTO sales_order_items (so_id, product_id, quantity, unit_price)
VALUES (@new_so, (SELECT product_id FROM products WHERE sku = 'SPO-6001'), 10, 899.00),
       (@new_so, (SELECT product_id FROM products WHERE sku = 'STA-3001'), 20, 320.00);

SELECT product_id, sku, product_name, unit_price
FROM products
WHERE is_active = TRUE
ORDER BY unit_price;

SELECT sku, product_name, unit_price
FROM products
WHERE product_name LIKE '%Chair%' OR product_name LIKE '%Desk%';

SELECT sku, product_name, unit_price
FROM products
WHERE unit_price BETWEEN 500 AND 3000
ORDER BY unit_price DESC;

SELECT w.warehouse_name, st.quantity
FROM stock st
JOIN warehouses w ON w.warehouse_id = st.warehouse_id
WHERE st.product_id = (SELECT product_id FROM products WHERE sku = 'ELE-1001');

SELECT so_id, customer_id, order_date, status
FROM sales_orders
WHERE order_date BETWEEN '2026-10-01' AND '2026-10-31'
ORDER BY order_date;

SELECT c.city, c.customer_name, COUNT(so.so_id) AS orders_placed
FROM customers c
LEFT JOIN sales_orders so ON so.customer_id = c.customer_id
GROUP BY c.customer_id, c.city, c.customer_name
ORDER BY c.city, orders_placed DESC;

UPDATE products SET unit_price = 649.00 WHERE sku = 'ELE-1001';

UPDATE products p
JOIN categories c ON c.category_id = p.category_id
SET p.unit_price = ROUND(p.unit_price * 1.05, 2)
WHERE c.category_name = 'Stationery';

UPDATE suppliers
SET phone = '9840099999', city = 'Coimbatore'
WHERE supplier_name = 'TechSource Pvt Ltd';

UPDATE products SET reorder_level = reorder_level + 10
WHERE sku IN ('STA-3001', 'STA-3002');

UPDATE sales_orders SET status = 'DELIVERED' WHERE so_id = 3;

UPDATE stock SET quantity = quantity - 2
WHERE product_id = (SELECT product_id FROM products WHERE sku = 'ELE-1003')
  AND warehouse_id = 1;

UPDATE products SET is_active = FALSE WHERE sku = 'APP-4002';

DELETE FROM purchase_orders WHERE status = 'CANCELLED';

DELETE FROM sales_orders WHERE status = 'CANCELLED';

DELETE FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM sales_orders);

DELETE FROM stock WHERE quantity = 0;

START TRANSACTION;

UPDATE stock SET quantity = quantity - 10
WHERE product_id = (SELECT product_id FROM products WHERE sku = 'ELE-1001') AND warehouse_id = 1;

UPDATE stock SET quantity = quantity + 10
WHERE product_id = (SELECT product_id FROM products WHERE sku = 'ELE-1001') AND warehouse_id = 3;

COMMIT;
