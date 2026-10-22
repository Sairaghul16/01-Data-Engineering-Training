# event_utils.py

# 75. Calculate booking amount

def calculate_booking(ticket_price, tickets):
    return ticket_price * tickets


# Calculate discount

def calculate_discount(amount):
    if amount >= 10000:
        return amount * 0.10
    return amount * 0.05


# Check event capacity

def check_capacity(capacity, registered):
    if registered == capacity:
        return "Full"
    elif registered < capacity:
        return "Seats Available"
    else:
        return "Invalid Data"


main.py

# 76. Import the entire module

import event_utils

amount = event_utils.calculate_booking(2500, 4)
print("Booking Amount:", amount)

discount = event_utils.calculate_discount(amount)
print("Discount:", discount)

status = event_utils.check_capacity(500, 400)
print("Capacity Status:", status)


# 78. Import one function directly

from event_utils import calculate_booking

print("Direct Import:", calculate_booking(3500, 2))


# 79. Import the module using an alias

import event_utils as eu

print("Alias Import:", eu.calculate_discount(12000))
