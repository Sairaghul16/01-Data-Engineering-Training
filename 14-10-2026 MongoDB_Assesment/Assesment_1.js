// MONGODB PRACTICAL ASSESSMENT 1
// Database: commerce_assessment

use commerce_assessment

// PART 1 — DATABASE SETUP

db.createCollection("products")

db.products.insertMany([
  {
    product_id: 101,
    product_name: "Ultra Laptop",
    category: "Electronics",
    brand: "TechPro",
    price: 72000,
    stock: 12,
    available: true,
    launch_date: ISODate("2026-01-15"),
    colors: ["Black", "Silver"],
    specifications: {
      ram: "16 GB",
      storage: "1 TB SSD",
      warranty_years: 2
    }
  },
  {
    product_id: 102,
    product_name: "Wireless Mouse",
    category: "Accessories",
    brand: "ClickMax",
    price: 1800,
    stock: 40,
    available: true,
    launch_date: ISODate("2026-02-10"),
    colors: ["Black", "Blue", "Red"],
    specifications: {
      wireless: true,
      warranty_years: 1
    }
  },
  {
    product_id: 103,
    product_name: "Office Desk",
    category: "Furniture",
    brand: "WorkSpace",
    price: 14500,
    stock: 8,
    available: true,
    launch_date: ISODate("2025-11-20"),
    colors: ["Brown", "Black"],
    specifications: {
      material: "Wood",
      adjustable: false,
      warranty_years: 3
    }
  },
  {
    product_id: 104,
    product_name: "Smart Monitor",
    category: "Electronics",
    brand: "VisionPlus",
    price: 26000,
    stock: 5,
    available: true,
    launch_date: ISODate("2026-03-01"),
    colors: ["Black"],
    specifications: {
      screen_size: "27 inch",
      resolution: "4K",
      warranty_years: 2
    }
  },
  {
    product_id: 105,
    product_name: "Gaming Chair",
    category: "Furniture",
    brand: "SeatPro",
    price: 18500,
    stock: 0,
    available: false,
    launch_date: ISODate("2026-01-05"),
    colors: ["Black", "Red"],
    specifications: {
      material: "Leather",
      adjustable: true,
      warranty_years: 3
    }
  },
  {
    product_id: 106,
    product_name: "Mechanical Keyboard",
    category: "Accessories",
    brand: "KeyWorks",
    price: 5200,
    stock: 18,
    available: true,
    launch_date: ISODate("2026-04-12"),
    colors: ["Black", "White"],
    specifications: {
      backlit: true,
      wireless: false,
      warranty_years: 1
    }
  }
])

// PART 2 — CRUD OPERATIONS

// 1. Display all products.
db.products.find()

// 2. Display only one product having product_id = 103.
db.products.findOne({ product_id: 103 })

// 3. Insert a new product with Product ID 107, Product Name Bluetooth Speaker, Category Electronics, Brand SoundMax, Price 7500, Stock 20, Available true.
db.products.insertOne({
  product_id: 107,
  product_name: "Bluetooth Speaker",
  category: "Electronics",
  brand: "SoundMax",
  price: 7500,
  stock: 20,
  available: true
})

// 4. Insert two additional products in a single operation.
db.products.insertMany([
  {
    product_id: 108,
    product_name: "USB Cable",
    category: "Accessories",
    brand: "WirePro",
    price: 500,
    stock: 50,
    available: true
  },
  {
    product_id: 109,
    product_name: "Bookshelf",
    category: "Furniture",
    brand: "HomeCraft",
    price: 6500,
    stock: 10,
    available: true
  }
])

// 5. Update the price of product 102 to 2000.
db.products.updateOne(
  { product_id: 102 },
  { $set: { price: 2000 } }
)

// 6. Update both stock and availability of product 105.
db.products.updateOne(
  { product_id: 105 },
  { $set: { stock: 6, available: true } }
)

// 7. Increase the stock of product 104 by 10.
db.products.updateOne(
  { product_id: 104 },
  { $inc: { stock: 10 } }
)

// 8. Reduce the stock of product 106 by 3.
db.products.updateOne(
  { product_id: 106 },
  { $inc: { stock: -3 } }
)

// 9. Add a new field called discount_percent with value 10 to product 101.
db.products.updateOne(
  { product_id: 101 },
  { $set: { discount_percent: 10 } }
)

// 10. Remove discount_percent from product 101.
db.products.updateOne(
  { product_id: 101 },
  { $unset: { discount_percent: "" } }
)

// 11. Delete one product using its product_id.
db.products.deleteOne({ product_id: 109 })

// 12. Delete all products where stock = 0.
db.products.deleteMany({ stock: 0 })

