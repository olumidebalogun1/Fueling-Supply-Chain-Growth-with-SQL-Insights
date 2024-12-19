/* 1.
Creating the following tables and 
importing CSV file data into the database:
   - Customers
   - Markets
   - Products
   - Transactions.
   */
   
-- 1.1  CUSTOMERS TABLE
CREATE TABLE customers (
    customer_code text NOT NULL,
    customer_name text,
    customer_type text,
    CONSTRAINT pk_customers PRIMARY KEY (customer_code)
);

SELECT * 
FROM customers;

-- 1.2  MARKETS TABLE
CREATE TABLE markets (
    markets_code text NOT NULL,
    markets_country text,
    markets_continent text,
    CONSTRAINT pk_markets PRIMARY KEY (markets_code)
);

SELECT * 
FROM markets;

-- 1.3  PRODUCTS TABLE
CREATE TABLE products(
    product_code text NOT NULL,
    product_type text,
    CONSTRAINT pk_products PRIMARY KEY (product_code)
);

SELECT * 
FROM products;

-- 1.4  TRANSACTIONS TABLE
CREATE TABLE transactions(
    product_code text,
    customer_code text,
    markets_code text,
    order_date date,
    sales_qty integer,
    sales_amount integer,
    cost_price numeric(10,2),
    profit numeric(10,2),
    profit_margin numeric(10,2)
);

SELECT * 
FROM transactions
LIMIT 20;  -- Limit to 20 rows due to the dataset containing over 200,000 rows


/* 2.
Creating a duplicate copy of 
the raw datasets before 
making changes helps 
ensure data integrity. 
The data is then transformed
(e.g., cleaned and formatted)
by staging the tables.
*/

-- 2.1  STAGING CUSTOMERS TABLE
CREATE TABLE staging_customers AS
SELECT *
FROM customers;

-- 2.2  STAGING MARKETS TABLE
CREATE TABLE staging_markets AS
SELECT *
FROM markets;

-- 2.3  STAGING PRODUCTS TABLE
CREATE TABLE staging_products AS
SELECT *
FROM products;

-- 2.4  STAGING TRANSACTIONS TABLE
CREATE TABLE staging_transactions AS
SELECT *
FROM transactions;


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

--=================================================================================--

-- 1. Annual Sales_Amount, Profit, and Sales_Quantity Performance with Percentage Growth

/* 
QUESTION: How has our annual sales, profit, and sales quantity grown over the years, 
          and are we maintaining consistent growth rates across these metrics?

PURPOSE: Is to analyze year-over-year performance trends in key business metrics—Sales Amount,
         Profit, and Sales Quantity—to identify growth patterns, assess consistency,
		 and uncover potential areas for improvement.
		 
		 This insight helps in understanding whether the business is scaling sustainably 
		 or if there are fluctuations that require strategic intervention.		
		*/

WITH annual_performance AS (
    SELECT 
        EXTRACT(YEAR FROM order_date) AS year,
        SUM(sales_amount) AS total_sales_amount,
        SUM(profit) AS total_profit,
        SUM(sales_qty) AS total_sales_qty
    FROM 
        cleaned_transactions
    GROUP BY 
        EXTRACT(YEAR FROM order_date)
    ORDER BY 
        year
)
SELECT 
    year,
    total_sales_amount,
    total_profit,
    total_sales_qty,
    ROUND((total_sales_amount - LAG(total_sales_amount) OVER (ORDER BY year)) * 100.0 / LAG(total_sales_amount) OVER (ORDER BY year), 2) AS sales_amount_growth_percent,
    ROUND((total_profit - LAG(total_profit) OVER (ORDER BY year)) * 100.0 / LAG(total_profit) OVER (ORDER BY year), 2) AS profit_growth_percent,
    ROUND((total_sales_qty - LAG(total_sales_qty) OVER (ORDER BY year)) * 100.0 / LAG(total_sales_qty) OVER (ORDER BY year), 2) AS sales_qty_growth_percent
