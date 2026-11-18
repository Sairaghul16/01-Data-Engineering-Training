USE inventory_db;

SELECT p.sku, p.product_name, c.category_name, s.supplier_name, p.unit_price
FROM products p
JOIN categories c ON c.category_id = p.category_id
JOIN suppliers  s ON s.supplier_id = p.supplier_id
ORDER BY c.category_name, p.product_name;

SELECT p.sku, p.product_name, SUM(st.quantity) AS total_qty
FROM products p
JOIN stock st ON st.product_id = p.product_id
GROUP BY p.product_id, p.sku, p.product_name
ORDER BY total_qty DESC;

SELECT w.warehouse_name, p.product_name, st.quantity
FROM stock st
JOIN warehouses w ON w.warehouse_id = st.warehouse_id
JOIN products   p ON p.product_id   = st.product_id
ORDER BY w.warehouse_name, p.product_name;

SELECT p.sku, p.product_name, p.reorder_level, SUM(st.quantity) AS total_qty
FROM products p
JOIN stock st ON st.product_id = p.product_id
GROUP BY p.product_id, p.sku, p.product_name, p.reorder_level
HAVING total_qty <= p.reorder_level * 2
ORDER BY total_qty;

SELECT w.warehouse_name, SUM(st.quantity * p.unit_price) AS inventory_value
FROM stock st
JOIN warehouses w ON w.warehouse_id = st.warehouse_id
JOIN products   p ON p.product_id   = st.product_id
GROUP BY w.warehouse_id, w.warehouse_name
ORDER BY inventory_value DESC;

SELECT so.so_id, c.customer_name, so.order_date, so.status,
       SUM(i.quantity * i.unit_price) AS order_total
FROM sales_orders so
JOIN customers c        ON c.customer_id = so.customer_id
JOIN sales_order_items i ON i.so_id = so.so_id
WHERE so.status <> 'CANCELLED'
GROUP BY so.so_id, c.customer_name, so.order_date, so.status
ORDER BY so.order_date;

SELECT DATE_FORMAT(so.order_date, '%Y-%m') AS month,
       SUM(i.quantity * i.unit_price)      AS revenue
FROM sales_orders so
JOIN sales_order_items i ON i.so_id = so.so_id
WHERE so.status <> 'CANCELLED'
GROUP BY month
ORDER BY month;

SELECT p.product_name, SUM(i.quantity) AS units_sold
FROM sales_order_items i
JOIN sales_orders so ON so.so_id = i.so_id AND so.status <> 'CANCELLED'
JOIN products p      ON p.product_id = i.product_id
GROUP BY p.product_id, p.product_name
ORDER BY units_sold DESC
LIMIT 5;

SELECT c.customer_name, SUM(i.quantity * i.unit_price) AS total_spent
FROM customers c
JOIN sales_orders so     ON so.customer_id = c.customer_id AND so.status <> 'CANCELLED'
JOIN sales_order_items i ON i.so_id = so.so_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC;

SELECT p.sku, p.product_name
FROM products p
LEFT JOIN sales_order_items i ON i.product_id = p.product_id
WHERE i.so_item_id IS NULL;

SELECT p.product_name,
       p.unit_price,
       ROUND(AVG(poi.unit_cost), 2)                                  AS avg_cost,
       ROUND((p.unit_price - AVG(poi.unit_cost)) / p.unit_price * 100, 1) AS margin_pct
FROM products p
JOIN purchase_order_items poi ON poi.product_id = p.product_id
GROUP BY p.product_id, p.product_name, p.unit_price
ORDER BY margin_pct DESC;

SELECT po.po_id, s.supplier_name, po.order_date,
       SUM(poi.quantity * poi.unit_cost) AS po_value
FROM purchase_orders po
JOIN suppliers s            ON s.supplier_id = po.supplier_id
JOIN purchase_order_items poi ON poi.po_id = po.po_id
WHERE po.status = 'PENDING'
GROUP BY po.po_id, s.supplier_name, po.order_date;

SELECT category_name, revenue,
       RANK() OVER (ORDER BY revenue DESC) AS revenue_rank
FROM (
    SELECT c.category_name, SUM(i.quantity * i.unit_price) AS revenue
    FROM sales_order_items i
    JOIN sales_orders so ON so.so_id = i.so_id AND so.status <> 'CANCELLED'
    JOIN products p      ON p.product_id = i.product_id
    JOIN categories c    ON c.category_id = p.category_id
    GROUP BY c.category_id, c.category_name
) t;

SELECT order_date, daily_sales,
       SUM(daily_sales) OVER (ORDER BY order_date) AS running_total
FROM (
    SELECT so.order_date, SUM(i.quantity * i.unit_price) AS daily_sales
    FROM sales_orders so
    JOIN sales_order_items i ON i.so_id = so.so_id
    WHERE so.status <> 'CANCELLED'
    GROUP BY so.order_date
) d;

SELECT s.supplier_name, COUNT(*) AS product_count
FROM suppliers s
JOIN products p ON p.supplier_id = s.supplier_id
GROUP BY s.supplier_id, s.supplier_name
HAVING COUNT(*) > 2;
