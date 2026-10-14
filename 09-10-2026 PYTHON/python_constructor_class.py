class Product:
    def __init__(self):
        print("init product")

p1=Product()

class Employee:
    def __init__(self,emp_id,name,department,salary):
        self.emp_id=emp_id
        self.name=name
        self.department=department
        self.salary=salary

e1=Employee(101,"Krithi","AI & DS",35000)
e2=Employee(102,"Raghul","AI & DS",30000)

class Employee:
    def __init__(self,name,salary):
        self.name=name
        self.salary=salary

    def display_employee(self):
        print(f"Product:{self.name}")
        print(f"Salary:{self.salary}")

class Developer(Employee):
    pass

developer=Developer("Monitor",6500)
developer.display_employee()





