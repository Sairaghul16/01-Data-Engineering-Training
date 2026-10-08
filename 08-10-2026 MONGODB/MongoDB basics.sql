#Use database
use retail_db

#collection creation
db.createCollection("products")

#Inserting documents to the collection
db.products.insertOne({
    product_id: 101,
    product_name: "Laptop",
    price: 65000
})

#Inserting multiple Documents
db.products.insertMany([
    {
        product_id: 103,
        product_name: "Keyboard",
        price: 1500
    },
    {
        product_id: 104,
        product_name: "Monitor",
        price: 12000
    }
])


#Display all documents
db.products.find()

#Display one document
db.products.findOne()

#Find using condition
db.products.find({
    price: 12000
})


#Find using greater
db.products.find({
    price: { $gt: 10000 }
})

#Find using lesser
db.products.find({
    price: { $lt: 5000 }
})

#Find using greater than or equal
db.products.find({
    price: { $gte: 10000 }
})

#Find using lesser than or equal
db.products.find({
    price: { $lte: 5000 }
})

#Update

db.products.updateOne(
    { product_id: 101 },
    { $set: { price: 70000 } }
)

#Update by increasing

db.products.updateOne(
    { product_id: 101 },
    { $inc: { price: 1000 } }
)

#DELETE
db.products.deleteOne({
    product_id: 104
})

#Display se;ected field

    db.products.find(
    {},
    { _id: 0, product_name: 1, price: 1 }
)
