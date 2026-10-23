"""Week 2 | Subtask 3: Use NumPy to calculate average progress."""
from pathlib import Path
import numpy as np
import pandas as pd

DATA = Path(__file__).resolve().parents[1] / "data"
df = pd.read_csv(DATA / "progress_cleaned.csv")

completion = df["completion"].to_numpy()

print("Average progress (all students):", round(np.mean(completion), 2), "%")
