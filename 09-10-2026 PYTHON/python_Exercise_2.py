#SET 2 list and tuple

sales = [
("North", 12000),
("South", 18000),
("West", 9500),
("North", 22000),
("East", 15000),
("South", 11000)
]

#1.Display all tuples
print("All tuples:")
print(sales)

print(tuple(sales))

#2.Display only the region from every tuple.
for item in sales:
    print(item[0])

#3.Display only the sales amount.
for item in sales:
    print(item[1])

#4. Find sales greater than 12000 .
for item in sales:
    if item[1]>12000:
        print(item)

#5.Calculate total sales.
total_sales = 0
for item in sales:
    total_sales += item[1]
print("\nTotal sales:", total_sales)

#6.Find the highest and lowest sales amount.
amounts = []
for item in sales:
    amounts.append(item[1])

print("\nHighest sales:", max(amounts))
print("Lowest sales:", min(amounts))


#7.Create a list containing only sales amounts.
sales_amounts = []
for item in sales:
    sales_amounts.append(item[1])
print("\nSales amount list:", sales_amounts)

#8. Find unique regions using a set.
regions = set(map(lambda x: x[0], sales))
print("\nUnique regions:", regions)

#9. Sort the tuples based on sales amount.
print("\nSorted by sales amount:")
print(sorted(sales, key=lambda x: x[1]))

#10. Sort the tuples based on region name.
print("\nSorted by region name:")
print(sorted(sales, key=lambda x: x[0]))

