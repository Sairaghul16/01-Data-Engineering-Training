#Set 1 — Basics + CRUD + Filtering


#1. Display all menu items
SELECT * FROM menu_items;

#2. Display only item name and price
SELECT item_name, price
FROM menu_items;

#3. Add a new menu item
INSERT INTO menu_items
VALUES (9, 'Chicken Noodles', 'Main Course', 200, 15);

#4. Change the price of Chicken Biryani
UPDATE menu_items
SET price = 350
WHERE item_name = 'Chicken Biryani';

#5. Increase Fast Food prices by 10%
UPDATE menu_items
SET price = price * 1.10
WHERE category = 'Fast Food';

# 6. Reduce Veg Burger quantity by 2
UPDATE menu_items
SET available_qty = available_qty - 2
WHERE item_name = 'Veg Burger';

#7. Delete products with quantity 0
DELETE FROM menu_items
WHERE available_qty = 0;

# 8. Items costing more than 200
SELECT *
FROM menu_items
WHERE price > 200;

# 9. Items priced between 100 and 250
SELECT *
FROM menu_items
WHERE price BETWEEN 100 AND 250;

# 10. Breakfast items
SELECT *
FROM menu_items
WHERE category = 'Breakfast';

#11. Breakfast or Beverage
SELECT *
FROM menu_items
WHERE category IN ('Breakfast', 'Beverage');

# 12. Names containing Chicken
SELECT *
FROM menu_items
WHERE item_name LIKE '%Chicken%';

# 13. Highest price to lowest
SELECT *
FROM menu_items
ORDER BY price DESC;

# 14. Three most expensive items
SELECT *
FROM menu_items
ORDER BY price DESC
LIMIT 3;

# 15. Quantity less than 15
SELECT *
FROM menu_items
WHERE available_qty < 15;
