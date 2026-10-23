"""Week 2 - Step 1: Load the four raw CSV files and clean invalid entries.

Reads  : data/raw/students.csv, courses.csv, enrollments.csv, progress.csv
Writes : data/cleaned/students_cleaned.csv, courses_cleaned.csv,
         enrollments_cleaned.csv, progress_cleaned.csv
"""
from pathlib import Path

import numpy as np
import pandas as pd

BASE = Path(__file__).resolve().parent
RAW = BASE / "data" / "raw"
CLEANED = BASE / "data" / "cleaned"
CLEANED.mkdir(parents=True, exist_ok=True)


def clean_students(df: pd.DataFrame) -> pd.DataFrame:
    n = len(df)
    df = df.drop_duplicates().drop_duplicates(subset=["student_id"])

    # Missing / blank names -> drop
    df["student_name"] = df["student_name"].astype("string").str.strip()
    df = df[df["student_name"].notna() & (df["student_name"] != "")]

    # Invalid / missing dates -> drop
    df["join_date"] = pd.to_datetime(df["join_date"], errors="coerce")
    df = df.dropna(subset=["join_date"])

    print(f"Students    : {n} -> {len(df)} rows")
    return df


def clean_courses(df: pd.DataFrame) -> pd.DataFrame:
    n = len(df)
    df = df.drop_duplicates().drop_duplicates(subset=["course_id"])

    # Missing / blank course names -> drop
    df["course_name"] = df["course_name"].astype("string").str.strip()
    df = df[df["course_name"].notna() & (df["course_name"] != "")]

    # Numbers: convert, bad text -> NaN
    df["duration_hours"] = pd.to_numeric(df["duration_hours"], errors="coerce")
    df["price"] = pd.to_numeric(df["price"], errors="coerce")

    # Negative or missing price is invalid -> drop
    df = df[df["price"].notna() & (df["price"] >= 0)]

    # Missing duration -> fill with the median duration
    df["duration_hours"] = df["duration_hours"].fillna(df["duration_hours"].median())

    print(f"Courses     : {n} -> {len(df)} rows")
    return df


def clean_enrollments(df: pd.DataFrame, students: pd.DataFrame, courses: pd.DataFrame) -> pd.DataFrame:
    n = len(df)
    df = df.drop_duplicates().drop_duplicates(subset=["enrollment_id"])

    # Invalid / missing dates -> drop
    df["enrollment_date"] = pd.to_datetime(df["enrollment_date"], errors="coerce")
    df = df.dropna(subset=["enrollment_date"])

    # Student and course must exist in the cleaned files
    df = df[df["student_id"].isin(students["student_id"])]
    df = df[df["course_id"].isin(courses["course_id"])]

    print(f"Enrollments : {n} -> {len(df)} rows")
    return df


def clean_progress(df: pd.DataFrame, enrollments: pd.DataFrame) -> pd.DataFrame:
    n = len(df)
    df = df.drop_duplicates().drop_duplicates(subset=["progress_id"])

    # Percentages: strip "%" signs, convert to number, bad text -> NaN
    df["completion"] = (
        df["completion"].astype("string").str.replace("%", "", regex=False).str.strip()
    )
    df["completion"] = pd.to_numeric(df["completion"], errors="coerce")

    # Missing percentages -> 0, then keep values between 0 and 100
    df["completion"] = df["completion"].fillna(0)
    df["completion"] = np.clip(df["completion"], 0, 100)

    # Invalid / missing dates -> drop
    df["last_accessed"] = pd.to_datetime(df["last_accessed"], errors="coerce")
    df = df.dropna(subset=["last_accessed"])

    # Must belong to a valid (cleaned) enrollment
    df = df[df["enrollment_id"].isin(enrollments["enrollment_id"])]

    print(f"Progress    : {n} -> {len(df)} rows")
    return df


if __name__ == "__main__":
    students = pd.read_csv(RAW / "students.csv")
    courses = pd.read_csv(RAW / "courses.csv")
    enrollments = pd.read_csv(RAW / "enrollments.csv")
    progress = pd.read_csv(RAW / "progress.csv")

    # Order matters: parent tables first, then the tables that depend on them
    students_c = clean_students(students)
    courses_c = clean_courses(courses)
    enrollments_c = clean_enrollments(enrollments, students_c, courses_c)
    progress_c = clean_progress(progress, enrollments_c)

    students_c.to_csv(CLEANED / "students_cleaned.csv", index=False)
    courses_c.to_csv(CLEANED / "courses_cleaned.csv", index=False)
    enrollments_c.to_csv(CLEANED / "enrollments_cleaned.csv", index=False)
    progress_c.to_csv(CLEANED / "progress_cleaned.csv", index=False)
    print("Saved 4 cleaned files to data/cleaned/")
