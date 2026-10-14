// MONGODB PRACTICAL ASSESSMENT 2 — FOOD DELIVERY
// Database: food_delivery_assessment

use food_delivery_assessment

// DATA SETUP — RESTAURANTS

db.restaurants.insertMany([
  {
    restaurant_id: 101,
    restaurant_name: "Spice Kitchen",
    city: "Hyderabad",
    cuisine: ["Indian", "Biryani"],
    rating: 4.5,
    active: true,
    contact: {
      phone: "9876543210",
      email: "spice@email.com"
    }
  },
  {
    restaurant_id: 102,
    restaurant_name: "Urban Pizza",
    city: "Mumbai",
    cuisine: ["Italian", "Fast Food"],
    rating: 4.2,
    active: true,
    contact: {
      phone: "9988776655",
      email: "pizza@email.com"
    }
  },
  {
    restaurant_id: 103,
    restaurant_name: "Green Bowl",
    city: "Bangalore",
    cuisine: ["Healthy", "Vegetarian"],
    rating: 4.7,
    active: true,
    contact: {
      phone: "9123456780",
      email: "green@email.com"
    }
  },
  {
    restaurant_id: 104,
    restaurant_name: "Burger Point",
    city: "Hyderabad",
    cuisine: ["Fast Food", "Burgers"],
    rating: 3.9,
    active: false,
    contact: {
      phone: "9000011111",
      email: "burger@email.com"
    }
  },
  {
    restaurant_id: 105,
    restaurant_name: "Asian Wok",
    city: "Delhi",
    cuisine: ["Chinese", "Thai"],
    rating: 4.4,
    active: true,
    contact: {
      phone: "9222233333",
      email: "wok@email.com"
    }
  }
])

// DATA SETUP — ORDERS

db.orders.insertMany([
  {
    order_id: 5001,
    restaurant_id: 101,
    customer_name: "Adil",
    order_date: ISODate("2026-09-01"),
    status: "Delivered",
    items: [
      { name: "Chicken Biryani", quantity: 2, price: 320 },
      { name: "Coke", quantity: 2, price: 60 }
    ],
    delivery: {
      city: "Hyderabad",
      fee: 40
    }
  },
  {
    order_id: 5002,
    restaurant_id: 102,
    customer_name: "Megha",
    order_date: ISODate("2026-09-02"),
    status: "Processing",
    items: [
      { name: "Farmhouse Pizza", quantity: 1, price: 550 }
    ],
    delivery: {
      city: "Mumbai",
      fee: 60
    }
  },
  {
    order_id: 5003,
    restaurant_id: 103,
    customer_name: "Kabir",
    order_date: ISODate("2026-09-03"),
    status: "Delivered",
    items: [
      { name: "Protein Bowl", quantity: 2, price: 400 },
      { name: "Juice", quantity: 1, price: 150 }
    ],
    delivery: {
      city: "Bangalore",
      fee: 50
    }
  },
  {
    order_id: 5004,
    restaurant_id: 101,
    customer_name: "Nisha",
    order_date: ISODate("2026-09-04"),
    status: "Cancelled",
    items: [
      { name: "Veg Biryani", quantity: 1, price: 250 }
    ],
    delivery: {
      city: "Hyderabad",
      fee: 40
    }
  },
  {
    order_id: 5005,
    restaurant_id: 105,
    customer_name: "Rohan",
    order_date: ISODate("2026-09-05"),
    status: "Delivered",
    items: [
      { name: "Thai Curry", quantity: 1, price: 480 },
      { name: "Noodles", quantity: 2, price: 300 }
    ],
    delivery: {
      city: "Delhi",
      fee: 70
    }
  }
])

// CRUD AND BASIC QUERIES

// 1. Display all restaurants.
db.restaurants.find()

// 2. Find only restaurants from Hyderabad.
db.restaurants.find({ city: "Hyderabad" })

// 3. Find active restaurants having rating greater than 4.3.
db.restaurants.find({
  active: true,
  rating: { $gt: 4.3 }
})

// 4. Insert one new restaurant of your choice.
db.restaurants.insertOne({
  restaurant_id: 106,
  restaurant_name: "Tasty Treats",
  city: "Chennai",
  cuisine: ["Indian", "Desserts"],
  rating: 4.1,
  active: true,
  contact: {
    phone: "9876501234",
    email: "tasty@email.com"
  }
})

// 5. Change the rating of restaurant 104.
db.restaurants.updateOne(
  { restaurant_id: 104 },
  { $set: { rating: 4.1 } }
)

// 6. Change restaurant 104 from inactive to active.
db.restaurants.updateOne(
  { restaurant_id: 104 },
  { $set: { active: true } }
)

// 7. Delete the restaurant you inserted in Question 4.
db.restaurants.deleteOne({ restaurant_id: 106 })

// ARRAYS AND EMBEDDED DOCUMENTS

// 8. Find restaurants serving Fast Food.
db.restaurants.find({ cuisine: "Fast Food" })

// 9. Find restaurants serving both Italian and Fast Food.
db.restaurants.find({
  cuisine: { $all: ["Italian", "Fast Food"] }
})

// 10. Add Desserts to the cuisine list of restaurant 102.
db.restaurants.updateOne(
  { restaurant_id: 102 },
  { $addToSet: { cuisine: "Desserts" } }
)

