class Employee:

    def work(self):
        print("work")

class Developer(Employee):
    def code(self):
        print("code")

class Tester(Employee):

    def test(self):
        print("test")

d1=Developer()
d1.work()
d1.code()


t1=Tester()
t1.work()
t1.test()
