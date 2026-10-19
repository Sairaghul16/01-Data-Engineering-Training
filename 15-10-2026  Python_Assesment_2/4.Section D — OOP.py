
# 18. Create a Shipment class.
# 19. Add constructor values for shipment ID, destination, weight and cost.
# 20. Add a display method.
class Shipment:
    def __init__(self, shipment_id, destination, weight, cost):
        self.shipment_id = shipment_id
        self.destination = destination
        self.weight = weight
        self.cost = cost

    def display(self):
        print(self.shipment_id, self.destination,
              self.weight, self.cost)

# 21. Create ExpressShipment inheriting from Shipment.
# 22. Override a method to add an express surcharge.
class ExpressShipment(Shipment):
    def display(self):
        express_cost = self.cost + 200
        print(self.shipment_id, self.destination,
              self.weight, express_cost)

# 23. Demonstrate polymorphism using normal and express objects.
s1 = Shipment("S1001", "Hyderabad", 12.5, 850)
s2 = ExpressShipment("S1002", "Mumbai", 8.0, 620)

for s in [s1, s2]:
    s.display()
