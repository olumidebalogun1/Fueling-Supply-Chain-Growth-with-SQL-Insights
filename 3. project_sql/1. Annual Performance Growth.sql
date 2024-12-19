-- 1. Annual Sales_Amount, Profit, and Sales_Quantity Performance with Percentage Growth

/* 
QUESTION: How has our annual sales, profit, and sales quantity grown over the years, 
          and are we maintaining consistent growth rates across these metrics?

PURPOSE: Is to analyze year-over-year performance trends in key business metrics—Sales Amount,
         Profit, and Sales Quantity—to identify growth patterns, assess consistency,
		 and uncover potential areas for improvement. 
		 - This insight helps in understanding whether the business is scaling sustainably 
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

/*
Here's the breakdown of RESULT based on the QUERY above:

🛠️ 2020 (Baseline Year):

    - Total Sales Amount: $142.71 Million
    - Total Profit: $3.45 Million
    - Total Sales Quantity: 263,499 units
    - Growth Rates: Not applicable (baseline year)

🚀 2021 (Strong Growth Year):

    - Total Sales Amount: $331.21 Million
      * This represents a 132.09% increase in sales compared to 2020.
    - Total Profit: $6.67 Million
      * Profit grew by 93.5%, indicating significant profitability growth but slower than sales growth, which might suggest higher operational costs.
    - Total Sales Quantity: 604,900 units
      * Sales volume grew by 129.56%, closely matching the sales amount growth rate, implying relatively consistent pricing.

📉 2022 (Contraction Year):

    - Total Sales Amount: $291.54 Million
      * Sales declined by 11.98%, likely due to external factors like reduced demand or increased competition.
    - Total Profit: $7.1 Million
      * Profit still increased by 6.34%, suggesting better cost management or improved margins despite lower sales.
    - Total Sales Quantity: 533,038 units
      * Quantity dropped by 11.88%, consistent with the sales decline.

🌱 2023 (Recovery Year):

   -  Total Sales Amount: $316.57 Million
      * Sales rebounded by 8.58%, indicating recovery.
    - Total Profit: $5.77 Million
      * Profit dropped significantly by 18.7%, which might suggest increased costs or price adjustments to drive sales.
    - Total Sales Quantity: 582,457 units
      * Sales volume increased by 9.27%, signaling regained demand.


🧠 OVERALL INSIGHTS

   - 2021 Performance Surge: Exceptional growth across all metrics, likely due to increased market demand, product acceptance, or expansion efforts.
   
   - 2022 Decline: A challenging year with sales and quantity dropping but profit slightly growing, possibly due to cost control.
   
   - 2023 Recovery: A partial recovery in sales and quantity, but profitability took a hit, which might warrant deeper analysis into cost structures or pricing strategies
	  
	*/