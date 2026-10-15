# SECTION B — LISTS, TUPLES, SETS AND DICTIONARIES

sales = [65000, 4500, 36000, 12000, 18000, 72000, 9000]

#10.Find total sales.
print("Total:",sum(sales))
total=0
for sale in sales:
    total+=sale
    print("Total:",total)

#11. Find highest and lowest sale.
print("Highest Sale:", max(sales))
print("Lowest Sale:", min(sales))

#12. Display sales greater than 20000 .
for sale in sales:
    if sale > 20000:
        print("Highest Sale:",sale)

print([s for s in sales if s > 20000])

#13. Sort sales from highest to lowest.

print(sorted(sales, reverse=True))

# 14.Create a set and display unique cities.
cities = ["Hyderabad", "Mumbai", "Delhi",
          "Hyderabad", "Pune", "Mumbai"]
print(set(cities))

# 15. Create a tuple and unpack it into individual variables.
product = (201, "Laptop", "Electronics", 65000)
product_id, product_name, category, price = product
print(product_id, product_name, category, price)

# 16. Create a dictionary representing a customer.
customer = {
    "id": "C101",
    "name": "Arun",
    "city": "Chennai",
    "orders": 2,
    "active": True
}

#17. Update the customer's city.
customer["city"] = "Hyderabad"
print(customer)

# 18. Increase order count by 1.
customer["orders"] += 1
print(customer)

# 19. Add an email field.
customer["email"] = "arun@gmail.com"
print(customer)

# 20. Loop through all keys and values.
for key, value in customer.items():
    print(key, value)




