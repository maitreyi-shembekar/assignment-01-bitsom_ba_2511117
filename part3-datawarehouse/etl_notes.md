## ETL Decisions

### Decision 1 — Category Standardization
**Problem:** In the `retail_transactions.csv` dataset, the category column was found to be inconsistent. Some categories were saved in lowercase ("electronics") while others were in uppercase ("Electronics"). Additionally, "Grocery" and "Groceries" were both used for the same type of item. Since these are seen as different categories by the computer, there would have been many mistakes such as incorrect count or wrong data retrieval.

**Resolution:** The text was standardized so that all category names start with a capital letter. A single name was chosen for each group to keep them consistent. For example, all variations were changed to "Electronics" and all food items were labeled as "Groceries" so the data could be grouped correctly in reports.

### Decision 2 — Date Formats
**Problem:** The dates in the raw CSV file were stored in a `DD-MM-YYYY` format as text strings. This format cannot be used by SQL for sorting or mathematical calculations. It is difficult for the system to group sales by month or year when the date is treated as simple text rather than a calendar value.

**Resolution:** All dates were converted into the standard SQL `YYYY-MM-DD` format. In addition, a numeric date_key (`YYYYMMDD`) was generated. This key was used to link the main sales table to the dates dimension table, allowing reports for specific time periods to be run much faster.

### Decision 3 — Filling Missing Cities
**Problem:** It was noticed that several rows were missing city names, even though the store name was recorded.

**Resolution:** A mapping was created to link each store name to its correct city. This map was then used to automatically fill in the missing `NULL` values based on the recorded store name. By doing this, it was ensured that every transaction was correctly assigned to a city for the final reporting.