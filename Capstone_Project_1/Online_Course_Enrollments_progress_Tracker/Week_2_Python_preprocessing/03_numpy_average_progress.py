"""Week 2 | Subtask 3: Use NumPy to calculate average progress."""
from pathlib import Path
import numpy as np
import pandas as pd

DATA = Path(__file__).resolve().parents[1] / "data"
df = pd.read_csv(DATA / "progress_cleaned.csv")

completion = df["completion"].to_numpy()

print("Average progress (all students):", round(np.mean(completion), 2), "%")
print("Median progress:                ", round(np.median(completion), 2), "%")
print("Standard deviation:             ", round(np.std(completion), 2))
print("Students below 50%:             ", int(np.sum(completion < 50)))
print("Students who completed (100%):  ", int(np.sum(completion == 100)))
