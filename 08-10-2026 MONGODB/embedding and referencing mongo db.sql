##1 use case student and contact details
#Embedding 
#1 Student and contact details
db.students.insertOne({
  student_id:101,
  student_name:"Krithi",
  department:"AI & DS",
  contact:{
      phone:9784278490,
      email:"Krithi1622@gmail.com"
  }
})

#Referencing 
#Student document
db.students.insertOne({
  student_id:101,
  student_name:"Krithi",
  department:"AI & DS",
  contact_id:501
})

#Contact document
db.contacts.insertOne({
    contact_id: 501,
    phone: "9784278490",
    email: "Krithi1622@gmail.com"
})



#2 use case product and specification
#Embeddings
db.products.insertOne({
    product_id: 201,
    product_name: "Laptop",
    price: 65000,
    specifications: {
        brand: "Dell",
        ram: "16GB",
        storage: "512GB SSD"
    }
})

#Referencing

#product document
db.products.insertOne({
    product_id: 101,
    product_name: "Laptop",
    price: 65000,
    specification_id: 501
})


#Specification document
db.specifications.insertOne({
    specification_id: 501,
    brand: "Dell",
    ram: "16GB",
    storage: "512GB SSD"
})

