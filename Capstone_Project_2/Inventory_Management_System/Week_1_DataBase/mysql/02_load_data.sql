USE inventory_db;

INSERT INTO categories (category_name, description) VALUES
('Electronics',  'Phones, accessories and gadgets'),
('Furniture',    'Office and home furniture'),
('Stationery',   'Paper, pens and office supplies'),
('Appliances',   'Small home appliances'),
('Grocery',      'Packaged food items');

INSERT INTO suppliers (supplier_name, contact_name, phone, email, city) VALUES
('TechSource Pvt Ltd',   'Arun Kumar',   '9840011111', 'arun@techsource.com',    'Chennai'),
('OfficeWorld Traders',  'Meena Iyer',   '9840022222', 'meena@officeworld.com',  'Bengaluru'),
('HomeComfort Supplies', 'Rahul Sharma', '9840033333', 'rahul@homecomfort.com',  'Hyderabad'),
('FreshPack Foods',      'Priya Nair',   '9840044444', 'priya@freshpack.com',    'Kochi');

INSERT INTO warehouses (warehouse_name, city, capacity) VALUES
('Chennai Central WH', 'Chennai',   10000),
('Bengaluru North WH', 'Bengaluru',  8000),
('Hyderabad East WH',  'Hyderabad',  6000);

INSERT INTO products (sku, product_name, category_id, supplier_id, unit_price, reorder_level) VALUES
('ELE-1001', 'Wireless Mouse',        1, 1,   599.00, 25),
('ELE-1002', 'USB-C Charger 65W',     1, 1,  1499.00, 20),
('ELE-1003', 'Bluetooth Speaker',     1, 1,  2999.00, 15),
('FUR-2001', 'Ergonomic Office Chair',2, 3,  7499.00,  5),
('FUR-2002', 'Standing Desk',         2, 3, 15999.00,  3),
('STA-3001', 'A4 Paper Ream (500)',   3, 2,   320.00, 50),
('STA-3002', 'Gel Pen Pack (10)',     3, 2,   120.00, 60),
('APP-4001', 'Electric Kettle 1.5L',  4, 3,  1299.00, 15),
('APP-4002', 'Mixer Grinder',         4, 3,  3499.00, 10),
('GRO-5001', 'Basmati Rice 5kg',      5, 4,   650.00, 40);

INSERT INTO stock (product_id, warehouse_id, quantity) VALUES
(1,1,120),(1,2,60),(1,3,15),
(2,1,45),(2,2,12),
(3,1,30),(3,3,8),
(4,1,10),(4,2,4),
(5,1,6),
(6,1,300),(6,2,150),(6,3,40),
(7,1,200),(7,2,35),
(8,2,22),(8,3,9),
(9,1,14),
(10,1,90),(10,2,25),(10,3,18);

INSERT INTO customers (customer_name, email, phone, city) VALUES
('Ravi Enterprises',  'ravi@ravient.com',   '9900011111', 'Chennai'),
('Sunrise Offices',   'info@sunrise.com',   '9900022222', 'Bengaluru'),
('Kiran Retail',      'kiran@kretail.com',  '9900033333', 'Hyderabad'),
('Anita Stores',      'anita@astores.com',  '9900044444', 'Chennai'),
('Metro Supermart',   'buy@metro.com',      '9900055555', 'Kochi');

INSERT INTO purchase_orders (supplier_id, warehouse_id, order_date, status) VALUES
(1, 1, '2026-09-01', 'RECEIVED'),
(2, 2, '2026-09-10', 'RECEIVED'),
(3, 1, '2026-09-20', 'RECEIVED'),
(4, 3, '2026-10-05', 'PENDING'),
(1, 3, '2026-10-12', 'CANCELLED');

INSERT INTO purchase_order_items (po_id, product_id, quantity, unit_cost) VALUES
(1, 1, 100, 450.00), (1, 2,  40, 1100.00), (1, 3, 30, 2300.00),
(2, 6, 300, 250.00), (2, 7, 200,   80.00),
(3, 4,  10, 5500.00),(3, 5,   6, 12000.00),
(4,10, 100, 500.00),
(5, 1,  50, 450.00);

INSERT INTO sales_orders (customer_id, warehouse_id, order_date, status) VALUES
(1, 1, '2026-10-01', 'DELIVERED'),
(2, 2, '2026-10-03', 'DELIVERED'),
(3, 3, '2026-10-07', 'SHIPPED'),
(4, 1, '2026-10-15', 'DELIVERED'),
(5, 3, '2026-10-20', 'PENDING'),
(1, 1, '2026-11-02', 'DELIVERED'),
(2, 2, '2026-11-09', 'CANCELLED');

INSERT INTO sales_order_items (so_id, product_id, quantity, unit_price) VALUES
(1, 1, 20, 599.00), (1, 2, 10, 1499.00),
(2, 6, 50, 320.00), (2, 7, 40, 120.00),
(3, 8,  5, 1299.00),(3, 10,10, 650.00),
(4, 4,  2, 7499.00),(4, 5,  1, 15999.00),
(5, 10,20, 650.00),
(6, 3,  5, 2999.00),(6, 1, 30, 599.00),
(7, 9,  2, 3499.00);

INSERT INTO stock_movements (product_id, warehouse_id, movement_type, quantity, reference) VALUES
(1, 1, 'IN',  100, 'PO-1'),
(6, 2, 'IN',  300, 'PO-2'),
(1, 1, 'OUT',  20, 'SO-1'),
(6, 2, 'OUT',  50, 'SO-2'),
(3, 3, 'ADJUSTMENT', -2, 'DAMAGED');
