"""Week 2 | Subtask 2: Clean invalid entries (missing names, dates, percentages).

Output: data/progress_cleaned.csv  (used by Subtasks 3 and 4, and by Weeks 3-5)
"""
from pathlib import Path
import numpy as np
import pandas as pd

DATA = Path(__file__).resolve().parents[1] / "data"
df = pd.read_csv(DATA / "progress.csv")
rows_before = len(df)

# 1. Missing names -> drop (a record without a student name cannot be followed up)
df = df.dropna(subset=["student_name"])

# 2. Invalid / missing dates -> convert, bad values become NaT, then drop
df["enrollment_date"] = pd.to_datetime(df["enrollment_date"], errors="coerce")
df = df.dropna(subset=["enrollment_date"])

# 3. Missing percentages -> 0, out-of-range values -> clip between 0 and 100
df["completion"] = df["completion"].fillna(0)
df["completion"] = np.clip(df["completion"], 0, 100)

# 4. Remove duplicate enrollments
df = df.drop_duplicates(subset=["enrollment_id"])

df.to_csv(DATA / "progress_cleaned.csv", index=False)

print(f"Rows before: {rows_before} | after cleaning: {len(df)}")
print(df.head())
