
import pandas as pd

# 36. Read shipments.csv.
df = pd.read_csv("shipments.csv")

# 37. Filter Delivered shipments.
print(df[df["status"] == "Delivered"])

# 38. Count records by status.
print(df["status"].value_counts())

# 39. Convert shipment date to datetime.
df["shipment_date"] = pd.to_datetime(df["shipment_date"])

# 40. Count shipments by month and status.
df["month"] = df["shipment_date"].dt.month
print(df.groupby(["month", "status"]).size())

# 41. Calculate average cost by destination.
print(df.groupby("destination")["cost"].mean())

# 42. Calculate total weight by destination.
print(df.groupby("destination")["weight"].sum())

# 43. Read only selected columns using a dynamic usecols list.
columns = ["shipment_id", "destination", "status", "cost"]
df_selected = pd.read_csv("shipments.csv", usecols=columns)
print(df_selected)
