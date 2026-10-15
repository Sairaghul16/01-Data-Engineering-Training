
import pandas as pd

# 61. Read orders.csv
df = pd.read_csv("orders.csv", iterator=False)

# 62. Display first 5 rows
print(df.head())

# 63. Display column names and datatypes
print(df.dtypes)

# 64. Display shape
print(df.shape)

# 65. Filter Delivered orders using query()
print(df.query("status == 'Delivered'"))

# 66. Filter quantity greater than 2
print(df[df["quantity"] > 2])

# 67. Calculate order_value
df["order_value"] = df["quantity"] * df["unit_price"]
print(df[["order_id", "order_value"]])

# 68. Count orders by status
print(df["status"].value_counts())

# 69. Convert order_date to datetime
df["order_date"] = pd.to_datetime(df["order_date"])

# 70. Create month column
df["month"] = df["order_date"].dt.month
print(df[["order_date", "month"]])

# 71. Count orders by month and status
print(df.groupby(["month", "status"]).size())

# 72. Total order value by category
print(df.groupby("category")["order_value"].sum())

# 73. Average order value by category
print(df.groupby("category")["order_value"].mean())

# 74. Sort by order value descending
print(df.sort_values("order_value", ascending=False))
