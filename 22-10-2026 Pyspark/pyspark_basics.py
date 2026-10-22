!pip install pyspark


from pyspark.sql import SparkSession

spark = SparkSession.builder \
    .appName("Pyspark Training") \
    .getOrCreate()

print("PySpark Session Created Successfully!")



print(spark)
print(spark.version)

