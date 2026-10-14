cities={"Hyderabad","Delhi","Mumbai","Hyderabad"}
print(cities)

cities.add("Pune")

cities.remove("Mumbai")
print(cities)

cities.discard("Chennai")
print(cities)

unique_cities = set(cities)
print(unique_cities)
