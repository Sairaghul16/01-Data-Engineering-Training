# 1–4. Booking amount and discount

attendee_name = input("Enter attendee name: ")
tickets = int(input("Enter number of tickets: "))
ticket_price = float(input("Enter ticket price: "))

total_amount = tickets * ticket_price

if total_amount >= 10000:
    discount = total_amount * 0.10
else:
    discount = total_amount * 0.05

final_amount = total_amount - discount

print(f"Attendee Name: {attendee_name}")
print(f"Number of Tickets: {tickets}")
print(f"Ticket Price: ₹{ticket_price}")
print(f"Total Amount: ₹{total_amount}")
print(f"Discount: ₹{discount}")
print(f"Final Amount: ₹{final_amount}")

# 5–6. Event capacity

capacity = int(input("Enter event capacity: "))
registered = int(input("Enter registered participants: "))

if registered == capacity:
    print("Full")
elif registered < capacity:
    print("Seats Available")
else:
    print("Invalid Data")

# 7–8. Print numbers 1–15 and numbers divisible by 3

for i in range(1, 16):
    print(i)

for i in range(1, 16):
    if i % 3 == 0:
        print(i)

# 9. Countdown using while loop

count = 10

while count >= 1:
    print(count)
    count -= 1

# 10. break and continue

for i in range(1, 11):
    if i == 5:
        break
    print(i)

for i in range(1, 11):
    if i == 5:
        continue
    print(i)