FROM 
    annual_performance;

--=================================================================================--

-- 2. Market Continents Performance Analysis

/* 
QUESTION: Which continents are driving the highest revenue and profit, 
          and how can we optimize strategies for the underperforming regions?

PURPOSE: To assess market performance by continent in terms of sales and profit. 
         Understanding which continents contribute the most allows businesses to:
         - Allocate resources effectively by focusing on profitable regions.
         - Adjust strategies to improve sales and profitability in underperforming markets.
         - Make data-driven decisions to ensure global success and long-term growth.
         */

SELECT
    markets_continent,
    SUM(sales_amount) AS total_sales_amount,
    SUM(profit) AS total_profit
FROM
    cleaned_transactions AS c_t
LEFT JOIN 
    markets AS m 
	ON c_t.markets_code = m.markets_code

GROUP BY
    m.markets_continent
ORDER BY
    total_sales_amount DESC		

--=================================================================================--

-- 3. Product Type Performance Analysis

/* 
QUESTION: Which product types are driving the most revenue and profit, and how  
          can we leverage this information to boost sales across other categories?
		  
PURPOSE: To understand the sales and profit performance of different product types,
         helping businesses to:
         - Identify top-performing products and focus efforts on scaling their success.
         - Optimize product portfolios by recognizing underperforming categories and making strategic changes.
         - Develop targeted marketing campaigns based on the best-performing product types to increase overall sales and profitability.
         */

SELECT
    product_type,
    SUM(sales_amount) AS total_sales_amount,
    SUM(profit) AS total_profit
FROM
    cleaned_transactions AS c_t
LEFT JOIN 
    cleaned_products AS c_p 
	ON c_t.product_code = c_p.product_code

GROUP BY
    c_p.product_type
ORDER BY
    total_sales_amount DESC		

--=================================================================================--

-- 4. Customer Type Performance Analysis

/* 
QUESTION: Which customer types are driving the highest revenue and profit, and how 
          can we cater to their specific needs to increase sales even further?
		  
PURPOSE: To analyze the sales and profit contributions of different customer types.
         By understanding the performance of customer segments, businesses can:
         - Identify and prioritize high-value customer types, such as VIPs, for targeted offers and loyalty programs.
         - Tailor marketing strategies and product offerings to different customer groups to drive higher engagement and sales.
         - Optimize resource allocation by focusing on customer types that generate the most revenue and profit.
         */

SELECT
    customer_type,
    SUM(sales_amount) AS total_sales_amount,
    SUM(profit) AS total_profit
FROM
    cleaned_transactions AS c_t
LEFT JOIN 
    cleaned_customers AS c_c 
	ON c_t.customer_code = c_c.customer_code

GROUP BY
    c_c.customer_type
ORDER BY
    total_sales_amount DESC		

--=================================================================================--

-- 5. Yearly Spotlight: Top 3 Customers Driving Sales Excellence

/* 
QUESTION: Who are the top-performing customers each year, and how can
          their purchasing behaviors guide our strategic decisions? 
		  		  
PURPOSE: Is to:
         - Identify key customers contributing the highest sales amounts
		   yearly to prioritize and strengthen relationships with them.
		   
         - Discover patterns in high-value customer behavior to replicate
		   success with other customers or segments.
		   
         - Guide targeted marketing and loyalty initiatives to retain and 
		   expand business with top customers. This insight allows businesses
		   to focus efforts where they drive the greatest impact.
		 */

WITH ranked_customers AS (
    SELECT
        EXTRACT(YEAR FROM order_date) AS year,
        c_c.customer_name,
        SUM(sales_amount) AS total_sales_amount,
        ROW_NUMBER() OVER (
            PARTITION BY EXTRACT(YEAR FROM order_date)
            ORDER BY SUM(sales_amount) DESC
        ) AS rank
    FROM
        cleaned_transactions AS c_t
	LEFT JOIN
	    cleaned_customers AS c_c
		ON c_t.customer_code = c_c.customer_code
    GROUP BY
        EXTRACT(YEAR FROM order_date),
        c_c.customer_name
)
SELECT
    year,
    customer_name,
    total_sales_amount