// 13. Verify the documents before and after each delete.
db.products.find({ stock: 0 })
db.products.deleteMany({ stock: 0 })
db.products.find({ stock: 0 })

// PART 3 — FILTERING AND QUERY OPERATORS

// 14. Find all Electronics products.
db.products.find({ category: "Electronics" })

// 15. Find products costing more than ₹10,000.
db.products.find({ price: { $gt: 10000 } })

// 16. Find products costing between ₹5,000 and ₹30,000.
db.products.find({
  price: { $gte: 5000, $lte: 30000 }
})

// 17. Find products whose stock is less than 10.
db.products.find({ stock: { $lt: 10 } })

// 18. Find products that are currently available.
db.products.find({ available: true })

// 19. Find products that are not available.
db.products.find({ available: false })

// 20. Find products belonging to either Electronics or Furniture.
db.products.find({
  category: { $in: ["Electronics", "Furniture"] }
})

// 21. Find products that are not in the Accessories category.
db.products.find({ category: { $ne: "Accessories" } })

// 22. Find products where price > 10000 AND stock > 5.
db.products.find({
  price: { $gt: 10000 },
  stock: { $gt: 5 }
})

// 23. Find products where category = Electronics OR price < 5000.
db.products.find({
  $or: [
    { category: "Electronics" },
    { price: { $lt: 5000 } }
  ]
})

// 24. Find products launched after 1 February 2026.
db.products.find({
  launch_date: { $gt: ISODate("2026-02-01") }
})

// 25. Find products launched between 1 January 2026 and 31 March 2026.
db.products.find({
  launch_date: {
    $gte: ISODate("2026-01-01"),
    $lt: ISODate("2026-04-01")
  }
})

// PART 4 — PROJECTION AND SORTING

// 26. Display only product_name and price. Do not display _id.
db.products.find(
  {},
  { _id: 0, product_name: 1, price: 1 }
)

// 27. Display product_name, category, stock.
db.products.find(
  {},
  { _id: 0, product_name: 1, category: 1, stock: 1 }
)

// 28. Sort products by price from lowest to highest.
db.products.find().sort({ price: 1 })

// 29. Sort products by price from highest to lowest.
db.products.find().sort({ price: -1 })

// 30. Sort products alphabetically by product name.
db.products.find().sort({ product_name: 1 })

// 31. Display the three most expensive products.
db.products.find().sort({ price: -1 }).limit(3)

// 32. Display the two products having the lowest stock.
db.products.find().sort({ stock: 1 }).limit(2)

// PART 5 — ARRAYS
// Use the existing colors field.

// 33. Find products available in Black.
db.products.find({ colors: "Black" })

// 34. Find products available in both Black and Silver.
db.products.find({
  colors: { $all: ["Black", "Silver"] }
})

// 35. Find products available in either White or Blue.
db.products.find({
  colors: { $in: ["White", "Blue"] }
})

// 36. Add Grey to product 101.
db.products.updateOne(
  { product_id: 101 },
  { $push: { colors: "Grey" } }
)

// 37. Add Black to product 101 without creating a duplicate if it already exists.
db.products.updateOne(
  { product_id: 101 },
  { $addToSet: { colors: "Black" } }
)

// 38. Remove Red from product 102.
db.products.updateOne(
  { product_id: 102 },
  { $pull: { colors: "Red" } }
)

// 39. Display products having more than one color.
db.products.find({ "colors.1": { $exists: true } })

// PART 6 — EMBEDDED DOCUMENTS
// Use the existing specifications embedded document.

// 40. Find products whose warranty is 2 years.
db.products.find({ "specifications.warranty_years": 2 })

// 41. Find products where specifications.adjustable = true.
db.products.find({ "specifications.adjustable": true })

// 42. Find products with specifications.wireless = true.
db.products.find({ "specifications.wireless": true })

// 43. Change the warranty of product 103 from 3 to 5 years.
db.products.updateOne(
  { product_id: 103 },
  { $set: { "specifications.warranty_years": 5 } }
)

// 44. Add specifications.country_of_origin to any two products.
db.products.updateOne(
  { product_id: 101 },
  { $set: { "specifications.country_of_origin": "India" } }
)
db.products.updateOne(
  { product_id: 102 },
  { $set: { "specifications.country_of_origin": "China" } }
)

// 45. Find products manufactured in the country you added.
db.products.find({
  "specifications.country_of_origin": "India"
})

// PART 7 — DATA TYPES

// 46. Find documents where price is stored as a numeric type.
db.products.find({
  price: { $type: ["double", "int", "long", "decimal"] }
})

// 47. Find the datatype of launch_date.
db.products.aggregate([
  {
    $project: {
      product_name: 1,
      launch_date_type: { $type: "$launch_date" }
    }
  }
])