// 11. Change the email address of restaurant 103.
db.restaurants.updateOne(
  { restaurant_id: 103 },
  { $set: { "contact.email": "greenbowl@email.com" } }
)

// 12. Display restaurants whose contact phone starts with 9.
db.restaurants.find({
  "contact.phone": /^9/
})

// ORDERS

// 13. Find all Delivered orders.
db.orders.find({ status: "Delivered" })

// 14. Find orders placed after 2026-09-02.
db.orders.find({
  order_date: { $gt: ISODate("2026-09-02") }
})

// 15. Find orders delivered to Hyderabad.
db.orders.find({ "delivery.city": "Hyderabad" })

// 16. Find orders containing an item named Noodles.
db.orders.find({ "items.name": "Noodles" })

// 17. Find orders containing an item where quantity is greater than 1.
db.orders.find({
  "items.quantity": { $gt: 1 }
})

// 18. Find an order where the same item has name = Chicken Biryani and quantity = 2.
db.orders.find({
  items: {
    $elemMatch: {
      name: "Chicken Biryani",
      quantity: 2
    }
  }
})

// 19. Add another item to order 5002.
db.orders.updateOne(
  { order_id: 5002 },
  {
    $push: {
      items: {
        name: "Garlic Bread",
        quantity: 1,
        price: 120
      }
    }
  }
)

// 20. Change order 5002 from Processing to Delivered.
db.orders.updateOne(
  { order_id: 5002 },
  { $set: { status: "Delivered" } }
)

// PROJECTION AND SORTING

// 21. Display only restaurant_name, city and rating without _id.
db.restaurants.find(
  {},
  {
    _id: 0,
    restaurant_name: 1,
    city: 1,
    rating: 1
  }
)

// 22. Sort restaurants by rating from highest to lowest.
db.restaurants.find().sort({ rating: -1 })

// 23. Display the top 3 highest-rated restaurants.
db.restaurants.find().sort({ rating: -1 }).limit(3)

// DATA TYPES

// 24. Find documents where rating is stored as a numeric value.
db.restaurants.find({
  rating: { $type: ["double", "int", "long", "decimal"] }
})

// 25. Identify the datatype of order_date.
db.orders.aggregate([
  {
    $project: {
      order_id: 1,
      order_date_type: { $type: "$order_date" }
    }
  }
])

// 26. Identify the datatype of items.
db.orders.aggregate([
  {
    $project: {
      order_id: 1,
      items_type: { $type: "$items" }
    }
  }
])

// 27. Insert one test restaurant where rating is accidentally stored as a string,
// identify it using $type, and then correct the value.

db.restaurants.insertOne({
  restaurant_id: 107,
  restaurant_name: "Test Restaurant",
  city: "Chennai",
  cuisine: ["Indian"],
  rating: "4.3",
  active: true,
  contact: {
    phone: "9876512345",
    email: "test@email.com"
  }
})

db.restaurants.find({
  rating: { $type: "string" }
})

db.restaurants.updateOne(
  { restaurant_id: 107 },
  [{ $set: { rating: { $toDouble: "$rating" } } }]
)

// FINAL CHALLENGE — DELIVERY PARTNERS

// 28. Create a collection called delivery_partners with at least 4 documents.

db.createCollection("delivery_partners")

db.delivery_partners.insertMany([
  {
    partner_id: 201,
    partner_name: "Arun Kumar",
    city: "Hyderabad",
    rating: 4.8,
    active: true,
    vehicle: "Bike",
    skills: ["Food Delivery", "Express Delivery"],
    contact: {
      phone: "9876500001",
      email: "arun@email.com"
    }
  },
  {
    partner_id: 202,
    partner_name: "Meena Devi",
    city: "Chennai",
    rating: 4.2,
    active: true,
    vehicle: "Scooter",
    skills: ["Food Delivery", "Parcel Delivery"],
    contact: {
      phone: "9876500002",
      email: "meena@email.com"
    }
  },
  {
    partner_id: 203,
    partner_name: "Rahul Sharma",
    city: "Hyderabad",
    rating: 4.5,
    active: true,
    vehicle: "Bike",
    skills: ["Food Delivery", "Night Delivery"],
    contact: {
      phone: "9876500003",
      email: "rahul@email.com"
    }
  },
  {
    partner_id: 204,
    partner_name: "Priya Nair",
    city: "Mumbai",
    rating: 3.9,
    active: false,
    vehicle: "Bicycle",
    skills: ["Food Delivery", "Parcel Delivery"],
    contact: {
      phone: "9876500004",
      email: "priya@email.com"
    }
  }
])

// 29. Find active delivery partners from Hyderabad.
db.delivery_partners.find({
  city: "Hyderabad",
  active: true
})

// 30. Find partners with rating greater than 4.
db.delivery_partners.find({
  rating: { $gt: 4 }
})

// 31. Add a new service area to one partner.
db.delivery_partners.updateOne(
  { partner_id: 201 },
  { $addToSet: { skills: "Same-Day Delivery" } }
)

// 32. Update one partner's rating.
db.delivery_partners.updateOne(
  { partner_id: 202 },
  { $set: { rating: 4.6 } }
)

// 33. Sort all partners from highest rating to lowest.
db.delivery_partners.find().sort({ rating: -1 })
