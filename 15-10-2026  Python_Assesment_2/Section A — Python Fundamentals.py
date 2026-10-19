# ASSESSMENT 2 — LOGISTICS & EMPLOYEE DATA PROCESSING

# 1. Accept shipment weight and cost from the user.
weight = float(input("Enter shipment weight: "))
cost = float(input("Enter shipment cost: "))

# 2. Calculate cost per kg.
print("Cost per kg:", cost / weight if weight != 0 else 0)

# 3. Classify shipment weight.
if weight > 20:
    print("Heavy")
elif weight >= 10:
    print("Medium")
else:
    print("Light")

# 4. Use loops to display shipment numbers from 1–20.
for i in range(1, 21):
    print(i)

# 5. Display only even shipment numbers.
for i in range(1, 21):
    if i % 2 == 0:
        print(i)

# 6. Use a while loop to simulate five processing attempts.
attempt = 1
while attempt <= 5:
    print("Processing attempt", attempt)
    attempt += 1
