"""Week 3 - Course analysis with PySpark.

Loads the cleaned enrollment, progress and course data, joins them, and
produces a course-wise summary plus the top completed and top dropped-out courses.

Run from the repo root:
    python week3_pyspark/course_analysis.py
"""
from pathlib import Path
from pyspark.sql import SparkSession, functions as F

ROOT = Path(__file__).resolve().parents[1]
CLEAN = ROOT / "data" / "clean"
OUT = ROOT / "week3_pyspark" / "output"

spark = (SparkSession.builder.appName("CourseAnalysis")
         .master("local[*]").config("spark.sql.shuffle.partitions", "4").getOrCreate())
spark.sparkContext.setLogLevel("WARN")


read = lambda f: spark.read.csv(str(CLEAN / f), header=True, inferSchema=True)
enrollments, progress, courses = read("enrollments_clean.csv"), read("progress_clean.csv"), read("courses.csv")


joined = (enrollments
          .join(progress.select("enrollment_id", "completion"), "enrollment_id", "inner")
          .join(courses.select("course_id", "course_name"), "course_id", "inner"))


summary = (joined.groupBy("course_id", "course_name")
           .agg(F.count("*").alias("total_enrolled"),
                F.sum(F.when(F.col("status") == "completed", 1).otherwise(0)).alias("completed"),
                F.sum(F.when(F.col("status") == "dropped", 1).otherwise(0)).alias("dropped"),
                F.round(F.avg("completion"), 2).alias("avg_progress"))
           .withColumn("completion_rate_pct", F.round(100 * F.col("completed") / F.col("total_enrolled"), 1))
           .withColumn("dropout_rate_pct", F.round(100 * F.col("dropped") / F.col("total_enrolled"), 1)))

summary = summary.orderBy(F.desc("total_enrolled"), "course_id")

print("Course summary")
summary.show(truncate=False)

print("Top 5 COMPLETED courses")
top_completed = (summary
                 .orderBy(F.desc("completed"), F.desc("completion_rate_pct"), "course_name")
                 .limit(5))
top_completed.select("course_name", "completed", "completion_rate_pct").show(truncate=False)

print("Top 5 DROPPED-OUT courses")
top_dropped = (summary.filter(F.col("dropped") > 0)
               .orderBy(F.desc("dropped"), F.desc("dropout_rate_pct"), "course_name")
               .limit(5))
top_dropped.select("course_name", "dropped", "dropout_rate_pct").show(truncate=False)


OUT.mkdir(parents=True, exist_ok=True)
summary.toPandas().to_csv(OUT / "course_summary.csv", index=False)
top_completed.toPandas().to_csv(OUT / "top_completed.csv", index=False)
top_dropped.toPandas().to_csv(OUT / "top_dropped.csv", index=False)
spark.stop()
