"""Generate mock CSV data (with a few deliberately dirty rows) for the capstone.

Run:  python generate_mock_data.py
Creates: students.csv, courses.csv, enrollments.csv, progress.csv
"""
import os
import random
from pathlib import Path
import pandas as pd
import numpy as np

os.chdir(Path(__file__).resolve().parent)  # write CSVs next to this script
random.seed(42)
np.random.seed(42)

N_STUDENTS = 200
first = ["Aarav", "Diya", "Kabir", "Meera", "Rohan", "Sneha", "Vikram", "Anjali", "Arjun", "Priya",
         "Karthik", "Lakshmi", "Nikhil", "Pooja", "Rahul", "Divya", "Suresh", "Kavya", "Manoj", "Isha"]
last = ["Sharma", "Iyer", "Reddy", "Nair", "Patel", "Singh", "Kumar", "Menon", "Das", "Gupta"]

students = pd.DataFrame({
    "student_id": range(1, N_STUDENTS + 1),
    "name": [f"{random.choice(first)} {random.choice(last)}" for _ in range(N_STUDENTS)],
})
students["email"] = [f"student{i}@example.com" for i in students["student_id"]]

courses = pd.DataFrame({
    "course_id": range(101, 111),
    "title": ["Python Basics", "SQL Fundamentals", "Data Analysis with Pandas", "PySpark Essentials",
              "MongoDB for Beginners", "Azure Databricks", "Azure DevOps", "Machine Learning 101",
              "Data Visualization", "Statistics for Data Science"],
    "total_lessons": [20, 18, 25, 22, 15, 24, 16, 30, 14, 20],
})

rows = []
eid = 1
for sid in students["student_id"]:
    for cid in random.sample(list(courses["course_id"]), k=random.randint(1, 4)):
        date = pd.Timestamp("2026-01-01") + pd.Timedelta(days=random.randint(0, 250))
        pct = float(np.random.choice([0, 100, np.random.randint(5, 95)], p=[0.1, 0.3, 0.6]))
        status = "completed" if pct >= 100 else ("dropped" if pct < 20 and random.random() < 0.6 else "active")
        rows.append((eid, sid, cid, date.date().isoformat(), status, pct))
        eid += 1

enrollments = pd.DataFrame(rows, columns=["enrollment_id", "student_id", "course_id",
                                          "enrollment_date", "status", "completion"])

# ---- clean, normalized files used by SQL / PySpark / Databricks ----
students.to_csv("students.csv", index=False)
courses.to_csv("courses.csv", index=False)
enrollments.drop(columns="completion").to_csv("enrollments.csv", index=False)
enrollments[["enrollment_id", "completion"]].assign(last_updated="2026-10-01").to_csv(
    "progress_clean.csv", index=False)

# ---- dirty flat file used by Week 2 (Pandas cleaning exercise) ----
dirty = enrollments.merge(students[["student_id", "name"]], on="student_id")[
    ["enrollment_id", "student_id", "name", "course_id", "enrollment_date", "completion"]
].rename(columns={"name": "student_name"})
dirty = dirty.astype({"completion": "float"})
idx = dirty.sample(frac=0.06, random_state=1).index
third = len(idx) // 3
dirty.loc[idx[:third], "completion"] = np.nan                    # missing percentages
dirty.loc[idx[third:2 * third], "completion"] = np.random.choice([150, 130, 999, -20], size=third)  # out of range
dirty.loc[idx[2 * third:], "student_name"] = None                # missing names
dirty.loc[dirty.sample(n=5, random_state=2).index, "enrollment_date"] = "not-a-date"
dirty.to_csv("progress.csv", index=False)
print("Created:", len(students), "students,", len(courses), "courses,", len(enrollments), "enrollments")
