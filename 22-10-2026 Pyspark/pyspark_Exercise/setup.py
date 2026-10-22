!pip install pyspark

from pyspark.sql import SparkSession

spark = SparkSession.builder \
    .appName("Pyspark Training") \
    .getOrCreate()

print("PySpark Session Created Successfully!")

from google.colab import files
uploaded = files.upload()

Select:

retail_transactions_100k.csv

Then read it:

df = spark.read.csv(
"retail_transactions_100k.csv",
header=True,
inferSchema=True
)

Display:

df.show()

Check schema:

df.printSchema()

Check number of records:

df.count()


from pyspark.sql import functions as F
from pyspark.sql.functions import col, when, lit, sum, avg, min, max, count, year, month, dayofmonth, to_date, coalesce


