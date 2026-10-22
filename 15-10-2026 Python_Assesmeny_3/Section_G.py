import json

# 61. Read JSON into Python

with open("staff_new.json", "r", encoding="utf-8") as file:
    staff = json.load(file)

# 62. Check datatype

print(type(staff))

# 63. Display all staff names

for employee in staff:
    print(employee["name"])

# 64. Employees from Operations

for employee in staff:
    if employee["department"] == "Operations":
        print(employee["name"])

# 65. Employees whose salary exceeds 75000

for employee in staff:
    if employee["salary"] > 75000:
        print(employee["name"], employee["salary"])

# 66. Employees having Python in their skills

for employee in staff:
    if "Python" in employee["skills"]:
        print(employee["name"])

# 67. Display name, rating and events handled

for employee in staff:
    print(
        "Name:", employee["name"],
        "Rating:", employee["performance"]["rating"],
        "Events Handled:", employee["performance"]["events_handled"]
    )

# 68. Performance rating exceeds 4.5

for employee in staff:
    if employee["performance"]["rating"] > 4.5:
        print(employee["name"])

# 69. Extract all skills into one list

all_skills = []

for employee in staff:
    all_skills.extend(employee["skills"])

print(all_skills)

# 70. Find unique skills

unique_skills = set(all_skills)
print(unique_skills)

# 71. Sort employees by salary descending

salary_sorted = sorted(
    staff,
    key=lambda employee: employee["salary"],
    reverse=True
)

for employee in salary_sorted:
    print(employee["name"], employee["salary"])

# 72. Sort employees by performance rating descending

rating_sorted = sorted(
    staff,
    key=lambda employee: employee["performance"]["rating"],
    reverse=True
)

for employee in rating_sorted:
    print(employee["name"], employee["performance"]["rating"])

# 73. Add Pandas to staff ID 503

for employee in staff:
    if employee["staff_id"] == 503:
        if "Pandas" not in employee["skills"]:
            employee["skills"].append("Pandas")

# 74. Save modified JSON

with open("staff_updated.json", "w", encoding="utf-8") as file:
    json.dump(staff, file, indent=4)

print("Updated JSON saved successfully.")
