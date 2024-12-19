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