from fastapi import FastAPI,HTTPException
from pydantic import BaseModel

app = FastAPI()

# 1. Create Employee Model
class Employee(BaseModel):
    id : int
    name: str
    department: str
    designation: str
    salary: float
    city: str

employees=[]

# 2. Add Employee (POST)
@app.post("/employees")
def add_employee(employee: Employee):
    employees.append(employee)
    return { "message": "employee created", "employee": employees }


# 3. Retrieve All Employees (GET)
@app.get("/employees")
def get_all_employees():
    return employees

# 4. Retrieve Employee by ID (GET)
@app.get("/employees/{employee_id}")
def get_employee(employee_id: int):
    for emp in employees:
        if emp.id == employee_id:
            return emp

    raise HTTPException(
        status_code=404,
        detail="Employee not found"
    )


# 5. Update Employee (PUT)
@app.put("/employees/{employee_id}")
def update_employee(employee_id: int, updated_employee: Employee):
    for index, emp in enumerate(employees):
        if emp.id == employee_id:
            if updated_employee.id != employee_id:
                raise HTTPException(
                    status_code=400,
                    detail="Employee ID cannot be changed"
                )

            employees[index] = updated_employee
            return updated_employee

    raise HTTPException(
        status_code=404,
        detail="Employee not found"
    )


# 6. Delete Employee (DELETE)
@app.delete("/employees/{employee_id}")
def delete_employee(employee_id: int):
    for index, emp in enumerate(employees):
        if emp.id == employee_id:
            deleted_employee = employees.pop(index)
            return {
                "message": "Employee deleted successfully",
                "employee": deleted_employee
            }

    raise HTTPException(
        status_code=404,
        detail="Employee not found"
    )

