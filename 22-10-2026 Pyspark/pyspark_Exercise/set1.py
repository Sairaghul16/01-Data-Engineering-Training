# Exercise Set 1 — Basic DataFrame Operations

# 1. Display the first 20 records
df.show(20)

# 2. Display the schema
df.printSchema()

# 3. Display all column names
print(df.columns)

# 4. Count the total number of records
print("Total records:", df.count())

# 5. Display order ID, product name, city, quantity, and unit price
df.select("order_id", "product_name", "city", "quantity", "unit_price").show()

# 6. Display only Electronics transactions
df.filter(df.category == "Electronics").show()

# 7. Display transactions from Hyderabad
df.filter(df.city == "Hyderabad").show()

# 8. Display transactions where quantity is greater than 3
df.filter(df.quantity > 3).show()

# 9. Display transactions where unit price is greater than ₹20,000
df.filter(df.unit_price > 20000).show()

# 10. Display Delivered transactions
df.filter(df.status == "Delivered").show()
