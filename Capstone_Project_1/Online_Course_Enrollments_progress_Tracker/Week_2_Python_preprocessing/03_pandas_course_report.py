"""Week 2 | Subtask 4: Use pandas to group by course and compute average completion rates."""
from pathlib import Path
import pandas as pd

DATA = Path(__file__).resolve().parents[1] / "data"
df = pd.read_csv(DATA / "progress_cleaned.csv")
courses = pd.read_csv(DATA / "courses.csv")

summary = (
    df.groupby("course_id")["completion"]
      .agg(students="count", avg_completion="mean")
      .round(2)
      .reset_index()
      .merge(courses[["course_id", "title"]], on="course_id")
      .sort_values("avg_completion", ascending=False)
)

print("Course-level average completion")
print(summary.to_string(index=False))

summary.to_csv(DATA / "course_summary.csv", index=False)
