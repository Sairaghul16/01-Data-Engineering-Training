// ============================================================
// Week 1 | Subtask 4: MongoDB - optional feedback / reviews (JSON)
// Run:  mongosh < 01_sample_feedback.js
// ============================================================
use("course_tracker");

db.feedback.drop();

db.feedback.insertMany([
  {
    student_id: 1,
    course_id: 1,
    rating: 5,
    comment: "Great introduction to Python!",
    tags: ["beginner-friendly", "clear"],
    created_at: new Date("2026-09-20")
  },
  {
    student_id: 1,
    course_id: 2,
    rating: 4,
    comment: "Good SQL examples, wanted more joins practice.",
    tags: ["practical"],
    created_at: new Date("2026-09-25")
  },
  {
    student_id: 2,
    course_id: 1,
    rating: 3,
    comment: "Pace was a bit fast.",
    tags: ["fast-paced"],
    created_at: new Date("2026-09-28")
  },
  {
    student_id: 3,
    course_id: 3,
    rating: 2,
    comment: "Dropped out - too much setup required.",
    tags: ["setup-issues"],
    created_at: new Date("2026-10-02")
  }
]);

// Quick checks
print("Total reviews:", db.feedback.countDocuments());
printjson(db.feedback.find({ course_id: 1 }).toArray());
printjson(db.feedback.aggregate([
  { $group: { _id: "$course_id", avg_rating: { $avg: "$rating" }, reviews: { $sum: 1 } } }
]).toArray());
