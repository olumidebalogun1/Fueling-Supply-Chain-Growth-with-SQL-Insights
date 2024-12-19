-- 6. Pareto Analysis of Customers (80/20 Rule) Based on Sales Amount

/* 
QUESTION: Who are the key customers responsible for 80% of total sales, 
          and how can we leverage this insight to maximize business impact?
		  
PURPOSE: To leverage the Pareto Principle (80/20 Rule) for identifying top
         customers driving the majority of sales, enabling businesses to:
         - Focus on high-value customers with tailored strategies.
         - Optimize resources for growth and profitability.
         - Improve decision-making through actionable insights for retention and efficiency.
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

/*
Here's the breakdown of RESULT based on the QUERY above:

🔥 KEY CUSTOMERS RESPONSIBLE FOR 80% OF TOTAL SALES

1. Prime Stop Superstores 💰🔥: $437.63 Million
- Cumulative Sales: $437.63 Million (40.44%)

2. Speak Out Mart 🗣️🛍️: $58.46 Million
- Cumulative Sales: $496.09 Million (45.85%)

3. Excel Stores 📈🏪: $54.09 Million
- Cumulative Sales: $550.17 Million (50.85%)

4. Premium Stores 🌟🛒: $50.23 Million
- Cumulative Sales: $600.40 Million (55.49%)

5. Sunset Plaza 🌇🏬: $43.91 Million
- Cumulative Sales: $644.31 Million (59.55%)

6. Vista Goods 👓📦: $41.80 Million
- Cumulative Sales: $686.11 Million (63.41%)

7. Nixon Hub 🔗🏢: $40.03 Million
- Cumulative Sales: $726.14 Million (67.11%)

8. Acclaimed Stores 🏆🛍️: $28.05 Million
- Cumulative Sales: $754.19 Million (69.7%)

9.Surge Stores ⚡🏪: $27.61 Million
- Cumulative Sales: $781.80 Million (72.25%)

10. Forward Stores ⏩📦: $26.17 Million
- Cumulative Sales: $807.97 Million (74.67%)

11. Nomad Stores 🧳🏬: $23.30 Million
- Cumulative Sales: $831.27 Million (76.83%)

12. Shop Ease 🛒✨: $22.75 Million
- Cumulative Sales: $854.03 Million (78.93%)


🥇 KEY CUSTOMERS DRIVING SALES (80% CLUB)

- Prime Stop Superstores contribute a significant 40.44% of total sales.

- Top Performers: Prime Stop Superstores, Speak Out Mart, Excel Stores, Premium Stores,
  and Sunset Plaza collectively dominate, accounting for 59.55% of total sales. 

*/

