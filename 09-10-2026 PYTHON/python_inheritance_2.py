class Employee:
    def __init__(self,name,salary):
        self.name=name
        self.salary=salary

    def display_employee(self):
        print(f"Product:{self.name}")
        print(f"Salary:{self.salary}")

class Developer(Employee):
    pass

    def write_code(self):
        print("Developer is writing code")#child use its parent and own

d1=Developer("Monitor",6500)
d1.display_employee()
d1.write_code()
