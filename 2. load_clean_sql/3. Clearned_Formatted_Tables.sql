/* 3.
DATA CLEANING & FORMATTING - 
Essential processes in data preparation
to ensure data integrity and reliability.
This ensures the dataset is accurate,
consistent, and ready for analysis.

The following steps will be performed::
    - Removing Special Characters
	- Standardizing the data
	- Removing Duplicates
	- Handling Null or Missing Values
	- Removing unwanted column(s)
	- Removing Outliers
    */

-- 	3.1  COMPLETE CLEANING & FORMATTING OF CUSTOMERS TABLE
SELECT * 
FROM staging_customers;

SELECT DISTINCT(customer_code)
FROM staging_customers
ORDER BY 1;     -- Identifying distinct values and assessing the need for formatting..

UPDATE staging_customers
SET customer_code = 'Cus021'
WHERE customer_code= 'Cus02!';     -- Changing 'Cus02!' to 'Cus021' 


/* I.
Removing non-alphabetic characters 
and unwanted spaces simultaneously 
from the customer_name column.
*/

SELECT DISTINCT(customer_name)
FROM staging_customers
ORDER BY 1;     -- Identifying distinct values and assessing the need for formatting.

WITH complete_clean_up AS (
    SELECT 
        customer_code, 
        REGEXP_REPLACE(customer_name, '[^a-zA-Z  ]', '', 'g') AS cleaned_name
    FROM staging_customers
)
UPDATE staging_customers
SET customer_name = TRIM(complete_clean_up.cleaned_name)
FROM complete_clean_up
WHERE staging_customers.customer_code = complete_clean_up.customer_code;


/* II. 
Cleaning multiple invalid 
or corrupted entries from 
the customer_type column.
*/

SELECT 
DISTINCT(customer_type)
FROM staging_customers
ORDER BY 1;     -- Identifying distinct values and assessing the need for formatting.

UPDATE staging_customers
SET customer_type = 
    CASE
        WHEN customer_type ILIKE 'Cl%' THEN 'Click and Mortar'
        WHEN customer_type ILIKE 'E%' THEN 'E-Commerce'
        WHEN customer_type ILIKE 'Brick%' THEN 'Brick and Mortar' 
		ELSE customer_type 
    END;

UPDATE staging_customers
SET customer_type = TRIM(customer_type)

SELECT *
FROM staging_customers;  --- To view complte clean-Up

-- Creating cleaned_customers table
CREATE TABLE cleaned_customers AS
SELECT *
FROM staging_customers;


-- 	3.2  COMPLETE CLEANING & FORMATTING OF PRODUCTS TABLE
SELECT *
FROM staging_products

SELECT DISTINCT(product_code)
FROM staging_products
WHERE product_code = '[^a-zA-Z0-9  ]'
ORDER BY 1;     -- Searching for non-alphanumeric in the column

SELECT DISTINCT(product_type)
FROM staging_products
ORDER BY 1;     -- Identifying distinct values and assessing the need for formatting.


/* I. 
Removing non-alphabetic characters 
and unwanted spaces simultaneously 
from the product_type column.
*/

WITH product_clean_up AS (
    SELECT 
        product_code, 
        REGEXP_REPLACE(product_type, '[^a-zA-Z  ]', '', 'g') AS cleaned_name
    FROM staging_products
)
UPDATE staging_products
SET product_type = TRIM(product_clean_up.cleaned_name)
FROM product_clean_up
WHERE staging_products.product_code = product_clean_up.product_code;

/* II. 
Additionally, cleaning  
multiple invalid or corrupted entries 
from the product_type column.
*/

UPDATE staging_products
SET product_type = 
    CASE
        WHEN product_type ILIKE '%Made' THEN 'Custom Made'
        WHEN product_type ILIKE '%Distribut%' THEN 'Distribution'
        WHEN product_type ILIKE 'Licensed%' THEN 'Licensed Product'
		WHEN product_type ILIKE '%Label' THEN 'Private Label'
		WHEN product_type ILIKE '%sale%' THEN 'Wholesale Goods'
		ELSE product_type 
    END;

