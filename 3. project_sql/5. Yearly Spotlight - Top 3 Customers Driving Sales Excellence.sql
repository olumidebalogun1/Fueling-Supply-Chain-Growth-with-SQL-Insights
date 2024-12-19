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

/*
Here's the breakdown of RESULT based on the QUERY above:	

1.  2020 🌟

    - Prime Stop Superstores 🛍️: $54.86 Million 💰
        Insight: Dominates sales in 2020—critical to maintain and strengthen this relationship. 🤝
    
	- Speak Out Mart 🎤: $8.27 Million 💵
        Insight: Moderate performance; potential for growth through targeted engagement. 📈
    
	- Excel Stores 📚: $7.95 Million 💵
        Insight: Slightly behind; explore loyalty programs to increase their sales contribution. 🎁

2.  2021 🚀

    - Prime Stop Superstores 🛍️: $130.40 Million 🚀
        Insight: A massive leap in sales, making this customer the star performer of the year. 🌟
   
   - Speak Out Mart 🎤: $18.27 Million 📈
        Insight: Growth observed; capitalize on their upward trend with personalized offers. 🛒
   
   - Excel Stores 📚: $15.55 Million 📊
        Insight: Healthy growth—ensure consistent service to nurture their loyalty. 🤝

3.  2022 📊

    - Prime Stop Superstores 🛍️: $121.81 Million 💼
        Insight: A slight dip from 2021, but they remain the top customer. Analyze the reason for the decline to maintain their momentum. 🔍
    
	- Speak Out Mart 🎤: $16.94 Million 📈
        Insight: Stable performance; consider tailored incentives to encourage further growth. 💎
    
	- Excel Stores 📚: $14.60 Million 📉
        Insight: Sales decreased slightly; evaluate areas for re-engagement. 📋

4.  2023 🌟

    - Prime Stop Superstores 🛍️: $130.56 Million 🚀
        Insight: Strong comeback to 2021 levels—this is your power customer! Maintain close collaboration to sustain growth. 💪
    
	- Excel Stores 📚: $15.98 Million 📊
        Insight: Back on track with steady growth. Keep providing value to nurture this positive trend. 🌱
    
	- Speak Out Mart 🎤: $14.98 Million 📉
        Insight: Slight decline; reengage with targeted campaigns to revive their momentum. 💬


🧠 OVERALL INSIGHTS

1.	Top Performer:
	- Prime Stop Superstores 🛍️ leads consistently every year, contributing the majority of sales. Prioritize this customer with loyalty programs, personalized pricing, and exclusive deals. 🤝🎯

2.	Growth Opportunity:
	- Speak Out Mart 🎤 shows potential for steady growth. Target this segment with strategic offers to increase their spend. 📈🛒

3.	Reengagement Needed:
    - Excel Stores 📚 has fluctuating sales—analyze their preferences and offer tailored solutions to maintain loyalty. 🔍🎁

	*/


