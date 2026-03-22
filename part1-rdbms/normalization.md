## Anomaly Analysis
 
1. **Insert Anomaly** - In an insert anomaly, one cannot add a data without adding other unrelated data. Data cannot be added independently.  
For example, in the given dataset 'orders_flat.csv', if the retailer hired a new sales representative recently, their name, e-mail, and office address cannot be added to the table until they make their first sales. We would also be forced to leave the other attribute values as null to add the new sales representative data. Or we would have to make up fake data to fill in the null spaces in the table. This would create incomplete or dirty data.

2. **Update Anomaly** - In Update anomaly, same information is repeated multiple times. This creates redundant data. Changing one piece of information requires updating multiple rows, leading to a risk of inconsistent data.  
For example, in the orders_flat.csv, In row `ORD1114`, the address is saved as **"Nariman Point"**, but in row `ORD1176`, it is saved as **"Nariman Pt"**. In a normalized system, the address would exist in only one row in a `Sales_Rep` table, making this discrepancy impossible.

3. **Delete Anomaly** - In a delete anomaly, deleting a record would unintentionally erase other essential information.  
For example, in the given dataset 'orders_flat.csv',  the product **P008 (Webcam)** appears only once (row `ORD1185`). If that specific order is deleted, the system would lose all information about the Webcam, like product id, product name, category and it's price

## Normalization Justification

Having everything in one table may seem simpler at first, but it can cost a company a lot of time and money as data grows. Putting everything in one table causes data redundancy, which is when the same information is stored in many different places. This leads to several problems.

First, duplicate data wastes storage space. In the given dataset 'orders_flat.csv', there are 186 rows of order data. And for each order data, we have details of products, customers, sales representatives, stored multiple times instead of just one.  

Second, it creates data anomalies. In the orders_flat.csv dataset, we see three main types:

Insert Anomaly: If we hire a new sales representative, we cannot store their name or office address in a flat table until they make their first sale. We would have to use 'fake data' just to save their profile, which is messy.

Update Anomaly: If a product's name or category changes, we have to find every single row where that product appears and change it. If we miss even one row, the data becomes inconsistent and unreliable. This can be seen in the case of a sales representative, Deepak Joshii, whose office address is saved as "Nariman Point" in 86 rows and "Nariman Pt" in 15 rows. 

Delete Anomaly: If we delete an old order to clean up our files, we might accidentally delete the only record of a product Webcam. 

By dividing the data into four tables—Products, Sales Reps, Customers, and Orders—we solve these issues. We store the main details once in a 'Dimension' table and give them a Unique ID. We then use that ID in the 'Fact' table to reference the information.

Finally, normalized data is better because it takes up less space, makes the system run faster, and prevents mistakes. It ensures the company has one reliable version of the truth, which makes analysis much easier for managers.