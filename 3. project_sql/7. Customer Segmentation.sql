-- 7. Customer Segmentation

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
        WHEN (sales_amount_segment = 2 AND sales_qty_segment = 2) OR sales_amount_segment = 2 OR sales_qty_segment = 2 THEN 'Medium Value'
        WHEN (sales_amount_segment = 3 AND sales_qty_segment = 3) OR sales_amount_segment = 3 THEN 'Low Value'
    END AS customer_segment
FROM percentiles
ORDER BY 
      total_sales_amount DESC;
	  
/*
Here's the breakdown of RESULT based on the QUERY above:

HIGH-VALUE CUSTOMERS 🔥💰 (BIG SPENDERS & BIG MOVERS):Customers Driving Sales Revenue and Volume 🚀💰

🏆 Customer Name	           💰 Total Sales Amount ($)	   📦 Total Sales Qty (unit)	

🛒 Prime Stop Superstores	          437.63 Million                    518.16 k	        
🛒 Speak Out Mart	                   58.46 Million             	      87.70 K	
🛒 Excel Stores	                   54.09 Million                    110.56 K	
🛒 Premium Stores	                   50.23 Million	                 208.34 K	
🛒 Sunset Plaza	                   43.91 Million                     56.68 K	
🛒 Vista Goods	                       41.80 Million	                  57.95 K	
🛒 Nixon Hub	                       40.03 Million	                 104.68 K	
🛒 Surge Stores	                   27.61 Million             	     141.45 K	
🛒 Forward Stores	                   26.17 Million	                  40.05 K	

By focusing on high-value customers like Prime Stop Superstores, 
Speak Out Mart and Excel Stores, the business can unlock growth, 
maximize returns, and enhance overall sales performance! 📈🎉

*/
