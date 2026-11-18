USE inventory_db;

CREATE OR REPLACE VIEW v_stock_summary AS
SELECT p.product_id, p.sku, p.product_name, p.reorder_level,
       COALESCE(SUM(st.quantity), 0) AS total_qty,
       CASE WHEN COALESCE(SUM(st.quantity),0) <= p.reorder_level
            THEN 'REORDER' ELSE 'OK' END AS stock_status
FROM products p
LEFT JOIN stock st ON st.product_id = p.product_id
GROUP BY p.product_id, p.sku, p.product_name, p.reorder_level;

CREATE OR REPLACE VIEW v_sales_detail AS
SELECT so.so_id, so.order_date, so.status, c.customer_name,
       p.product_name, i.quantity, i.unit_price,
       i.quantity * i.unit_price AS line_total
FROM sales_orders so
JOIN customers c         ON c.customer_id = so.customer_id
JOIN sales_order_items i ON i.so_id = so.so_id
JOIN products p          ON p.product_id = i.product_id;

DELIMITER //

CREATE PROCEDURE sp_receive_purchase_order(IN p_po_id INT)
BEGIN
    DECLARE v_wh INT;
    DECLARE v_status VARCHAR(20);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SELECT warehouse_id, status INTO v_wh, v_status
    FROM purchase_orders WHERE po_id = p_po_id;

    IF v_status <> 'PENDING' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Only PENDING purchase orders can be received';
    END IF;

    START TRANSACTION;

    INSERT INTO stock (product_id, warehouse_id, quantity)
    SELECT product_id, v_wh, quantity
    FROM purchase_order_items WHERE po_id = p_po_id
    ON DUPLICATE KEY UPDATE quantity = stock.quantity + VALUES(quantity);

    INSERT INTO stock_movements (product_id, warehouse_id, movement_type, quantity, reference)
    SELECT product_id, v_wh, 'IN', quantity, CONCAT('PO-', p_po_id)
    FROM purchase_order_items WHERE po_id = p_po_id;

    UPDATE purchase_orders SET status = 'RECEIVED' WHERE po_id = p_po_id;

    COMMIT;
END //

CREATE PROCEDURE sp_ship_sales_order(IN p_so_id INT)
BEGIN
    DECLARE v_wh INT;
    DECLARE v_status VARCHAR(20);
    DECLARE v_short INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SELECT warehouse_id, status INTO v_wh, v_status
    FROM sales_orders WHERE so_id = p_so_id;

    IF v_status <> 'PENDING' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Only PENDING sales orders can be shipped';
    END IF;

    SELECT COUNT(*) INTO v_short
    FROM sales_order_items i
    LEFT JOIN stock st ON st.product_id = i.product_id AND st.warehouse_id = v_wh
    WHERE i.so_id = p_so_id AND COALESCE(st.quantity, 0) < i.quantity;

    IF v_short > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient stock for one or more items';
    END IF;

    START TRANSACTION;

    UPDATE stock st
    JOIN sales_order_items i ON i.product_id = st.product_id
    SET st.quantity = st.quantity - i.quantity
    WHERE i.so_id = p_so_id AND st.warehouse_id = v_wh;

    INSERT INTO stock_movements (product_id, warehouse_id, movement_type, quantity, reference)
    SELECT product_id, v_wh, 'OUT', quantity, CONCAT('SO-', p_so_id)
    FROM sales_order_items WHERE so_id = p_so_id;

    UPDATE sales_orders SET status = 'SHIPPED' WHERE so_id = p_so_id;

    COMMIT;
END //

CREATE PROCEDURE sp_monthly_sales(IN p_year INT, IN p_month INT)
BEGIN
    SELECT p.product_name, SUM(i.quantity) AS units, SUM(i.quantity * i.unit_price) AS revenue
    FROM sales_orders so
    JOIN sales_order_items i ON i.so_id = so.so_id
    JOIN products p          ON p.product_id = i.product_id
    WHERE YEAR(so.order_date) = p_year AND MONTH(so.order_date) = p_month
      AND so.status <> 'CANCELLED'
    GROUP BY p.product_id, p.product_name
    ORDER BY revenue DESC;
END //

CREATE TRIGGER trg_stock_after_update
AFTER UPDATE ON stock
FOR EACH ROW
BEGIN
    IF NEW.quantity <> OLD.quantity AND @skip_audit IS NULL THEN
        INSERT INTO stock_movements (product_id, warehouse_id, movement_type, quantity, reference)
        VALUES (NEW.product_id, NEW.warehouse_id, 'ADJUSTMENT',
                NEW.quantity - OLD.quantity, 'TRIGGER');
    END IF;
END //

DELIMITER ;