// 48. Find the datatype of colors.
db.products.aggregate([
  {
    $project: {
      product_name: 1,
      colors_type: { $type: "$colors" }
    }
  }
])

// 49. Find the datatype of specifications.
db.products.aggregate([
  {
    $project: {
      product_name: 1,
      specifications_type: { $type: "$specifications" }
    }
  }
])

// 50. Insert one intentionally incorrect product where price is stored as a string instead of a number. Do not copy an existing product.
db.products.insertOne({
  product_id: 110,
  product_name: "Test String Price",
  category: "Accessories",
  brand: "DemoBrand",
  price: "25000",
  stock: 2,
  available: true
})

// 51. Write a query that identifies products where price is stored as a string.
db.products.find({ price: { $type: "string" } })

// 52. Correct that product so price becomes numeric.
db.products.updateOne(
  { product_id: 110 },
  [{ $set: { price: { $toDouble: "$price" } } }]
)

// PART 8 — CUSTOMERS COLLECTION

db.createCollection("customers")

db.customers.insertMany([
  {
    customer_id: 501,
    customer_name: "Aditya Rao",
    email: "aditya@email.com",
    active: true,
    address: {
      city: "Hyderabad",
      state: "Telangana",
      pincode: "500081"
    },
    interests: ["Electronics", "Accessories"]
  },
  {
    customer_id: 502,
    customer_name: "Maya Thomas",
    email: "maya@email.com",
    active: true,
    address: {
      city: "Chennai",
      state: "Tamil Nadu",
      pincode: "600028"
    },
    interests: ["Furniture", "Home"]
  },
  {
    customer_id: 503,
    customer_name: "Faisal Ahmed",
    email: "faisal@email.com",
    active: false,
    address: {
      city: "Hyderabad",
      state: "Telangana",
      pincode: "500034"
    },
    interests: ["Electronics"]
  },
  {
    customer_id: 504,
    customer_name: "Nikita Shah",
    email: "nikita@email.com",
    active: true,
    address: {
      city: "Mumbai",
      state: "Maharashtra",
      pincode: "400050"
    },
    interests: ["Furniture", "Electronics"]
  }
])

// 53. Display all customers.
db.customers.find()

// 54. Find active customers.
db.customers.find({ active: true })

// 55. Find customers from Hyderabad.
db.customers.find({ "address.city": "Hyderabad" })

// 56. Find customers interested in Electronics.
db.customers.find({ interests: "Electronics" })

// 57. Find customers interested in both Furniture and Electronics.
db.customers.find({
  interests: { $all: ["Furniture", "Electronics"] }
})

// 58. Change customer 503 from inactive to active.
db.customers.updateOne(
  { customer_id: 503 },
  { $set: { active: true } }
)

// 59. Change customer 504's city.
db.customers.updateOne(
  { customer_id: 504 },
  { $set: { "address.city": "Chennai" } }
)

// 60. Add a new interest to customer 502.
db.customers.updateOne(
  { customer_id: 502 },
  { $addToSet: { interests: "Electronics" } }
)

// PART 9 — ARRAY OF EMBEDDED DOCUMENTS

db.createCollection("orders")

db.orders.insertMany([
  {
    order_id: 9001,
    customer_id: 501,
    order_date: ISODate("2026-09-01"),
    status: "Delivered",
    items: [
      {
        product: "Ultra Laptop",
        quantity: 1,
        price: 72000
      },
      {
        product: "Wireless Mouse",
        quantity: 2,
        price: 2000
      }
    ]
  },
  {
    order_id: 9002,
    customer_id: 502,
    order_date: ISODate("2026-09-03"),
    status: "Processing",
    items: [
      {
        product: "Office Desk",
        quantity: 1,
        price: 14500
      }
    ]
  },
  {
    order_id: 9003,
    customer_id: 503,
    order_date: ISODate("2026-09-05"),
    status: "Delivered",
    items: [
      {
        product: "Smart Monitor",
        quantity: 2,
        price: 26000
      },
      {
        product: "Mechanical Keyboard",
        quantity: 1,
        price: 5200
      }
    ]
  }
])

// 61. Display orders having status Delivered.
db.orders.find({ status: "Delivered" })

// 62. Find orders containing Ultra Laptop.
db.orders.find({ "items.product": "Ultra Laptop" })

// 63. Find orders containing an item with quantity greater than 1.
db.orders.find({ "items.quantity": { $gt: 1 } })

// 64. Find orders containing product = Smart Monitor AND quantity = 2 where both conditions belong to the same item.
db.orders.find({
  items: {
    $elemMatch: {
      product: "Smart Monitor",
      quantity: 2
    }
  }
})

