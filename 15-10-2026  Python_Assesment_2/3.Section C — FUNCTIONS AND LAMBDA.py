# 13. Create a function calculating shipping cost.
def calculate_shipping_cost(weight, rate):
    return weight * rate

print(calculate_shipping_cost(12.5, 50))

# 14. Create a function returning shipment category based on weight.
def shipment_category(weight):
    if weight > 20:
        return "Heavy"
    elif weight >= 10:
        return "Medium"
    return "Light"

print(shipment_category(12.5))

# 15. Use lambda/filter to select Delivered shipments.
delivered = list(filter(
    lambda s: s["status"] == "Delivered", shipments
))
print(delivered)

# 16. Use map to obtain all destinations.
print(list(map(lambda s: s["destination"], shipments)))

# 17. Sort shipment dictionaries by cost.
print(sorted(shipments, key=lambda s: s["cost"]))
