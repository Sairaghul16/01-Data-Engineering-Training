# SECTION F — USER-DEFINED MODULE


# 56. Create retail_utils.py separately with the following code:

def calculate_order_total(price, quantity):
    return price * quantity

def calculate_discount(amount):
    return amount * 0.10 if amount >= 50000 else amount * 0.05

def check_stock(stock):
    return "Available" if stock > 0 else "Out of Stock" 


# 57. Import the module.
import retail_utils

# 58. Call all three functions.
print(retail_utils.calculate_order_total(1000, 3))
print(retail_utils.calculate_discount(60000))
print(retail_utils.check_stock(10))


# 59. Import one function directly and call it.
from retail_utils import calculate_order_total
print(calculate_order_total(2000, 4))

# 60. Import the module using an alias.
import retail_utils as ru
print(ru.check_stock(0))