// 65. Add another item to order 9002.
db.orders.updateOne(
  { order_id: 9002 },
  {
    $push: {
      items: {
        product: "Wireless Mouse",
        quantity: 2,
        price: 2000
      }
    }
  }
)

// 66. Change order 9002 status to Delivered.
db.orders.updateOne(
  { order_id: 9002 },
  { $set: { status: "Delivered" } }
)

// 67. Remove one item from an order.
db.orders.updateOne(
  { order_id: 9002 },
  { $pull: { items: { product: "Office Desk" } } }
)



// PART 10 — DOCUMENT DESIGN

// 68. Product can have five colors.
"Array"

// 69. Customer has one residential address.
"Embedded Document"

// 70. Order contains multiple products.
"Array of Embedded Documents"

// 71. Product has RAM, storage and processor information.
"Embedded Document"

// 72. Customer can have thousands of orders over many years.
"Separate Collection / Reference"

// 73. Product can have millions of customer reviews.
"Separate Collection / Reference"

// 74. Employee has first name and last name.
"Simple Field"

// 75. Product has multiple tags.
"Array"



db.createCollection("suppliers")

db.suppliers.insertMany([
  {
    supplier_id: 701,
    supplier_name: "TechSource India",
    city: "Chennai",
    active: true,
    categories: ["Electronics", "Accessories"],
    contact: {
      person: "Arun Kumar",
      phone: "9000000001",
      email: "arun@techsource.example"
    },
    warehouses: ["Chennai", "Bengaluru"],
    registration_date: ISODate("2026-01-15")
  },
  {
    supplier_id: 702,
    supplier_name: "HomeWorks Supply",
    city: "Madurai",
    active: true,
    categories: ["Furniture", "Home"],
    contact: {
      person: "Meena Raj",
      phone: "9000000002",
      email: "meena@homeworks.example"
    },
    warehouses: ["Madurai", "Coimbatore"],
    registration_date: ISODate("2026-02-10")
  },
  {
    supplier_id: 703,
    supplier_name: "Gadget Hub",
    city: "Hyderabad",
    active: false,
    categories: ["Electronics", "Accessories"],
    contact: {
      person: "Faisal Khan",
      phone: "9000000003",
      email: "faisal@gadgethub.example"
    },
    warehouses: ["Hyderabad", "Vijayawada"],
    registration_date: ISODate("2025-12-20")
  },
  {
    supplier_id: 704,
    supplier_name: "Office Essentials",
    city: "Mumbai",
    active: true,
    categories: ["Furniture", "Stationery"],
    contact: {
      person: "Nikita Shah",
      phone: "9000000004",
      email: "nikita@officeessentials.example"
    },
    warehouses: ["Mumbai", "Pune"],
    registration_date: ISODate("2026-04-05")
  },
  {
    supplier_id: 705,
    supplier_name: "Smart Devices Co",
    city: "Coimbatore",
    active: true,
    categories: ["Electronics", "Home"],
    contact: {
      person: "Priya S",
      phone: "9000000005",
      email: "priya@smartdevices.example"
    },
    warehouses: ["Coimbatore", "Chennai"],
    registration_date: ISODate("2026-05-12")
  }
])

// 76. Display all active suppliers.
db.suppliers.find({ active: true })

// 77. Find suppliers from a city of your choice.
db.suppliers.find({ city: "Madurai" })

// 78. Find suppliers handling Electronics.
db.suppliers.find({ categories: "Electronics" })

// 79. Find suppliers registered after 1 January 2026.
db.suppliers.find({
  registration_date: { $gt: ISODate("2026-01-01") }
})

// 80. Add another warehouse to one supplier.
db.suppliers.updateOne(
  { supplier_id: 701 },
  { $addToSet: { warehouses: "Tiruchirappalli" } }
)

// 81. Change the active status of one supplier.
db.suppliers.updateOne(
  { supplier_id: 703 },
  { $set: { active: true } }
)

// 82. Remove one category from one supplier.
db.suppliers.updateOne(
  { supplier_id: 704 },
  { $pull: { categories: "Furniture" } }
)

// 83. Display supplier name and city only.
db.suppliers.find(
  {},
  { _id: 0, supplier_name: 1, city: 1 }
)

// 84. Sort suppliers by registration date.
db.suppliers.find().sort({ registration_date: 1 })

// 85. Explain briefly why you used an array for categories,
// an embedded document for contact details,
// and an array for warehouse locations.

// Array for categories:
// A supplier can supply multiple product categories.
// Example: ["Electronics", "Accessories"]

// Embedded document for contact details:
// Contact information contains related fields such as person, phone, and email.
// Example: { person: "Arun Kumar", phone: "9000000001", email: "arun@example.com" }

// Array for warehouse locations:
// A supplier can have multiple warehouses in different locations.
// Example: ["Chennai", "Bengaluru"]
