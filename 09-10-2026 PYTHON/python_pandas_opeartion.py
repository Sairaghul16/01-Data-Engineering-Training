import pandas as pd

from excerxise_1 import delivered

df = pd.read_csv("orders.csv")

print(df)

print(df.head())

print(df.tail())

print(df.info())

print(df.dtypes)

print(df.columns)

print(df.shape)

print(df["product"])

print(df[["order_id","product","amount"]])

#filter
delivered=df.query("status == 'Delivered' ")
print(delivered)

result=df.query("amount>10000")
print(result)

print(df["status"].value_counts())

result=(df.groupby("status").size())
print(result)






