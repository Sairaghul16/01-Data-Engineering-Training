#Inserting many documents
use retail_db


db.createCollection("products_schema_demo")

db.products_schema_demo.insertMany([
    {
        product_id: 101,
        product_name: "Laptop",
        category: "Electronics",
        price: 65000,
        stock: 10
    },
    {
        product_id: 102,
        name: "Wireless Mouse",
        category: "Electronics",
        price: "1500",
        stock: 25
    },
    {
        product_id: 103,
        product_name: "Office Chair",
        category: "Furniture",
        price: 8500,
        quantity: 12
    },
    {
        product_id: 104,
        product_name: "Keyboard",
        category: 100,
        price: 2500,
        stock: "20"
    }
])

#Inserting Nested Documents
db.products_structure.insertOne({
    product_id: 203,
    product_name: "Office Desk",
    category: "Furniture",
    price: 12000,

    supplier: {
        supplier_name: "Home Furnishings",
        city: "Hyderabad",
        phone: "9876543210"
    }
})


#Inserting array type
db.products_structure.insertOne({
    product_id: 204,
    product_name: "Running Shoes",
    category: "Footwear",
    price: 4500,

    colors: [
        "Black",
        "White",
        "Blue"
    ]
})

#Embbeded 
db.products_structure.insertOne({
    product_id: 205,
    product_name: "Smart Watch",
    category: "Electronics",
    price: 15000,

    reviews: [
        {
            customer: "Rohan",
            rating: 5,
            comment: "Excellent"
        },
        {
            customer: "Meera",
            rating: 4,
            comment: "Good battery"
        },
        {
            customer: "Kabir",
            rating: 3,
            comment: "Average display"
        }
    ]
})

