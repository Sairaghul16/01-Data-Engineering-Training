# SECTION C — FUNCTIONS AND LAMBDA
sales = [65000, 4500, 36000, 12000, 18000, 72000, 9000]

# 21. Create a function calculate_total(price, quantity).
def calculate_total(price, quantity):
    return price * quantity

print(calculate_total(1000, 3))

# 22. Create a function calculate_discount(amount) that returns the discount.
def calculate_discount(amount):
    if amount >= 50000:
        return amount * 0.10
    return amount * 0.05

print(calculate_discount(60000))

# 23. Create a function accepting a list of sales and returning total sales.
def total_sales(sales):
    return sum(sales)
print(total_sales(sales))

#24. Create a function accepting a product dictionary and returning "Available" or "Out of  Stock"
def check_product(product):
    if product["stock"] > 0:
        return "Available"
    return "Out of Stock"

print(check_product({"stock": 10}))


# 25. Use a lambda function to calculate the square of a number.
square = lambda x: x * x
print(square(5))


# 26. Use filter() with lambda to select sales > 20000.
print(list(filter(lambda x: x > 20000, sales)))

# 27. Use map() to extract customer cities.
customers_list = [
    {"name": "Arun", "city": "Chennai"},
    {"name": "Meera", "city": "Mumbai"}
]
print(list(map(lambda x: x["city"], customers_list)))

# 28. Use set() to get unique cities.
print(set(map(lambda x: x["city"], customers_list)))

# 29. Sort product dictionaries by price using key=.
products_list = [
    {"name": "Laptop", "price": 65000},
    {"name": "Mouse", "price": 1500},
    {"name": "Monitor", "price": 18000}
]
print(sorted(products_list, key=lambda x: x["price"]))

