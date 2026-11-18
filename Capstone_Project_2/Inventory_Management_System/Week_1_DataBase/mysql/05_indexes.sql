USE inventory_db;

CREATE INDEX idx_products_category ON products(category_id);
CREATE INDEX idx_products_supplier ON products(supplier_id);

CREATE INDEX idx_products_name ON products(product_name);

CREATE INDEX idx_so_date ON sales_orders(order_date);
CREATE INDEX idx_po_date ON purchase_orders(order_date);

CREATE INDEX idx_so_status_date ON sales_orders(status, order_date);

CREATE INDEX idx_soi_order_product ON sales_order_items(so_id, product_id);
CREATE INDEX idx_poi_order_product ON purchase_order_items(po_id, product_id);

CREATE INDEX idx_mv_product ON stock_movements(product_id, moved_at);
CREATE INDEX idx_mv_reference ON stock_movements(reference);

CREATE INDEX idx_customers_city ON customers(city);

SHOW INDEX FROM products;
SHOW INDEX FROM sales_orders;

EXPLAIN SELECT * FROM sales_orders
WHERE order_date BETWEEN '2026-10-01' AND '2026-10-31';

EXPLAIN SELECT * FROM sales_orders
WHERE status = 'DELIVERED' AND order_date >= '2026-10-01';

EXPLAIN SELECT sku, product_name FROM products
WHERE product_name LIKE 'Wireless%';

EXPLAIN SELECT p.product_name, SUM(i.quantity)
FROM sales_order_items i
JOIN products p ON p.product_id = i.product_id
GROUP BY p.product_id, p.product_name;

EXPLAIN SELECT sku FROM products WHERE product_name LIKE '%Mouse';