FROM
    ranked_customers
WHERE
    rank <= 3
ORDER BY
    year,
    rank;

--=================================================================================--

-- 6. Pareto Analysis of Customers (80/20 Rule) Based on Sales Amount

/* 
QUESTION: Who are the key customers responsible for 80% of total sales, 
          and how can we leverage this insight to maximize business impact?
		  
PURPOSE: To leverage the Pareto Principle (80/20 Rule) for identifying top
         customers driving the majority of sales, enabling businesses to:
         - Focus on high-value customers with tailored strategies.
         - Optimize resources for growth and profitability.
         - Improve decision-making through actionable insights for retention and efficiency
		 */

WITH customer_sales AS (
    SELECT 
        c_c.customer_name,
        SUM(c_t.sales_amount) AS total_sales
    FROM cleaned_transactions c_t
    JOIN cleaned_customers c_c
    ON c_t.customer_code = c_c.customer_code
    GROUP BY c_c.customer_name
),
total_sales AS (
    SELECT 
        SUM(total_sales) AS overall_sales
    FROM customer_sales
),
ranked_sales AS (
    SELECT 
        cs.customer_name,
        cs.total_sales,
        ts.overall_sales,
        SUM(cs.total_sales) OVER (ORDER BY cs.total_sales DESC) AS cumulative_sales,
        ROW_NUMBER() OVER (ORDER BY cs.total_sales DESC) AS rank,
        ROUND((SUM(cs.total_sales) OVER (ORDER BY cs.total_sales DESC) / ts.overall_sales) * 100, 2) AS cumulative_percentage
    FROM customer_sales cs, total_sales ts
)
SELECT 
    customer_name, 
    total_sales, 
    cumulative_sales, 
    cumulative_percentage
FROM ranked_sales
WHERE cumulative_percentage <= 80
ORDER BY total_sales DESC,cumulative_sales DESC;

--=================================================================================--

-- 7. Customer Segmentation: Identifying High, Medium, and Low-Value Customers

/* 
QUESTION: Who are the high-value customers driving both sales revenue and volume, 
          and how can we strategically engage them for maximum growth?
		  
PURPOSE: To classify customers into High, Medium, and Low Value segments
         based on sales revenue and volume. This helps identify key contributors
		 to business performance, prioritize high-value customers for 
		 targeted strategies, and provide insights to nurture medium-value
		 and re-engage low-value customers, enhancing overall sales efficiency.
		 */

WITH customer_totals AS (
    SELECT 
        c_c.customer_name,
        SUM(c_t.sales_amount) AS total_sales_amount,
        SUM(c_t.sales_qty) AS total_sales_qty
    FROM cleaned_transactions c_t
    JOIN cleaned_customers c_c
        ON c_t.customer_code = c_c.customer_code
    GROUP BY c_c.customer_name
),
percentiles AS (
    SELECT 
        customer_name,
        total_sales_amount,
        total_sales_qty,
        NTILE(3) OVER (ORDER BY total_sales_amount DESC) AS sales_amount_segment,
        NTILE(3) OVER (ORDER BY total_sales_qty DESC) AS sales_qty_segment
    FROM customer_totals
)
SELECT 
    customer_name,
    total_sales_amount,
    total_sales_qty,
    CASE 
        WHEN (sales_amount_segment = 1 AND sales_qty_segment = 1) THEN 'High Value'
        WHEN (sales_amount_segment = 2 AND sales_qty_segment = 2) OR sales_amount_segment = 1 THEN 'Medium Value'
        WHEN (sales_amount_segment = 3 AND sales_qty_segment = 3) OR sales_amount_segment = 2 THEN 'Low Value'
    END AS customer_segment
FROM percentiles
ORDER BY 
      total_sales_amount DESC;
