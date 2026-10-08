#select database
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
