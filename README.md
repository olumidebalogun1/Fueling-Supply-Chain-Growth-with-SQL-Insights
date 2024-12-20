# **📊 Strategic Growth in Supply Chain Operations with SQL Analytics** 

## **🚀 Introduction**
Welcome to the Strategic Growth in Supply Chain Operations with SQL Analytics Project! This comprehensive analysis dives deep into critical business performance metrics, market dynamics, and customer behaviours. The goal is to uncover actionable insights that drive growth, optimize resources, and enhance decision-making. Whether you're a business strategist, data enthusiast, or just curious, this README will guide you through the purpose, tools, methodology, and key takeaways from this project.

🔍 SQL queries? Check them out here: [Project_sql_folder]( https://github.com/olumidebalogun1/Strategic-Growth-in-Supply-Chain-Operations-with-SQL-Analytics/tree/main/3.%20project_sql)

## **📖 Background**
In a competitive business landscape, understanding performance trends, market dynamics, and customer behaviour is vital for sustainable growth. This project focuses on analysing sales, profit, and market performance across multiple dimensions, including annual growth trends, geographic performance, product types, and customer segmentation. By identifying opportunities and challenges, we aim to craft strategic recommendations to achieve business goals.

### **❓ The questions I wanted to answer through my SQL queries were:**
1.	How has our annual sales, profit, and sales quantity grown over the years, and are we maintaining consistent growth rates across these metrics?
2.	Which continents are driving the highest revenue and profit, and how can we optimize strategies for the underperforming regions?
3.	Which product types are driving the most revenue and profit, and how can we leverage this information to boost sales across other categories?
4.	Which customer types are driving the highest revenue and profit, and how can we cater to their specific needs to increase sales even further?
5.	Who are the top-performing customers each year, and how can their purchasing behaviours guide our strategic decisions?
6.	Who are the key customers responsible for 80% of total sales, and how can we leverage this insight to maximize business impact?
7.	Who are the high-value customers driving both sales revenue and volume, and how can we strategically engage them for maximum growth?

## **🛠️ Tools I Used**
This analysis was powered by a suite of tools and techniques, including:

- **SQL 🖥️**: The backbone of my analysis, empowering me to clean and format data, conduct advanced analyses and modeling, create visualizations, and uncover critical insights. 
- **PostgreSQL 🛢️**:The chosen database management system, ideal for handling the supply chain data.
- **Excel 📊**: Essential for converting SQL outputs into impactful visuals.
- **Git & GitHub 🌐**: Vital for version control, sharing my SQL scripts, and facilitating seamless collaboration and project tracking throughout the analysis process.

## **Approach, Analysis, and Technical Challenges**
**📥 Data Collection**:
- Acquired data tables for analytical processing.
  
**🛠️ Data Preparation**:
- Organized, standardized, cleaned, and transformed raw data into a cohesive and reliable dataset.
  
**🧩 Data Enhancement**:
- Developed calculated variables to enable more comprehensive and insightful analysis.

**🤖 Advanced Analysis and Modeling**:
- Utilized machine learning models to uncover key performance drivers and generate actionable insights.
- 
This structured approach enhances data clarity and reliability, effectively addressing technical challenges and delivering actionable insights to support informed decision-making.


 ## **📈 The Analysis**
Each query in this project was designed to address specific aspects of supply chain operations. Here's the approach I used for each question:

### **1. Annual Sales Amount, Profit, and Sales Quantity Performance with Percentage Growth**
**Question** :
 How has our annual sales, profit, and sales quantity grown over the years, and are we maintaining consistent growth rates across these metrics?
 
**Purpose**: 
Is to analyze year-over-year performance trends in key business metrics—Sales Amount, Profit, and Sales Quantity—to identify growth patterns, assess consistency, and uncover potential areas for improvement. This insight helps in understanding whether the business is scaling sustainably or if there are fluctuations that require strategic intervention.

🔍 **To view the SQL script for this question, check it out here:** [Annual Growth_SQL](https://github.com/olumidebalogun1/Strategic-Growth-in-Supply-Chain-Operations-with-SQL-Analytics/blob/main/3.%20project_sql/1.%20Annual%20Performance%20Growth.sql)


### **Here's the breakdown of RESULT based on the QUERY above:**

🛠️ **2020 (Baseline Year):**

    - Total Sales Amount: $142.71 Million
    - Total Profit: $3.45 Million
    - Total Sales Quantity: 263,499 units
    - Growth Rates: Not applicable (baseline year)

🚀 **2021 (Strong Growth Year):**

    - Total Sales Amount: $331.21 Million
      * This represents a 132.09% increase in sales compared to 2020.
    - Total Profit: $6.67 Million
      * Profit grew by 93.5%, indicating significant profitability growth but slower than sales growth, which might suggest higher operational costs.
    - Total Sales Quantity: 604,900 units
      * Sales volume grew by 129.56%, closely matching the sales amount growth rate, implying relatively consistent pricing.

📉 **2022 (Contraction Year):**

    - Total Sales Amount: $291.54 Million
      * Sales declined by 11.98%, likely due to external factors like reduced demand or increased competition.
    - Total Profit: $7.1 Million
      * Profit still increased by 6.34%, suggesting better cost management or improved margins despite lower sales.
    - Total Sales Quantity: 533,038 units
      * Quantity dropped by 11.88%, consistent with the sales decline.

🌱 **2023 (Recovery Year):**

   -  Total Sales Amount: $316.57 Million
      * Sales rebounded by 8.58%, indicating recovery.
    - Total Profit: $5.77 Million
      * Profit dropped significantly by 18.7%, which might suggest increased costs or price adjustments to drive sales.
    - Total Sales Quantity: 582,457 units
      * Sales volume increased by 9.27%, signaling regained demand.

🧠 **OVERALL INSIGHTS**
   - **2021 Performance Surge:** Exceptional growth across all metrics, likely due to increased market demand, product acceptance, or expansion efforts.
   - **2022 Decline:** A challenging year with sales and quantity dropping but profit slightly growing, possibly due to cost control.
   - **2023 Recovery:** A partial recovery in sales and quantity, but profitability took a hit, which might warrant deeper analysis into cost structures or pricing strategies

   ![1  Annual Sales_Amount, Profit, and Sales_Quantity Performance with Percentage Growt ](https://github.com/user-attachments/assets/09059a32-61d6-4238-ae38-9fb13051386b)
   

### **2. Market Continents Performance Analysis**
**Question** :
Which continents are driving the highest revenue and profit, and how can we optimize strategies for the underperforming regions?

**Purpose**: 
To assess market performance by continent in terms of sales and profit. Understanding which continents contribute the most allows businesses to:
         - Allocate resources effectively by focusing on profitable regions.
         - Adjust strategies to improve sales and profitability in underperforming markets.
         - Make data-driven decisions to ensure global success and long-term growth.

🔍 **To view the SQL script for this question, check it out here:** [Market Continents Performance Analysis_SQL](https://github.com/olumidebalogun1/Strategic-Growth-in-Supply-Chain-Operations-with-SQL-Analytics/blob/main/3.%20project_sql/2.%20Market%20Continent%20Performance%20Analysis.sql)


### **Here's the breakdown of RESULT based on the QUERY above:**

**Top-Performing Continents** 🚀

    1. North America: 
        - Total Sales Amount: $608.00 Million
        - Total Profit: $12.63 Million
        - Key Insight: North America is leading by a significant margin in both revenue and profit. This continent should continue to be the primary focus for growth strategies, with an emphasis on maintaining its strong performance. 💸💼

    2. Europe:
       - Total Sales Amount: $254.39 Million
       - Total Profit: $6.07 Million
       - Key Insight: Europe is the second-best performer, generating strong revenue and healthy profit margins. It’s a key market that should be nurtured to keep the momentum going. 🇪🇺📈

    3. Asia:
       - Total Sales Amount: $181.08 Million
       - Total Profit: $4.47 Million
       - Key Insight: Asia is also performing well, contributing solid revenue and profit. However, there's potential for even more growth, especially if strategic investments are made in high-potential countries within the continent. 🏆🌏

**Underperforming Continents** 📉

    4. Middle East:
       - Total Sales Amount: $17.28 Million
       - Total Profit: -$182,096.58
       - Key Insight: The Middle East is showing negative profit despite modest revenue. This region needs a closer look at cost management or market-specific challenges to turn the situation around. 🤔💡

    5. Oceania:
       - Total Sales Amount: $17.06 Million
       - Total Profit: -$1,969.20
       - Key Insight: Oceania is underperforming, with low sales and minimal losses. Focus on addressing operational inefficiencies or exploring ways to boost revenue in this region. 🛑💸

    6. South America:
       - Total Sales Amount: $4.21 Million
       - Total Profit: -$1,799.52
       - Key Insight: South America is the weakest performer, generating minimal revenue and incurring losses. This market may require significant strategic changes or even reevaluation of the business model. 🔴💔

![2  Market continents performance analysis](https://github.com/user-attachments/assets/c2b2e7cf-114f-475d-96a6-4b92a5c5f96a)
       

### **3. Product Type Performance Analysis**
**Question**:
Which product types are driving the most revenue and profit, and how can we leverage this information to boost sales across other categories?

**Purpose**: 
To understand the sales and profit performance of different product types, helping businesses to:
         - Identify top-performing products and focus efforts on scaling their success.
         - Optimize product portfolios by recognizing underperforming categories and making strategic changes.
         - Develop targeted marketing campaigns based on the best-performing product types to increase overall sales and profitability.   

🔍 **To view the SQL script for this question, check it out here:** [ Product Type Performance Analysis_SQL](https://github.com/olumidebalogun1/Strategic-Growth-in-Supply-Chain-Operations-with-SQL-Analytics/blob/main/3.%20project_sql/3.%20Product%20Type%20Performance%20Analysis.sql)


### **Here's the breakdown of RESULT based on the QUERY above:**

🚀💰 **TOP-PERFORMING PRODUCT TYPES**

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


📉**UNDERPERFORMING PRODUCT TYPES** 

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
      
![3  Product type performance analysis](https://github.com/user-attachments/assets/5cc03c05-5c9c-4a8c-8529-60e2fd7f4d3e)


### **4. Customer Type Performance Analysis**
**Question**:
Which customer types are driving the highest revenue and profit, and how can we cater to their specific needs to increase sales even further?

**Purpose**: 
To analyze the sales and profit contributions of different customer types. By understanding the performance of customer segments, businesses can:
         - Identify and prioritize high-value customer types, such as VIPs, for targeted offers and loyalty programs.
         - Tailor marketing strategies and product offerings to different customer groups to drive higher engagement and sales.
         - Optimize resource allocation by focusing on customer types that generate the most revenue and profit.

🔍 **To view the SQL script for this question, check it out here:** [Customer Type Performance Analysis _SQL](https://github.com/olumidebalogun1/Strategic-Growth-in-Supply-Chain-Operations-with-SQL-Analytics/blob/main/3.%20project_sql/4.%20Customer%20Type%20Performance%20Analysis.sql)


### **Here's the breakdown of RESULT based on the QUERY above:**

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

 ![4  Customer Type Performance Analysis](https://github.com/user-attachments/assets/e11b432f-4ef8-46fc-b7f8-6d043c4a6944)


### **5. Yearly Spotlight: Top 3 Customers Driving Sales Excellence**
**Question**:
 Who are the top-performing customers each year, and how can their purchasing behaviours guide our strategic decisions?

**Purpose**: 
Is to:
 - Identify key customers contributing the highest sales amounts yearly to prioritize and strengthen relationships with them.
 - Discover patterns in high-value customer behavior to replicate success with other customers or segments.
 - Guide targeted marketing and loyalty initiatives to retain and expand business with top customers. This insight allows businesses to focus efforts where they drive the greatest impact.

  🔍 **To view the SQL script for this question, check it out here:** [Yearly Spotlight _SQL](https://github.com/olumidebalogun1/Strategic-Growth-in-Supply-Chain-Operations-with-SQL-Analytics/blob/main/3.%20project_sql/5.%20Yearly%20Spotlight%20-%20Top%203%20Customers%20Driving%20Sales%20Excellence.sql)
  
 
### **Here's the breakdown of RESULT based on the QUERY above:**	

**2020** 🌟
   
1. Prime Stop Superstores 🛍️: $54.86 Million 💰
- Insight: Dominates sales in 2020—critical to maintain and strengthen this  relationship.🤝
  
2. Speak Out Mart 🎤: $8.27 Million 💵
- Insight: Moderate performance; potential for growth through targeted engagement. 📈
    
3. Excel Stores 📚: $7.95 Million 💵
- Insight: Slightly behind; explore loyalty programs to increase their sales contribution. 🎁

**2021** 🚀
   
1. Prime Stop Superstores 🛍️: $130.40 Million 🚀
- Insight: A massive leap in sales, making this customer the star performer of the year. 🌟

2. Speak Out Mart 🎤: $18.27 Million 📈
- Insight: Growth observed; capitalize on their upward trend with personalized offers. 🛒
   
3. Excel Stores 📚: $15.55 Million 📊
- Insight: Healthy growth—ensure consistent service to nurture their loyalty. 🤝

**2022** 📊

1. Prime Stop Superstores 🛍️: $121.81 Million 💼
- Insight: A slight dip from 2021, but they remain the top customer. Analyze the reason for the decline to maintain their momentum. 🔍
    
2. Speak Out Mart 🎤: $16.94 Million 📈
- Insight: Stable performance; consider tailored incentives to encourage further growth. 💎
    
3. Excel Stores 📚: $14.60 Million 📉
- Insight: Sales decreased slightly; evaluate areas for re-engagement. 📋

**2023** 🌟

1. Prime Stop Superstores 🛍️: $130.56 Million 🚀
- Insight: Strong comeback to 2021 levels—this is your power customer! Maintain close collaboration to sustain growth. 💪
    
2. Excel Stores 📚: $15.98 Million 📊
- Insight: Back on track with steady growth. Keep providing value to nurture this positive trend. 🌱
    
3. peak Out Mart 🎤: $14.98 Million 📉
- Insight: Slight decline; reengage with targeted campaigns to revive their momentum. 💬

🧠 **OVERALL INSIGHTS**

1.	**Top Performer**:
	- Prime Stop Superstores 🛍️ leads consistently every year, contributing the majority of sales. Prioritize this customer with loyalty programs, personalized pricing, and exclusive deals. 🤝🎯

2.	**Growth Opportunity**:
	- Speak Out Mart 🎤 shows potential for steady growth. Target this segment with strategic offers to increase their spend. 📈🛒

3.	**Reengagement Needed**:
    - Excel Stores 📚 has fluctuating sales—analyze their preferences and offer tailored solutions to maintain loyalty. 🔍🎁
       
 ![5  Yearly Sportlight](https://github.com/user-attachments/assets/63b143f6-3300-4331-9979-ccd783c3c885)
    - 

### **6. Pareto Analysis of Customers (80/20 Rule) Based on Sales Amount**
**Question**:
Who are the key customers responsible for 80% of total sales, and how can we leverage this insight to maximize business impact?

**Purpose**: 
To leverage the Pareto Principle (80/20 Rule) for identifying top customers driving the majority of sales, enabling businesses to:
         - Focus on high-value customers with tailored strategies.
         - Optimize resources for growth and profitability.
         - Improve decision-making through actionable insights for retention and efficiency.
		
🔍 **To view the SQL script for this question, check it out here:** [Pareto Analysis_SQL](https://github.com/olumidebalogun1/Strategic-Growth-in-Supply-Chain-Operations-with-SQL-Analytics/blob/main/3.%20project_sql/6.%20Pareto%20Analysis%20of%20Customers%20%20Based%20on%20Sales%20Amount.sql)

 
### **Here's the breakdown of RESULT based on the QUERY above:**

🔥 **KEY CUSTOMERS RESPONSIBLE FOR 80% OF TOTAL SALES**

1. **Prime Stop Superstores 💰🔥**: $437.63 Million
- Cumulative Sales: $437.63 Million (40.44%)

2. **Speak Out Mart 🗣️🛍️**: $58.46 Million
- Cumulative Sales: $496.09 Million (45.85%)

3. **Excel Stores 📈🏪**: $54.09 Million
- Cumulative Sales: $550.17 Million (50.85%)

4. **Premium Stores 🌟🛒**: $50.23 Million
- Cumulative Sales: $600.40 Million (55.49%)

5. **Sunset Plaza 🌇🏬**: $43.91 Million
- Cumulative Sales: $644.31 Million (59.55%)

6. **Vista Goods 👓📦**: $41.80 Million
- Cumulative Sales: $686.11 Million (63.41%)

7. **Nixon Hub 🔗🏢**: $40.03 Million
- Cumulative Sales: $726.14 Million (67.11%)

8. **Acclaimed Stores 🏆🛍️**: $28.05 Million
- Cumulative Sales: $754.19 Million (69.7%)

9. **Surge Stores ⚡🏪**: $27.61 Million
- Cumulative Sales: $781.80 Million (72.25%)

10. **Forward Stores ⏩📦**: $26.17 Million
- Cumulative Sales: $807.97 Million (74.67%)

11. **Nomad Stores 🧳🏬**: $23.30 Million
- Cumulative Sales: $831.27 Million (76.83%)

12. **Shop Ease 🛒**: $22.75 Million
- Cumulative Sales: $854.03 Million (78.93%)

🥇 **KEY CUSTOMERS DRIVING SALES (80% CLUB)**
- Prime Stop Superstores contribute a significant 40.44% of total sales.
- Top Performers: Prime Stop Superstores, Speak Out Mart, Excel Stores, Premium Stores,
  and Sunset Plaza collectively dominate, accounting for 59.55% of total sales.

![6  Pareto Analysis of Customers Based on Sales Amount](https://github.com/user-attachments/assets/d57d2505-b0ef-464b-a0c8-aca70e5cd883)


### **7. Customer Segmentation**
**Question**:
Who are the high-value customers driving both sales revenue and volume, and how can we strategically engage them for maximum growth?
**Purpose**: 
To classify customers into High, Medium, and Low Value segments based on sales revenue and volume. This helps identify key contributors to business performance, prioritize high-value customers for targeted strategies, and provide insights to nurture medium-value and re-engage low-value customers, enhancing overall sales efficiency.
		 
🔍 **To view the SQL script for this question, check it out here:** [Customer Segmentation_SQL](https://github.com/olumidebalogun1/Strategic-Growth-in-Supply-Chain-Operations-with-SQL-Analytics/blob/main/3.%20project_sql/7.%20Customer%20Segmentation.sql)

	  
### **Here's the breakdown of RESULT based on the QUERY above:**

**HIGH-VALUE CUSTOMERS 🔥💰 (BIG SPENDERS & BIG MOVERS):** Customers Driving Sales Revenue and Volume 🚀💰

**🏆 Customer Name**	                                       

🛒 Prime Stop Superstores	                                            
- **💰 Total Sales Amount ($)**      437.63 Million 
- **📦 Total Sales Qty (unit)**      518.16 k	
 
🛒 Speak Out Mart	                                            	        
- **💰 Total Sales Amount ($)**      58.46 Million 
- **📦 Total Sales Qty (unit)**      87.70 K	
  
🛒 Excel Stores	                                                       
- **💰 Total Sales Amount ($)**      54.09 Million 
- **📦 Total Sales Qty (unit)**      110.56 K	

🛒 Premium Stores	                                                     
- **💰 Total Sales Amount ($)**      50.23 Million	
- **📦 Total Sales Qty (unit)**     208.34 K	

🛒 Sunset Plaza	                                                        
- **💰 Total Sales Amount ($)**      43.91 Million 
- **📦 Total Sales Qty (unit)**      56.68 K	

🛒 Vista Goods	                                                        
- **💰 Total Sales Amount ($)**     41.80 Million	
- **📦 Total Sales Qty (unit)**     57.95 K	

🛒 Nixon Hub	                                                         
- **💰 Total Sales Amount ($)**     40.03 Million	
- **📦 Total Sales Qty (unit)**     104.68 K	

🛒 Surge Stores	                                             	       
- **💰 Total Sales Amount ($)**     27.61 Million 
- **📦 Total Sales Qty (unit)**     141.45 K	

🛒 Forward Stores	                                                      
- **💰 Total Sales Amount ($)**     26.17 Million	
- **📦 Total Sales Qty (unit)**    40.05 K	

By focusing on high-value customers like Prime Stop Superstores, 
Speak Out Mart and Excel Stores, the business can unlock growth, 
maximize returns and enhance overall sales performance! 📈🎉

![7  Customer Segmentation](https://github.com/user-attachments/assets/1ff62585-ee69-4299-8f28-4e3976df3072)


## **What I Learned**
Through this analysis, I gained:
1.	A deeper understanding of key business performance metrics.
2.	Insights into how market dynamics influence sales and profitability.
3.	Hands-on experience with advanced analytical tools and storytelling techniques.
4.	The importance of tailoring strategies to specific markets, products, and customer types.

 ## **Conclusion**
This analysis showcases the power of data-driven decision-making in identifying trends, challenges, and opportunities. By focusing on high-performing regions, products, and customer types, while addressing underperforming areas, businesses can achieve sustainable growth and long-term success.

 ### **Closing Thought**
Data is the new oil, but insights are the fuel that drives business growth. As a Data Analyst, my passion lies in uncovering these insights and translating them into strategies that make a real impact. Let’s transform data into decisions and challenges into opportunities!



