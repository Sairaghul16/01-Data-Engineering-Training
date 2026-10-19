// String
db.datatypes.find({ name: { $type: "string" } })

// Integer
db.datatypes.find({ age: { $type: "int" } })

// Double
db.datatypes.find({ price: { $type: "double" } })

// Boolean
db.datatypes.find({ available: { $type: "bool" } })

// Array
db.datatypes.find({ colors: { $type: "array" } })

// Object
db.datatypes.find({ address: { $type: "object" } })

// Date
db.datatypes.find({ joining_date: { $type: "date" } })

// Null
db.datatypes.find({ middle_name: { $type: "null" } })

// Decimal
db.datatypes.find({ salary: { $type: "decimal" } })

// ObjectId
db.datatypes.find({ ref_id: { $type: "objectId" } })