SELECT DISTINCT(product_type)
FROM staging_products
ORDER BY 1;  --- To view complte clean-Up

-- Creating cleaned_products table
CREATE TABLE cleaned_products AS
SELECT *
FROM staging_products;


-- 	3.3  COMPLETE CLEANING & FORMATTING OF TRANSACTIONS TABLE

-- I.  Cleaning and formatting the product_code column
SELECT COUNT(DISTINCT(product_code))       
FROM staging_transactions   -- Counting distinct values and assessing the need for formatting

SELECT 
COUNT(DISTINCT(st.product_code))AS num_trans_pc,
COUNT(DISTINCT(sp.product_code))AS num_prod_pc
FROM staging_transactions AS st
FULL JOIN staging_products AS sp 
ON st.product_code=sp.product_code;  -- Checking for discrepancies in the number of unique product codes

-- Identifying discrepancies in the unique product codes.
SELECT product_code
FROM staging_transactions
WHERE product_code NOT IN (SELECT product_code FROM staging_products);

-- Cleaning multiple invalid  or corrupted entries from the product_code column
UPDATE staging_transactions
SET product_code = 
    CASE
        WHEN product_code ILIKE 'Prod26!' THEN 'Prod261'
        WHEN product_code ILIKE 'Prod2!8' THEN 'Prod218'
        WHEN product_code ILIKE 'Prod2OO' THEN 'Prod200'
		WHEN product_code ILIKE 'Prod2O8' THEN 'Prod208'
		ELSE product_code 
    END;

-- II.  Cleaning and formatting the customer_code column.
SELECT COUNT(DISTINCT(customer_code))        
FROM staging_transactions   -- Counting distinct values and assessing the need for formatting

SELECT 
COUNT(DISTINCT(st.customer_code))AS num_trans_cc,
COUNT(DISTINCT(sc.customer_code))AS num_prod_cc
FROM staging_transactions AS st
FULL JOIN staging_customers AS sc 
ON st.customer_code=sc.customer_code;  -- Checking for discrepancies in the number of unique customer codes

-- Identifying discrepancies in the unique customer codes.
SELECT customer_code
FROM staging_transactions
WHERE customer_code NOT IN (SELECT customer_code FROM staging_customers);

-- Cleaning multiple invalid  or corrupted entries from the customer_code column
UPDATE staging_transactions
SET customer_code = 
    CASE
        WHEN customer_code ILIKE 'Cus00!' THEN 'Cus001'
        WHEN customer_code ILIKE 'CusO19' THEN 'Cus019'
        WHEN customer_code ILIKE 'Cus0!4' THEN 'Cus014'
		WHEN customer_code ILIKE 'Cus0!8' THEN 'Cus018'
		ELSE customer_code 
    END;

-- III.  Cleaning and formatting the markets_code column.
SELECT COUNT(DISTINCT(markets_code))       
FROM staging_transactions   -- Counting distinct values and assessing the need for formatting

SELECT 
COUNT(DISTINCT(st.markets_code))AS num_trans_mc,
COUNT(DISTINCT(sm.markets_code))AS num_prod_mc
FROM staging_transactions AS st
FULL JOIN staging_markets AS sm 
ON st.markets_code=sm.markets_code;  -- Checking for discrepancies in the number of unique market codes

-- Identifying discrepancies in the unique market codes.
SELECT markets_code
FROM staging_transactions
WHERE markets_code NOT IN (SELECT markets_code FROM staging_markets);

-- Cleaning multiple invalid  or corrupted entries from the customer_code column
UPDATE staging_transactions
SET markets_code = 
    CASE
        WHEN markets_code ILIKE 'Mark00!' THEN 'Mark001'
        WHEN markets_code ILIKE 'MarkOO4' THEN 'Mark004'
        WHEN markets_code ILIKE 'MarkO11' THEN 'Mark011'
		ELSE markets_code 
    END;
	
