
import csv

# Create and write data into shipments.csv
with open("shipments.csv", "w", newline="") as file:
    writer = csv.writer(file)

    # Add column names
    writer.writerow([
        "shipment_id", "customer", "city",
        "weight", "status", "cost"
    ])

    # Add shipment data
    writer.writerows([
        ["S101", "Alpha Stores", "Hyderabad", 12.5, "Delivered", 850],
        ["S102", "Metro Mart", "Mumbai", 8.2, "In Transit", 620],
        ["S103", "Fresh Foods", "Hyderabad", 15.0, "Delivered", 1100],
        ["S104", "Quick Shop", "Pune", 5.5, "Pending", 450],
        ["S105", "Urban Retail", "Mumbai", 20.0, "Delivered", 1450],
        ["S106", "Daily Needs", "Delhi", 9.8, "In Transit", 700],
        ["S107", "Smart Bazaar", "Hyderabad", 7.5, "Pending", 550],
        ["S108", "Green Market", "Delhi", 18.2, "Delivered", 1300]
    ])

print("shipments.csv created successfully!")

#1 read csv file
import csv

with open("shipments.csv", "r") as file:
    reader = csv.DictReader(file)
    shipments = list(reader)

#2.Store all records inside a Python list.

print(shipments)

#3.Display the complete list.
print("\nComplete shipment list:")
print(shipments)

#4.Display only: shipment ID customer status
for shipment in shipments:
    print(
        shipment["shipment_id"],
        shipment["customer"],
        shipment["status"]
    )

#5.Convert weight and cost from strings to numeric values.
for shipment in shipments:
    shipment["weight"] = float(shipment["weight"])
    shipment["cost"] = float(shipment["cost"])

#6.Calculate the total shipping cost.
total_cost = sum(map(lambda x: x["cost"], shipments))
print("\nTotal shipping cost:", total_cost)

#or
total_cost = 0

for shipment in shipments:
    total_cost += shipment["cost"]

print("Total shipping cost:", total_cost)

#7.Find shipments whose cost is greater than 700 .
print("\nCost greater than 700:")
print(list(filter(lambda x: x["cost"] > 700, shipments)))

#or
for shipment in shipments:
    if shipment["cost"] > 700:
        print(shipment)

#8.Use filter() and lambda to display only Delivered shipments.
delivered = list(filter(
    lambda x: x["status"] == "Delivered", shipments
))
print("\nDelivered shipments:")
print(delivered)


#9.Use filter() and lambda to find shipments weighing more than 10
heavy_shipments = list(filter(
    lambda x: x["weight"] > 10, shipments
))
print("\nWeight greater than 10:")
print(heavy_shipments)

#10. Use map() to extract all city names.
cities = list(map(lambda x: x["city"], shipments))
print("\nAll cities:", cities)

#11.Use map() + set() to get the unique cities.
unique_cities = set(map(lambda x: x["city"], shipments))
print("\nUnique cities:", unique_cities)

#12.Sort the shipment list by cost from lowest to highest using key .
print("\nSorted by cost ascending:")
print(sorted(shipments, key=lambda x: x["cost"]))


#13.Sort by weight from highest to lowest.
print("\nSorted by weight descending:")
print(sorted(
    shipments,
    key=lambda x: x["weight"],
    reverse=True
))

#14. Sort alphabetically by customer name.
print("\nSorted by customer:")
print(sorted(shipments, key=lambda x: x["customer"]))

#15.Calculate cost per kg
cost_per_kg = lambda cost, weight: cost / weight

print("\nCost per kg:")
for shipment in shipments:
    print(
        shipment["shipment_id"],
        round(cost_per_kg(shipment["cost"], shipment["weight"]), 2)
    )

