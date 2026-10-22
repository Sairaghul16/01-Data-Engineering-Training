import pandas as pd

# 80. Read CSV into a DataFrame

df = pd.read_csv("registrations.csv")

# Convert amount and tickets to numeric datatypes

df["amount"] = pd.to_numeric(df["amount"])
df["tickets"] = pd.to_numeric(df["tickets"])

# 81. Display first 5 rows

print("First 5 Rows:")
print(df.head(5))

# Display last 5 rows

print("Last 5 Rows:")
print(df.tail(5))

# Display shape

print("Shape:")
print(df.shape)

# Display columns

print("Columns:")
print(df.columns)

# Display datatypes

print("Datatypes:")
print(df.dtypes)


# 82. Display selected columns

print("Selected Columns:")
print(df[["attendee_name", "city", "status", "amount"]])


# 83. Confirmed registrations using query()

print("Confirmed Registrations:")
print(df.query("status == 'Confirmed'"))


# 84. Registrations whose amount exceeds 6000

print("Amount Greater Than 6000:")
print(df.query("amount > 6000"))


# 85. Confirmed registrations from Hyderabad

print("Confirmed Registrations from Hyderabad:")
print(df.query("status == 'Confirmed' and city == 'Hyderabad'"))


# 86. Count registrations by status

print("Registration Count by Status:")
print(df.groupby("status").size())


# 87. Total amount by status

print("Total Amount by Status:")
print(df.groupby("status")["amount"].sum())


# 88. Average amount by city

print("Average Amount by City:")
print(df.groupby("city")["amount"].mean())
