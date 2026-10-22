import csv

# 53–54. Read CSV and store records in a list

with open("registrations.csv", "r", newline="", encoding="utf-8") as file:
    reader = csv.DictReader(file)
    registrations = list(reader)

# Convert amount to numeric datatype
for registration in registrations:
    registration["amount"] = float(registration["amount"])
    registration["tickets"] = int(registration["tickets"])

# 55. Confirmed registrations

print("Confirmed Registrations:")
for registration in registrations:
    if registration["status"] == "Confirmed":
        print(registration)

# 56. Registrations from Hyderabad

print("Hyderabad Registrations:")
for registration in registrations:
    if registration["city"] == "Hyderabad":
        print(registration)

# 57. Display numeric amounts

print("Numeric Amounts:")
for registration in registrations:
    print(registration["amount"])

# 58. Amounts exceeding 7000

print("Amounts greater than 7000:")
for registration in registrations:
    if registration["amount"] > 7000:
        print(registration)

# 59. Total registration amount

total_amount = sum(registration["amount"] for registration in registrations)
print("Total Registration Amount:", total_amount)

# 60. Unique cities

cities = set(registration["city"] for registration in registrations)
print("Unique Cities:", cities)
