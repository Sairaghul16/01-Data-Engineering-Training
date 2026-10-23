"""Week 2 - Step 2: Course-level report of average progress.

Uses courses_cleaned.csv as the base so every course detail (name, category,
duration, price) appears in the report next to its progress statistics.

Reads  : data/cleaned/courses_cleaned.csv, enrollments_cleaned.csv, progress_cleaned.csv
Writes : reports/course_level_report.csv and reports/course_level_report.txt
"""
from pathlib import Path

import numpy as np
import pandas as pd

BASE = Path(__file__).resolve().parent
CLEANED = BASE / "data" / "cleaned"
REPORTS = BASE / "reports"
REPORTS.mkdir(exist_ok=True)

courses = pd.read_csv(CLEANED / "courses_cleaned.csv")
progress = pd.read_csv(CLEANED / "progress_cleaned.csv")

# NumPy: overall average progress across all students
overall_avg = np.mean(progress["completion"].to_numpy())

# Pandas: group progress by course and compute completion statistics
stats = (
    progress.groupby("course_id")["completion"]
    .agg(
        students_enrolled="count",
        avg_completion="mean",
        min_completion="min",
        max_completion="max",
        completed_students=lambda s: int((s == 100).sum()),
    )
    .round(2)
    .reset_index()
)

# Join the statistics onto the courses file (left join keeps courses with no progress)
report = courses.merge(stats, on="course_id", how="left")
report["students_enrolled"] = report["students_enrolled"].fillna(0).astype(int)
report["completed_students"] = report["completed_students"].fillna(0).astype(int)
report = report.sort_values("avg_completion", ascending=False).reset_index(drop=True)

# Build the text report
best, worst = report.iloc[0], report.iloc[-1]
lines = [
    "COURSE-LEVEL PROGRESS REPORT",
    "=" * 78,
    f"Courses in report      : {len(report)}",
    f"Total progress records : {len(progress)}",
    f"Overall average (NumPy): {overall_avg:.2f}%",
    "",
    report.to_string(index=False),
    "",
    f"Highest average: {best['course_name']} ({best['avg_completion']}%)",
    f"Lowest average : {worst['course_name']} ({worst['avg_completion']}%)",
]
text = "\n".join(lines)

print(text)
report.to_csv(REPORTS / "course_level_report.csv", index=False)
(REPORTS / "course_level_report.txt").write_text(text + "\n")
