
import pandas as pd

# 44. Read hubs.csv.
shipments_df = pd.read_csv("shipments.csv")
hubs_df = pd.read_csv("hubs.csv")

# 45. Inner join shipments and hubs using hub_id.
joined = pd.merge(shipments_df, hubs_df, on="hub_id", how="inner")
print(joined)

# 46. Find total shipment cost handled by each hub.
# 47. Find total number of shipments handled by each hub.
summary = joined.groupby(["hub_id", "hub_name"]).agg(
    total_cost=("cost", "sum"),
    total_shipments=("shipment_id", "count")
).reset_index()

# 48. Sort hubs by total shipment cost.
summary = summary.sort_values("total_cost", ascending=False)
print(summary)

# 49. Save results to CSV.
summary.to_csv("hub_summary.csv", index=False)

# 50. Save results to JSON.
summary.to_json("hub_summary.json", orient="records", indent=4)
