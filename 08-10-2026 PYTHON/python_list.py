products=["Laptop","Mouse","Keyboard","Monitor"]

print(products)

print(len(products))

print(products[0])
print(products[1])
print(products[2])
print(products[3])
print(products[-1])

products[1]="Wireless Mouse"

print(products)

products.append("Disk")
print(products)

products.insert(1,"Led Monitor")
print(products)

products.remove("Led Monitor")
print(products)

products.sort()
print(products)

products.pop()
print(products)

