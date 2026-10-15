# SECTION H — PANDAS JOIN AND AGGREGATION
import pandas as pd
# 75. Perform an inner join using customer_id.
customers_df = pd.read_csv("customer.csv")
orders_df = pd.read_csv("orders.csv")

df = pd.merge(orders_df, customers_df,
              on="customer_id", how="inner")
df["order_value"] = df["quantity"] * df["unit_price"]

# 76. Display order ID, customer name, city, product, status and order value.
print(df[["order_id", "customer_name", "city",
          "product", "status", "order_value"]])

# 77. Display only Delivered orders from Hyderabad.
print(df[(df["status"] == "Delivered") &
         (df["city"] == "Hyderabad")])

# 78. Calculate total orders, total sales and average order value by city.
summary = df.groupby("city").agg(
    total_orders=("order_id", "count"),
    total_sales=("order_value", "sum"),
    average_order_value=("order_value", "mean")
).reset_index()

# 79. Sort city results by total sales descending.
summary = summary.sort_values("total_sales", ascending=False)
print(summary)

# 80. Write result to city_sales_summary.csv.
summary.to_csv("city_sales_summary.csv", index=False)

# 81. Write result to city_sales_summary.json using record-oriented JSON.
summary.to_json("city_sales_summary.json",
                orient="records", indent=4)
