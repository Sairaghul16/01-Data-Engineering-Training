# 7. Create a list of shipment costs.
shipment_costs = [850, 620, 1250, 480, 1600, 740,
                  590, 1100, 920, 1750, 520, 1050]

# 8. Calculate total, average, minimum and maximum.
print("Total:", sum(shipment_costs))
print("Average:", sum(shipment_costs) / len(shipment_costs))
print("Minimum:", min(shipment_costs))
print("Maximum:", max(shipment_costs))

# 9. Remove duplicate destination cities using a set.
destinations = [
    "Hyderabad", "Mumbai", "Bangalore", "Delhi",
    "Pune", "Hyderabad", "Mumbai", "Delhi",
    "Bangalore", "Pune", "Hyderabad", "Mumbai"
]
print(set(destinations))

# 10. Store one shipment using a dictionary.
shipment = {
    "shipment_id": "S1001",
    "destination": "Hyderabad",
    "weight": 12.5,
    "cost": 850,
    "status": "Delivered"
}
print(shipment)

# 11. Store multiple shipments using a list of dictionaries.
shipments = [
    {"shipment_id": "S1001", "destination": "Hyderabad",
     "weight": 12.5, "cost": 850, "status": "Delivered"},
    {"shipment_id": "S1002", "destination": "Mumbai",
     "weight": 8.0, "cost": 620, "status": "In Transit"},
    {"shipment_id": "S1003", "destination": "Bangalore",
     "weight": 18.5, "cost": 1250, "status": "Delivered"},
    {"shipment_id": "S1004", "destination": "Delhi",
     "weight": 5.5, "cost": 480, "status": "Pending"},
    {"shipment_id": "S1005", "destination": "Pune",
     "weight": 22.0, "cost": 1600, "status": "Delivered"},
    {"shipment_id": "S1006", "destination": "Hyderabad",
     "weight": 10.0, "cost": 740, "status": "In Transit"},
    {"shipment_id": "S1007", "destination": "Mumbai",
     "weight": 7.2, "cost": 590, "status": "Delivered"},
    {"shipment_id": "S1008", "destination": "Delhi",
     "weight": 15.5, "cost": 1100, "status": "Pending"},
    {"shipment_id": "S1009", "destination": "Bangalore",
     "weight": 11.8, "cost": 920, "status": "Delivered"},
    {"shipment_id": "S1010", "destination": "Pune",
     "weight": 25.0, "cost": 1750, "status": "Delivered"},
    {"shipment_id": "S1011", "destination": "Hyderabad",
     "weight": 6.5, "cost": 520, "status": "In Transit"},
    {"shipment_id": "S1012", "destination": "Mumbai",
     "weight": 14.0, "cost": 1050, "status": "Delivered"}
]

# 12. Filter list records by status.
for s in shipments:
    if s["status"] == "Delivered":
        print(s)
