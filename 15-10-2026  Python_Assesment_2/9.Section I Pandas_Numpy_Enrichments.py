
import pandas as pd
import numpy as np

# 51. Add cost_per_kg = cost / weight.
df = pd.read_csv("shipments.csv")
df["cost_per_kg"] = np.where(
    df["weight"] != 0,
    df["cost"] / df["weight"],
    0
)

# 52. Use NumPy to classify cost >= 1200 as Expensive.
df["cost_category"] = np.where(
    df["cost"] >= 1200, "Expensive", "Normal"
)

# 53. Add a shipment performance category based on status and cost.
conditions = [
    (df["status"] == "Delivered") & (df["cost"] >= 1200),
    (df["status"] == "Delivered") & (df["cost"] < 1200),
    df["status"] == "In Transit",
    df["status"] == "Pending"
]

categories = [
    "High Cost Delivered",
    "Standard Delivered",
    "In Progress",
    "Pending Shipment"
]

df["performance_category"] = np.select(
    conditions, categories, default="Other"
)

# 54. Save the final enriched dataset as shipment_analysis.csv.
df.to_csv("shipment_analysis.csv", index=False)

print(df)
print("Shipment analysis saved successfully.")
