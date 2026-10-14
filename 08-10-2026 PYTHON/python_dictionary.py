product={"product_id":101,"product_name":"Laptop","category":"Electronic","price":6500}
print(product)

#ACCESS
print(product["product_name"])

#without erroe
print(product.get("brand"))

product["price"]=7000
print(product)

product["stock"]=1000
print(product)

product.pop("price")
print(product)
del product["stock"]
print(product)
