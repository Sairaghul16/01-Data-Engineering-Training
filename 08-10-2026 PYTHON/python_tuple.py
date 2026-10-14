
# 1. Create a tuple
numbers = (10, 20, 30, 40, 50)
print("Original tuple:", numbers)

# 2. Find the type
print("Type:", type(numbers))

# 3. Access elements
print("First element:", numbers[0])
print("Second element:", numbers[1])

# 4. Negative indexing
print("Last element:", numbers[-1])
print("Second last element:", numbers[-2])

# 5. Find length
print("Length:", len(numbers))

# 6. Count duplicate values
values = (10, 20, 10, 30, 10)
print("Count of 10:", values.count(10))

# 7. Find index
print("Index of 30:", numbers.index(30))

# 8. Check whether a value exists
if 20 in numbers:
    print("20 is present")
else:
    print("20 is not present")

# 9. Join two tuples
a = (10, 20)
b = (30, 40)
print("Joined tuple:", a + b)

# 10. Repeat a tuple
print("Repeated tuple:", a * 3)

# 11. Find maximum, minimum and sum
print("Maximum:", max(numbers))
print("Minimum:", min(numbers))
print("Sum:", sum(numbers))

# 12. Loop through a tuple
print("Tuple elements:")
for item in numbers:
    print(item)

# 13. Tuple slicing
print("Elements from index 1 to 3:", numbers[1:4])
print("First three elements:", numbers[:3])
print("From index 2 onwards:", numbers[2:])

# 14. Sort tuple values
print("Sorted values:", sorted((40, 10, 50, 20, 30)))

# 15. Convert tuple to list and modify
temp = list(numbers)
temp.append(60)
print("After adding 60:", temp)

# 16. Convert list back to tuple
numbers = tuple(temp)
print("Updated tuple:", numbers)

# 17. Find unique values using a set
values = (10, 20, 10, 30, 20)
print("Unique values:", set(values))

# 18. Tuple with a single element
single = (10,)
print("Single element tuple:", single)
print("Single tuple type:", type(single))
