# SECTION A — PYTHON


# 1. Take product name, unit price and quantity from the user.
product_name=input("Product name: ")
unit_price=float(input("Unit price: "))
quantity=int(input("Quantity: "))

# 2. Calculate total amount.

total = unit_price * quantity

# 3. If total amount is greater than or equal to 50000 , apply 10% discount; otherwise apply 5%
if total>=5000:
    discount=total*0.10
else:
    discount=total*0.05

# 4. Display original amount, discount and final amount using f-strings.
print(f"Orginal Amount: {total:.2f}")
print(f"Discount: {discount:.2f}")
print(f"Final Amount: {total-discount:.2f}")

# 5. Ask for stock quantity and display: High Stock for stock above 20,Low Stock for stock between 1 and 20,Out of Stock for 0
# 5. Display stock status.
stock = int(input("Enter stock quantity: "))
if stock > 20:
    print("High Stock")
elif stock >= 1:
    print("Low Stock")
else:
    print("Out of Stock")

# 6. Use a for loop to display numbers 1 through 10.
for i in range(1, 11):
    print(i)

# 7. Use a while loop to reduce stock from 5 to 0.
stock = 5
while stock >= 0:
    print(stock)
    stock -= 1

# 8. Skip number 5 using continue
for i in range(1, 11):
    if i == 5:
        continue
    print(i)

#9. Stop a loop when the value reaches 8 using break .

for i in range(1, 11):
    if i == 8:
        break
    print(i)
