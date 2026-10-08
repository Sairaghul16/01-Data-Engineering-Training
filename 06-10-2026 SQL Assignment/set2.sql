#SET 2 Aggregate + GROUP BY + HAVING

  
# 1. Total number of orders
SELECT COUNT(*) AS total_orders
FROM food_orders;

# 2. Total revenue
SELECT SUM(order_amount) AS total_revenue
FROM food_orders;

# 3. Average order value
SELECT AVG(order_amount) AS average_order_value
FROM food_orders;

# 4. Highest order amount
SELECT MAX(order_amount) AS highest_order
FROM food_orders;

# 5. Lowest order amount
SELECT MIN(order_amount) AS lowest_order
FROM food_orders;

# 6. Total revenue by city
SELECT city, SUM(order_amount) AS total_revenue
FROM food_orders
GROUP BY city;

# 7. Number of orders by restaurant
SELECT restaurant, COUNT(*) AS order_count
FROM food_orders
GROUP BY restaurant;

# 8. Average order value by food type
SELECT food_type, AVG(order_amount) AS average_order
FROM food_orders
GROUP BY food_type;

# 9. Revenue by delivery partner
SELECT delivery_partner, SUM(order_amount) AS total_revenue
FROM food_orders
GROUP BY delivery_partner;

# 10. Cities having more than 3 orders
SELECT city, COUNT(*) AS order_count
FROM food_orders
GROUP BY city
HAVING COUNT(*) > 3;

# 11. Restaurants generating more than 2000
SELECT restaurant, SUM(order_amount) AS total_revenue
FROM food_orders
GROUP BY restaurant
HAVING SUM(order_amount) > 2000;

# 12. Partners whose average order exceeds 800
SELECT delivery_partner, AVG(order_amount) AS average_order
FROM food_orders
GROUP BY delivery_partner
HAVING AVG(order_amount) > 800;

# 13. Food types whose revenue exceeds 2500
SELECT food_type, SUM(order_amount) AS total_revenue
FROM food_orders
GROUP BY food_type
HAVING SUM(order_amount) > 2500;

# 14. City-wise revenue highest to lowest
SELECT city, SUM(order_amount) AS total_revenue
FROM food_orders
GROUP BY city
ORDER BY total_revenue DESC;

# 15. Top-performing restaurant
SELECT restaurant, SUM(order_amount) AS total_revenue
FROM food_orders
GROUP BY restaurant
ORDER BY total_revenue DESC
LIMIT 1;
