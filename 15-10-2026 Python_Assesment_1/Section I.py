# SECTION I — NUMPY/PANDAS ENRICHMENT

import numpy as np
import pandas as pd

customers_df = pd.read_csv("customers.csv")
orders_df = pd.read_csv("orders.csv")

df = pd.merge(orders_df, customers_df,
              on="customer_id", how="inner")
df["order_value"] = df["quantity"] * df["unit_price"]



# 82. Create order_size using NumPy.
df["order_size"] = np.where(
    df["order_value"] >= 50000, "High",
    np.where(df["order_value"] >= 15000, "Medium", "Low")
)

# 83. Create priority_customer.
df["priority_customer"] = np.where(
    df["segment"] == "Corporate", "Priority", "Normal"
)

# 84. Save enriched dataset as enriched_orders.csv.
df.to_csv("enriched_orders.csv", index=False)

print(df)
print("Enriched dataset saved successfully.")
