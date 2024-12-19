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

/*
Here's the breakdown of RESULT based on the QUERY above:

🚀💰 TOP-PERFORMING PRODUCT TYPES 

    1. Own Brand 🏷️
        - Total Sales Amount: $463.75 Million
        - Total Profit: $9.12 Million
        - Key Insight: Own Brand is by far the highest performer, driving the most revenue and profit. This product type is a key driver of success and should be scaled further to maintain growth. 📈🎯

    2. Distribution 🚚
        - Total Sales Amount: $164.25 Million
        - Total Profit: $3.18 Million
        - Key Insight: Distribution products also contribute significantly to both sales and profit, though with a lower margin compared to Own Brand. Focus on improving operational efficiency to enhance profit margins here. 🔄💸

    3. Custom Made 🛠️
        - Total Sales Amount: $158.50 Million
        - Total Profit: $3.85 Million
        - Key Insight: Custom Made products are performing well with solid profits, indicating that consumers value personalized or unique products. This category could be further capitalized on with customization strategies. ✨🎨


📉 UNDERPERFORMING PRODUCT TYPES 

    4. Private Label 🏷️
        - Total Sales Amount: $124.72 Million
        - Total Profit: $2.40 Million
        - Key Insight: Private Label products are generating lower sales and profit compared to other categories. Focus on improving brand recognition and consumer trust to boost these figures. 🏷️🤔

    5. Wholesale Goods 🏪
        - Total Sales Amount: $103.76 Million
        - Total Profit: $3.17 Million
        - Key Insight: Wholesale Goods, while generating revenue, have a lower profit margin compared to custom or own-brand products. Cost reduction and streamlining distribution could help improve profitability. 📦💼

    6. Third-Party Brand 🏢
        - Total Sales Amount: $53.72 Million
        - Total Profit: $1.21 Million
        - Key Insight: Third-Party Brand products are underperforming, especially in terms of profit. Consider reassessing partnerships or finding ways to increase sales while improving margins. ⚖️🔍

    7. Licensed Product 🎟️
        - Total Sales Amount: $13.34 Million
        - Total Profit: $0.06 Million
        - Key Insight: Licensed Products are the lowest performers in both sales and profit. A strategic reevaluation is needed to determine whether to continue or rebrand this category to better meet market demand. 🛑🎯

   */
