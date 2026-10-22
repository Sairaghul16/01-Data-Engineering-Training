# 26. Calculate booking amount

def calculate_booking(ticket_price, tickets):
    return ticket_price * tickets

print(calculate_booking(2500, 3))


# 27. Calculate discount

def calculate_discount(amount):
    if amount >= 10000:
        return amount * 0.10
    return amount * 0.05

print(calculate_discount(12000))


# 28. Check registration status

def is_active(status):
    return status == "Confirmed"

print(is_active("Confirmed"))


# 29. Total booking amounts

def total_booking(amounts):
    return sum(amounts)

amounts = [5000, 3500, 7500, 6000, 4000, 7000, 3000, 10000]
print(total_booking(amounts))


# 30. Lambda to increase amount by 10%

increase_amount = lambda amount: amount * 1.10
print(increase_amount(5000))


# 31. Filter amounts greater than 6000

filtered_amounts = list(filter(lambda amount: amount > 6000, amounts))
print(filtered_amounts)


# 32. Filter Confirmed registrations

registrations = [
    {"registration_id": "R1001", "attendee_name": "Aarav Shah", "status": "Confirmed", "amount": 5000, "city": "Hyderabad"},
    {"registration_id": "R1002", "attendee_name": "Simran Kaur", "status": "Confirmed", "amount": 3500, "city": "Mumbai"},
    {"registration_id": "R1003", "attendee_name": "Faiz Ahmed", "status": "Pending", "amount": 7500, "city": "Pune"},
    {"registration_id": "R1004", "attendee_name": "Keerthi Rao", "status": "Confirmed", "amount": 6000, "city": "Bangalore"}
]

confirmed = list(filter(
    lambda registration: registration["status"] == "Confirmed",
    registrations
))

print(confirmed)


# 33. Extract attendee cities using map()

cities = list(map(lambda registration: registration["city"], registrations))
print(cities)


# 34. Extract unique cities using map() and set()

unique_cities = set(map(lambda registration: registration["city"], registrations))
print(unique_cities)


# 35. Sort registrations by amount

sorted_registrations = sorted(
    registrations,
    key=lambda registration: registration["amount"]
)

print(sorted_registrations)
