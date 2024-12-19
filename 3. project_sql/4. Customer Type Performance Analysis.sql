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

/*
Here's the breakdown of RESULT based on the QUERY above:

    1. Brick and Mortar 🏢:
        - Total Sales Amount: $731.34 Million 💰
        - Total Profit: $13.71 Million 📈
        - Insight: Dominates in both revenue and profit, showcasing the strength of physical retail stores. Prioritize loyalty programs and in-store experiences to sustain growth. ✨

    2. Click and Mortar 🛍️:
        - Total Sales Amount: $240.73 Million 💵
        - Total Profit: $6.11 Million 📊
        - Insight: A strong hybrid model combining online and offline experiences. Focus on enhancing integration between digital and physical platforms for seamless customer experiences. 🔗

    3. E-Commerce 💻:
        - Total Sales Amount: $109.96 Million 🪙
        - Total Profit: ₦3.17 Million 📉
        - Insight: Growing segment but lags behind in profit. Optimize online marketing, streamline logistics, and offer exclusive deals to boost profitability. 🚚✨

	*/


