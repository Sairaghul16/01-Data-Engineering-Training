# SECTION D — OOP

# 30. Initialize Product values using __init__().
# 31. Add display_product().
# 32. Add calculate_value() returning price * stock.

class Product:
    def __init__(self, product_id, product_name, price, stock):
        self.product_id = product_id
        self.product_name = product_name
        self.price = price
        self.stock = stock

    def display_product(self):
        print(self.product_id, self.product_name,
              self.price, self.stock)

    def calculate_value(self):
        return self.price * self.stock

# 33. Create two product objects.
p1 = Product(201, "Laptop", 65000, 12)
p2 = Product(202, "Monitor", 18000, 8)
p1.display_product()
p2.display_product()
print(p1.calculate_value())


# 34. Inherit from Product.
# 35. Add discount_percent.
# 36. Use super() to initialize parent values.
# 37. Override display_product().
class DiscountedProduct(Product):
    def __init__(self, product_id, product_name, price,
                 stock, discount_percent):
        super().__init__(product_id, product_name, price, stock)
        self.discount_percent = discount_percent

    def display_product(self):
        super().display_product()
        print("Discount:", self.discount_percent, "%")

p1 = DiscountedProduct(201, "Laptop", 65000, 12,60)
p1.display_product()


# 38. PremiumProduct has its own display_product().

class PremiumProduct(Product):
    def display_product(self):
        print("Premium Product:", self.product_name,
              "Price:", self.price)

p1 = PremiumProduct(201, "Laptop", 65000, 12)
p1.display_product()

# 39. Demonstrate polymorphism.
p3 = DiscountedProduct(203, "Chair", 9000, 15, 10)
p4 = PremiumProduct(204, "Keyboard", 3000, 30)

for p in [p1, p3, p4]:
    p.display_product()


