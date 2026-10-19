
import json

# 24. Read employees.json.
with open("employees.json", "r") as f:
    employees = json.load(f)

# 25. Display all employee names.
for e in employees:
    print(e["name"])

# 26. Find employees earning above 75000.
for e in employees:
    if e["salary"] > 75000:
        print(e["name"], e["salary"])

# 27. Display employees knowing Python.
for e in employees:
    if "Python" in e["skills"]:
        print(e["name"])

# 28. Display employee name and performance rating.
for e in employees:
    print(e["name"], e["performance"]["rating"])

# 29. Find employees whose rating exceeds 4.5.
for e in employees:
    if e["performance"]["rating"] > 4.5:
        print(e["name"])

# 30. Sort employees by rating descending.
employees.sort(
    key=lambda e: e["performance"]["rating"],
    reverse=True
)
print(employees)

# 31. Add one skill to employee 303.
for e in employees:
    if e["employee_id"] == 303:
        if "Pandas" not in e["skills"]:
            e["skills"].append("Pandas")

# 32. Save the modified JSON.
with open("employees_updated.json", "w") as f:
    json.dump(employees, f, indent=4)
