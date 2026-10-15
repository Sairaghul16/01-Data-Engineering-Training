# SECTION E — TEXT, CSV AND JSON FILES

import csv
import json

# 40. Create activity.txt.
# 41. Write three processing messages.
with open("activity.txt", "w") as f:
    f.write("Order processing started\n")
    f.write("Customer data loaded\n")
    f.write("Order processing completed\n")

# 42. Append one additional message.
with open("activity.txt", "a") as f:
    f.write("Report generated\n")

# 43. Read and display the complete file.
with open("activity.txt", "r") as f:
    print(f.read())


# 44. Read customers.csv using csv module.
# 45. Store records in a Python list.
with open("customers.csv", "r", newline="") as f:

    customers = list(csv.DictReader(f))
    print(customers)


# 46. Display only active customers.
for c in customers:
    if c["active"] == "True":
        print(c)

# 47. Display only Hyderabad customers.
for c in customers:
    if c["city"] == "Hyderabad":
        print(c)
# 48. Read products.json.
with open("products.json", "r") as f:
    products = json.load(f)

# 49. Display all product names.
for p in products:
    print(p["product_name"])

# 50. Display products costing above 10000.
for p in products:
    if p["price"] > 10000:
        print(p["product_name"])

# 51. Display supplier name and supplier city.
for p in products:
    print(p["supplier"]["name"], p["supplier"]["city"])

# 52. Extract all colors into one list.
colors = []
for p in products:
    colors.extend(p["colors"])
print(colors)

# 53. Display unique colors.
print(set(colors))

# 54. Increase stock of product ID 202 by 5.
for p in products:
    if p["product_id"] == 202:
        p["stock"] += 5

# 55. Write modified data to products_updated.json.
with open("products_updated.json", "w") as f:
    json.dump(products, f, indent=4)