-- IV.  REPLACING ALL BLANK ENTRIES WITH NULL VALUES IN THE TRANSACTION TABLE.
UPDATE staging_transactions
SET customer_code = NULL
WHERE TRIM(customer_code) = '';    -- Replacing blank rows in the customer_code column with NULL values.

UPDATE staging_transactions
SET markets_code = NULL
WHERE TRIM(markets_code) = '';    -- Replacing blank rows in the market_code column with NULL values.

UPDATE staging_transactions
SET order_date = NULL
WHERE TRIM(CAST(order_date AS TEXT)) = '';   -- Replacing blank rows in the order_date column with NULL values.

UPDATE staging_transactions
SET sales_qty = NULL
WHERE TRIM(CAST(sales_qty AS TEXT)) = '';  -- Replacing blank rows in the sales_qty column with NULL values.

UPDATE staging_transactions
SET sales_amount = NULL
WHERE TRIM(CAST(sales_amount AS TEXT)) = '';  -- Replacing blank rows in the sales_amount column with NULL values.

UPDATE staging_transactions
SET cost_price = NULL
WHERE TRIM(CAST(cost_price AS TEXT)) = '';  -- Replacing blank rows in the cost_price column with NULL values.

UPDATE staging_transactions
SET profit = NULL
WHERE TRIM(CAST(profit AS TEXT)) = '';  -- Replacing blank rows in the profit column with NULL values.

UPDATE staging_transactions
SET profit_margin = NULL
WHERE TRIM(CAST(profit_margin AS TEXT)) = '';  -- Replacing blank rows in the profit_margin column with NULL values.

-- Identifying all NULL values in the Transaction table.
SELECT *
FROM staging_transactions
WHERE 
   customer_code IS NULL   
OR markets_code IS NULL
OR order_date IS NULL
OR sales_qty IS NULL
OR sales_amount IS NULL
OR cost_price IS NULL
OR profit IS NULL
OR profit_margin IS NULL;

-- V.  DELETING ALL NULL VALUES FROM CUSTOMER_CODE, MARKETS_CODE, ORDER_DATE, AND SALES_QTY.
DELETE FROM staging_transactions
WHERE 
   customer_code IS NULL   
OR markets_code IS NULL
OR order_date IS NULL
OR sales_qty IS NULL;

-- VI. UPDATING THE NULL VALUES IN SALES_AMOUNT, COST_PRICE, PROFIT, AND PROFIT_ MARGIN WITH CALCULATED VALUES.
UPDATE staging_transactions
SET sales_amount = COALESCE(sales_amount, cost_price + profit);  -- Replacing NULL values with calculated value.


UPDATE staging_transactions
SET cost_price = COALESCE(cost_price, sales_amount - profit);  -- Replacing NULL values with calculated value. 

UPDATE staging_transactions
SET profit =  COALESCE(profit, sales_amount - cost_price);  -- Replacing NULL values with calculated value.

UPDATE staging_transactions
SET profit_margin =  COALESCE(profit_margin, (profit * 100) / sales_amount);  -- Replacing NULL values with calculated value.

-- Checking for any visible NULL values in the transaction table.
SELECT *
FROM staging_transactions
WHERE
  customer_code IS NULL   
OR markets_code IS NULL
OR order_date IS NULL
OR sales_qty IS NULL
OR sales_amount IS NULL
OR cost_price IS NULL
OR profit IS NULL
OR profit_margin IS NULL

-- VII. CHECKING FOR DUPLICATE VALUES AND DELETING THEM FROM THE TRANSACTION TABLE.
SELECT count(*)
FROM staging_transactions;  -- Counting the total number of rows in the table.

 -- Identifying duplicate values and the number of affected rows.
