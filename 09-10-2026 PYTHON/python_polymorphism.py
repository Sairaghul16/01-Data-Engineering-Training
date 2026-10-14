class Developer:

    def work(self):
        print("work")

class Tester:
    def work(self):
        print("code")

d1=Developer()
d1.work()

t1=Tester()
t1.work()

#polymorphism
class Employee:

    def work(self):
        print("work")

class Developer:
    def work(self):
        print("code")

class Tester:

    def work(self):
        print("test")

def perform_work(employee):
    employee.work()

d1=Developer()
t1=Tester()

perform_work(d1)
perform_work(t1)
