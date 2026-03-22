## Storage Systems
To meet the four goals of the hospital network, a multi-layered storage strategy is used. Each goal would require a system that is designed for that specific type of data.

For Goal 1 (Predicting Readmission) and Goal 3 (Management Reporting), a Data Warehouse is a better fit. Historical patient data, such as previous treatment reports and prescriptions, would be stored here in a denormalized format. This data is organized using a Star Schema, which would make it much faster to perform the complex calculations for the monthly reports like bed occupancy and department costs. Additionally, these structured historical records can be used by AI and Machine Learning models to analyze patient history and predict the risk of a patient being readmitted.

For Goal 2 (Plain English Queries), a Vector Database would be used. Since patient histories and clinical notes are often unstructured text, they cannot be easily searched using standard SQL. Instead, these notes are turned into vectors (embeddings). When a doctor writes a query in plain English, the system can retrieve relevant information by meaning, using semantic search.

For Goal 4 (Real-time Vitals), a Data Lake is used for storage. The data from ICU monitoring devices is high-velocity "time-series" data. Recording/writing thousands of patients heartbeats per second into a traditional relational database (RDBMS) would cause the system to crash. Therefore, a Data Lake is used to store this raw data stream at a large scale. This information is primarily used for real-time observation and monitoring rather than the complex calculations like in warehouses.

## OLTP vs OLAP Boundary
The OLTP (Online Transactional Processing) side includes the live databases used at the reception desk for tasks like patient check-ins and bill payments. These systems must be extremely fast and 100% accurate.

The OLAP (Online Analytical Processing) side includes the Data Warehouse and the Vector Database. These systems are used for generating long-term reports.

## Trade-offs
A trade-off in this design is the architectural complexity. Because three different systems (Warehouse, Vector DB, and Data Lake) are used, the system becomes harder to manage. Hospital IT employees would be required to monitor three different pipelines, and data might be stored in different ways across the network.

To mitigate this problem, tools like DuckDB are used. DuckDB can work with different types of data, whether it is stored in tables or as raw files. This allows the hospital staff a simpler way to query all the information in one place.