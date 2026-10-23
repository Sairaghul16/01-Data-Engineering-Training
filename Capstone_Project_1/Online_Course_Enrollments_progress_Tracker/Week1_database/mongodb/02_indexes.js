// ============================================================
// Week 1 | Subtask 5 (MongoDB part): Indexes
// Run:  mongosh < 02_indexes.js
// ============================================================
use("course_tracker");

// Fast search by student or course
db.feedback.createIndex({ student_id: 1 });
db.feedback.createIndex({ course_id: 1 });

// Compound index: one student's review for one course
db.feedback.createIndex({ student_id: 1, course_id: 1 });

// List indexes
printjson(db.feedback.getIndexes());

// Confirm an index is used
printjson(db.feedback.find({ student_id: 1 }).explain("executionStats").queryPlanner.winningPlan);
