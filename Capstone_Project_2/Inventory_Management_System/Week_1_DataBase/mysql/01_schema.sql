DROP DATABASE IF EXISTS inventory_db;
CREATE DATABASE inventory_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE inventory_db;

CREATE TABLE categories (
    category_id   INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description   VARCHAR(255)
);

CREATE TABLE suppliers (
    supplier_id   INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(150) NOT NULL,
    contact_name  VARCHAR(100),
    phone         VARCHAR(20),
    email         VARCHAR(150) UNIQUE,
    city          VARCHAR(80),
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE warehouses (
    warehouse_id   INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_name VARCHAR(100) NOT NULL,
    city           VARCHAR(80) NOT NULL,
    capacity       INT CHECK (capacity > 0)
);

CREATE TABLE products (
    product_id    INT AUTO_INCREMENT PRIMARY KEY,
    sku           VARCHAR(30) NOT NULL UNIQUE,
    product_name  VARCHAR(150) NOT NULL,
    category_id   INT NOT NULL,
    supplier_id   INT NOT NULL,
    unit_price    DECIMAL(10,2) NOT NULL CHECK (unit_price >= 0),
    reorder_level INT NOT NULL DEFAULT 10,
    is_active     BOOLEAN NOT NULL DEFAULT TRUE,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_prod_cat FOREIGN KEY (category_id) REFERENCES categories(category_id),
    CONSTRAINT fk_prod_sup FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

CREATE TABLE stock (
    stock_id     INT AUTO_INCREMENT PRIMARY KEY,
    product_id   INT NOT NULL,
    warehouse_id INT NOT NULL,
    quantity     INT NOT NULL DEFAULT 0 CHECK (quantity >= 0),
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uq_prod_wh (product_id, warehouse_id),
    CONSTRAINT fk_stock_prod FOREIGN KEY (product_id)   REFERENCES products(product_id),
    CONSTRAINT fk_stock_wh   FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);

CREATE TABLE customers (
    customer_id   INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(150) NOT NULL,
    email         VARCHAR(150) UNIQUE,
    phone         VARCHAR(20),
    city          VARCHAR(80)
);

CREATE TABLE purchase_orders (
    po_id        INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id  INT NOT NULL,
    warehouse_id INT NOT NULL,
    order_date   DATE NOT NULL,
    status       ENUM('PENDING','RECEIVED','CANCELLED') NOT NULL DEFAULT 'PENDING',
    CONSTRAINT fk_po_sup FOREIGN KEY (supplier_id)  REFERENCES suppliers(supplier_id),
    CONSTRAINT fk_po_wh  FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);

CREATE TABLE purchase_order_items (
    po_item_id INT AUTO_INCREMENT PRIMARY KEY,
    po_id      INT NOT NULL,
    product_id INT NOT NULL,
    quantity   INT NOT NULL CHECK (quantity > 0),
    unit_cost  DECIMAL(10,2) NOT NULL CHECK (unit_cost >= 0),
    CONSTRAINT fk_poi_po   FOREIGN KEY (po_id)      REFERENCES purchase_orders(po_id) ON DELETE CASCADE,
    CONSTRAINT fk_poi_prod FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE sales_orders (
    so_id        INT AUTO_INCREMENT PRIMARY KEY,
    customer_id  INT NOT NULL,
    warehouse_id INT NOT NULL,
    order_date   DATE NOT NULL,
    status       ENUM('PENDING','SHIPPED','DELIVERED','CANCELLED') NOT NULL DEFAULT 'PENDING',
    CONSTRAINT fk_so_cust FOREIGN KEY (customer_id)  REFERENCES customers(customer_id),
    CONSTRAINT fk_so_wh   FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);

CREATE TABLE sales_order_items (
    so_item_id INT AUTO_INCREMENT PRIMARY KEY,
    so_id      INT NOT NULL,
    product_id INT NOT NULL,
    quantity   INT NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10,2) NOT NULL CHECK (unit_price >= 0),
    CONSTRAINT fk_soi_so   FOREIGN KEY (so_id)      REFERENCES sales_orders(so_id) ON DELETE CASCADE,
    CONSTRAINT fk_soi_prod FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE stock_movements (
    movement_id   INT AUTO_INCREMENT PRIMARY KEY,
    product_id    INT NOT NULL,
    warehouse_id  INT NOT NULL,
    movement_type ENUM('IN','OUT','ADJUSTMENT') NOT NULL,
    quantity      INT NOT NULL,
    reference     VARCHAR(50),
    moved_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_mv_prod FOREIGN KEY (product_id)   REFERENCES products(product_id),
    CONSTRAINT fk_mv_wh   FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);
