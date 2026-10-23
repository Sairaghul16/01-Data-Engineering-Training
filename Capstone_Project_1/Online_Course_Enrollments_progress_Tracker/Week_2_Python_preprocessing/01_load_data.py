"""Week 2 | Subtask 1: Load enrollment and progress data from CSV."""
from pathlib import Path
import pandas as pd

DATA = Path(__file__).resolve().parents[1] / "data"

df = pd.read_csv(DATA / "progress.csv")

print("Shape:", df.shape)
print("\nFirst rows:")
print(df.head())
print("\nMissing values per column:")
print(df.isna().sum())
print("\nCompletion range:", df["completion"].min(), "to", df["completion"].max())
