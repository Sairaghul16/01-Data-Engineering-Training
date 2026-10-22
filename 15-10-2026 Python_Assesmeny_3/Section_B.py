# 11–15. List operations

booking_amounts = [
    5000, 3500, 7500, 6000,
    4000, 7000, 3000, 10000
]

print("Total:", sum(booking_amounts))
print("Average:", sum(booking_amounts) / len(booking_amounts))
print("Highest:", max(booking_amounts))
print("Lowest:", min(booking_amounts))

print("Amounts greater than 5000:")
for amount in booking_amounts:
    if amount > 5000:
        print(amount)

print("Descending order:", sorted(booking_amounts, reverse=True))

# 16–18. Set operations

cities = [
    "Hyderabad", "Mumbai", "Pune",
    "Hyderabad", "Delhi", "Mumbai"
]

unique_cities = set(cities)
print("Unique cities:", unique_cities)

unique_cities.add("Chennai")
print("After adding city:", unique_cities)
print("Number of unique cities:", len(unique_cities))

# 19–20. Tuple creation and unpacking

event = ("E101", "AI Innovation Summit", "Hyderabad", 500)

event_id, event_name, venue, capacity = event

print(event_id)
print(event_name)
print(venue)
print(capacity)

# 21–25. Registration dictionary

registration = {
    "registration_id": "R1001",
    "attendee_name": "Aarav Shah",
    "city": "Hyderabad",
    "tickets": 2,
    "status": "Pending",
    "amount": 5000
}

# 22. Change status
registration["status"] = "Confirmed"

# 23. Increase ticket count
registration["tickets"] += 1

# 24. Add email
registration["email"] = "aarav@example.com"

# 25. Display dictionary items
for key, value in registration.items():
    print(key, ":", value)