WITH ranked_rows AS
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY product_code, customer_code,markets_code, order_date,
           sales_qty ORDER BY product_code ) AS rn
FROM staging_transactions
)
SELECT *
FROM ranked_rows
WHERE rn>1;  

-- Delected duplicate values by creating a new table with rn = 1
CREATE TABLE IF NOT EXISTS staging_transactions_2 AS
SELECT * FROM
(
WITH ranked_rows AS
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY product_code, customer_code,markets_code, order_date,
           sales_qty ORDER BY product_code ) AS rn
FROM staging_transactions
)
SELECT *
FROM ranked_rows
WHERE rn=1);

-- Counting Total Rows in Newly Created Table "staging_transactions_2"
SELECT COUNT(*)
FROM staging_transactions_2;

-- Removing rn from the table "staging_transactions_2"
ALTER TABLE staging_transactions_2
DROP COLUMN rn;

SELECT *
FROM staging_transactions_2;     -- Reading the table


/* 
Creating a table "Flag Outliers" from staging_transactions_2,
   to mark outliers as special cases instead of delecting them. 
   */
   
   CREATE TABLE flag_Outliers AS
   SELECT *
   FROM staging_transactions_2; 

/* 
Using Percentiles: 1st percentile as the lower threshold and 
   the 99th percentile as the upper threshold, then 
   Flag values outside this range as outliers. 
   */

WITH percentiles AS (
    SELECT
        PERCENTILE_CONT(0.01) WITHIN GROUP (ORDER BY sales_qty) AS lower_threshold,
        PERCENTILE_CONT(0.99) WITHIN GROUP (ORDER BY sales_qty) AS upper_threshold
    FROM flag_Outliers
)
SELECT *,
    CASE
        WHEN sales_qty < lower_threshold OR sales_qty > upper_threshold THEN 'Outlier'
        ELSE 'Valid'
    END AS Outlier_Flag
FROM flag_Outliers, percentiles;

-- Counting the total number of sales quantities containing outl   
SELECT COUNT(outlier_flag)
FROM (
    WITH percentiles AS (
        SELECT
            PERCENTILE_CONT(0.01) WITHIN GROUP (ORDER BY sales_qty) AS lower_threshold,
            PERCENTILE_CONT(0.99) WITHIN GROUP (ORDER BY sales_qty) AS upper_threshold
        FROM flag_Outliers
    )
    SELECT *,
        CASE
            WHEN sales_qty < lower_threshold OR sales_qty > upper_threshold THEN 'Outlier'
            ELSE 'Valid'
        END AS outlier_flag
    FROM flag_Outliers, percentiles
) AS flagged_data
WHERE outlier_flag = 'Outlier';

-- Created new table "cleaned_transactions" by selecting Valid data from flag_Outliers & percentiles
CREATE TABLE IF NOT EXISTS cleaned_transactions AS
SELECT *
FROM (
    WITH percentiles AS (
        SELECT
            PERCENTILE_CONT(0.01) WITHIN GROUP (ORDER BY sales_qty) AS lower_threshold,
            PERCENTILE_CONT(0.99) WITHIN GROUP (ORDER BY sales_qty) AS upper_threshold
        FROM flag_Outliers
    )
    SELECT *,
        CASE
            WHEN sales_qty < lower_threshold OR sales_qty > upper_threshold THEN 'Outlier'
            ELSE 'Valid'
        END AS outlier_flag
    FROM flag_Outliers, percentiles
) AS flagged_data
WHERE outlier_flag = 'Valid';


-- Removing the columns: lower_threshold, upper_threshold, and outlier_flag from the cleaned_transactions dataset.
ALTER TABLE cleaned_transactions
DROP COLUMN lower_threshold,
DROP COLUMN upper_threshold,
DROP COLUMN outlier_flag;

SELECT *
FROM cleaned_transactions;     -- Reading the table
