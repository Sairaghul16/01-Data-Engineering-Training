# File 1: shipment_utils.py


# 33. Create reusable shipment functions.

def calculate_shipping_cost(weight, rate):
    return weight * rate

def shipment_category(weight):
    if weight > 20:
        return "Heavy"
    elif weight >= 10:
        return "Medium"
    return "Light"

def check_status(status):
    return status == "Delivered"


#main.py

# 34. Import functions into main.py.
import shipment_utils

print(shipment_utils.calculate_shipping_cost(12.5, 50))
print(shipment_utils.shipment_category(12.5))

# 35. Use normal import and specific-function import.
from shipment_utils import check_status

print(check_status("Delivered"))

