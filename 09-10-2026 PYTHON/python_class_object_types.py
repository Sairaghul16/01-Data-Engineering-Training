class Product:
    name="Laptop"
    price=65000

p1=Product()

print(p1.name)
print(p1.price)


#dynamic
class Product:
    name=" "
    price=0

p1=Product()
p1.name="Laptop"
p1.price=65000

p2=Product()
p2.name="Monitor"
p2.price=15000

print(p1.name,p1.price)
print(p2.name,p2.price)

#function class
class Product:
    name=" "
    price=0

    def display(self):
        print(f"Product name: {self.name}")
        print(f"price: {self.price}")

p1=Product()
p1.name="Laptop"
p1.price=65000

p1.display()"""

class Product:
    name=" "
    price=0
    quantity=0

    def total_price(self):
        return self.price*self.quantity
p1=Product()
p1.name="Laptop"
p1.price=65000
p1.quantity=5

print(p1.total_price()) 

class Employee:
    _department="IT"  #protected

e1=Employee()
print(e1._department)"""

class Employee:
    __department="IT"
e1=Employee()
print(e1.__department)#private
