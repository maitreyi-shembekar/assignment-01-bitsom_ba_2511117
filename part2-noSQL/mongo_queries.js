use product_catalog
// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
    {
        name: "LightBook Pro 15",
        category: "Electronics",
        price: 75000,
        specs: { processor: "Intel i7", ram: "16GB", storage: "512GB SSD" },
        warranty_period: "2 years"
    },
    {
        name: "Galaxy A56",
        category: "Electronics",
        price: 19999,
        specs: { storage: "128 GB", camera: "48 MP" },
        warranty_period: "1 year"
    },
    {
        name: "Straight Fit Baggy Jeans",
        category: "Clothing",
        price: 3200,
        attributes: { "size in inches": ["26", "28", "30", "32"], material: "100% Cotton", color: "Indigo Blue" }
    },
    {
        name: "Ethnic Motif Kurti",
        category: "Clothing",
        price: 1000,
        attributes: { size: ["S", "M", "L", "XL"], material: "Cotton Linen", neck: "Round" }
    },
    {
        name: "Greek Yogurt - Blueberry",
        category: "Groceries",
        price: 80,
        expiry_date: ISODate("2024-12-20"),
        "nutritional_info (per 100g)": { protein: "10g", fat: "3g", calories: 100 }
    },
    {
        name: "Whole Grain Bread",
        category: "Groceries",
        price: 65,
        expiry_date: ISODate("2024-12-28"),
        nutritional_info: { fiber: "6g", carbohydrates: "40g" }
    }
]);

db.products.find()

//OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
    category: "Electronics",
    price: { $gt: 20000 }
});

// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
    category: "Groceries",
    expiry_date: { $lt: ISODate("2025-01-01") }
});

// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
    { name: "LightBook Pro 15" },
    { $set: { discount_percent: 15 } }
);

db.products.find({ name: "LightBook Pro 15" })

// OP5: createIndex() — create an index on category field and explain why
db.products.createIndex({ category: 1 });

db.products.getIndexes()
/* EXPLANATION:
Adding an index to the "category" field makes the database run faster.
Without an index, MongoDB would have to perform a 'Collection Scan', 
meaning it has to look through every document to find the specific one, 
every single time, which is not ideal. With an index, MongoDB creates a 
sorted pointer list, to locate the specific docmunt very quickly. 
Kind of like the "Contents" section of a book, that allows you to go to 
the particular topic or page number, without having to flip through every 
single page of the book.
*/

