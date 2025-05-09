# **FUELING SUPPLY CHAIN GROWTH WITH SQL INSIGHTS** 

## **Overview**
**This project delivers a deep-dive analytics solution** focused on **optimizing supply chain performance** using **SQL, Exploratory Data Analysis (EDA)**, and **machine learning techniques**. By analyzing **trends, business performance metrics, market dynamics**, and **customer behavior**, the project uncovers **actionable insights** that empower **strategic decision-making**, drive **operational efficiency**, and fuel **sustainable growth**.
Whether you're a **business strategist** aiming to streamline operations, a **data enthusiast** exploring supply chain analytics, or simply **curious** about how **SQL** can solve real-world business problems, this project offers a **practical walkthrough** of the analysis process. You'll discover how **data was extracted, cleaned, explored, and modeled** to generate insights that directly impact **profitability, resource allocation, and long-term strategy**.
From **methodology** to **tools, techniques** to **takeaways**, this README is your guide to transforming raw data into **supply chain intelligence** that delivers tangible results.


🔍 SQL queries? Check them out here: [Project_sql_folder]( https://github.com/olumidebalogun1/Strategic-Growth-in-Supply-Chain-Operations-with-SQL-Analytics/tree/main/3.%20project_sql)

## **Business Challenge**
In today’s competitive business landscape, **understanding performance trends, market dynamics, and customer behaviour** is crucial for **sustainable growth**. While the company has experienced increasing **sales, profits, and order volumes**, leadership is concerned about **hidden inefficiencies and inconsistencies** that could threaten long-term success. Growth appears **uneven and potentially unsustainable**, with fluctuations across key business dimensions, including:

-	 **Revenue Performance**: Yearly and monthly inconsistencies in **sales, profit, and order volume** may signal volatility.
-	 **Market Contributions**: Varying performance across **continents, countries, and states**, indicating untapped opportunities or struggling regions.
-	 **Product Profitability**: Unequal contributions of product categories to revenue and margins, highlighting inefficiencies in **pricing, demand forecasting, and portfolio   management**.
-	 **Customer Segments**: Over-reliance on a few key customers poses a risk to **business stability and growth**.
-	 **Operational Efficiency**: Possible **pricing inefficiencies and unexpected cost spikes** may be eroding profitability.

The core challenge isn’t just identifying **where the business is growing, but why**, and uncovering **potential risks and missed opportunities** that may hinder long-term success.

## **Analytical Approach & Key Business Questions**
To address these concerns, this project will leverage SQL-driven insights to conduct a comprehensive, multi-dimensional business performance analysis to:
1. **Assess Growth Trends**: Analyse **year-over-year (YoY) and monthly patterns** in sales, profit, and sales quantity to detect inconsistencies.

2.  **Market Performance Review**: Identify the **highest and lowest-performing regions** to refine market strategies.

3.  **Product Profitability Analysis**: Evaluate **which product categories drive profit** and which are underperforming, guiding optimization strategies.

4.   **Customer Segmentation & Revenue Drivers**: Conduct a **Pareto analysis (80/20 rule) ** to identify **high-value customer segments** responsible for the majority of revenue.

5.  **Operational Optimization**: Detect **pricing inefficiencies, demand fluctuations, and cost imbalances** to improve profitability.

6.  **Strategic Recommendations**: Deliver **data-driven insights** to enhance **pricing strategies, marketing efforts, and operational efficiency** for long-term growth.

## **Key Business Questions**
1.  Are we maintaining consistent annual growth in sales, profit, and order volume?

2.  Which continents drive the highest revenue and profit, and how can we optimize underperforming regions?

3.  Which product categories are the most profitable, and how can we boost performance in weaker segments?

4.  Which customer types generate the most revenue and profit, and how can we tailor strategies to increase their engagement?

5.  Who are the top-performing customers each year, and how can their purchasing behaviours inform our strategic decisions?

6.  Which customers contribute to 80% of total sales, and how can we strengthen relationships with them?

7.  Who are our high-value customers, and how can we engage them more effectively for long-term business impact?


## **Tools I Used**
My analysis was driven by a robust set of tools and techniques, including:
- **SQL**: The backbone of my analysis, empowering me to clean and format data, conduct advanced analyses and modelling, create visualizations, and uncover critical insights. 
- **PostgreSQL**:The chosen database management system, ideal for handling the supply chain data.
- **Excel**: Essential for converting SQL outputs into impactful visuals.
- **Git & GitHub**: Vital for version control, sharing my SQL scripts, and facilitating seamless collaboration and project tracking throughout the analysis process.

## **Approach, Analysis, and Technical Challenges**
**1. Data Collection**:
- Acquired data tables for analytical processing.
  
**2. Data Preparation**:
- Organized, standardized, cleaned, and transformed raw data into a cohesive and reliable dataset.
  
**3. Data Enhancement**:
- Developed calculated variables to enable more comprehensive and insightful analysis.

**4. Advanced Analysis and Modelling**:
- Utilized machine learning models to uncover key performance drivers and generate actionable insights.
  
This structured approach enhances data clarity and reliability, effectively addressing technical challenges and delivering actionable insights to support informed decision-making.


# **The Analysis 1 - Data Cleaning & Formatting**
Raw data is **often messy and requires proper cleaning to ensure accuracy, reliability, and efficiency**. A well-structured data cleaning process enhances **data quality, leading to better insights and informed decision-making**. Below is the structured approach I followed to clean the dataset:

**1.  Removing Unnecessary Columns**
-	First, I dropped irrelevant or redundant columns that did not contribute to the analysis. This helped streamline the dataset and focus only on useful information.

**2.  Handling Missing Values**
-	Replaced blank fields with NULL values for accurate processing.
-	Assessed missing data and applied appropriate imputation.

**3.  Removing Duplicates**
-	Identified and removed duplicate records to prevent skewed analysis and ensure data integrity.

**4.  Standardizing Formats**
-	Ensured date formats were uniform across all records.
-	Properly formatted numerical values for consistency and accurate calculations.

**5.  Removing Special Characters & Inconsistencies**
-	Eliminated special characters, extra spaces, and inconsistent text formats to maintain uniformity in categorical data.

**6.  Detecting & Handling Outliers**
-	Applied statistical methods to detect anomalies.
-	Decided whether to transform, or remove extreme values based on their impact on the analysis.

🔍 Want to explore the SQL queries behind this process? Check them out here: [Clean and Format_sql](https://github.com/olumidebalogun1/Strategic-Growth-in-Supply-Chain-Operations-with-SQL-Analytics/blob/main/2.%20load_clean_sql/3.%20Clearned_Formatted_Tables.sql)

 
 # **The Analysis 2**
Each query in this project was designed to address specific aspects of supply chain operations. Here's the approach I used for each question:


# **1. Annual Sales Amount, Profit, and Sales Quantity Performance with Percentage Growth**

## **How have our annual Sales Amount, Profit, and Sales Quantity evolved over time, and are we maintaining consistent growth across these metrics**?

### **Question Overview**    
**Business Challenge**
The company aims to evaluate its long-term financial performance by assessing the growth trajectory of its key business metrics—Sales Amount, Profit, and Sales Quantity. While overall revenue may be increasing, leadership wants to determine whether this growth is stable, accelerating, or showing signs of inconsistency. 

**Objective of the Question**
This project focuses on analysing year-over-year (YoY) performance trends in Sales Amount, Profit, and Sales Quantity. The objective is to assess growth patterns, measure consistency, and uncover areas requiring strategic intervention. These insights will support data-driven decision-making to ensure sustainable business expansion, optimized pricing strategies, and improved operational efficiency.

**Analytical Approach**
-	Write SQL queries to calculate YoY percentage changes in Sales Amount, Profit, and Sales Quantity.
-	Identify trends in growth, stagnation, or decline across different years.
-	Provide data-driven recommendations to enhance pricing strategies, optimize sales efforts, and ensure long-term business sustainability.

![1](https://github.com/user-attachments/assets/4ece6936-4b20-48b9-881a-e89cf3b6dbb3)

### **Here's the breakdown of RESULT based on the QUERY above**:
1. **2021 showed explosive growth**:
- Sales Amount **(+132.09%)**, Profit **(+93.5%)**, and Sales Quantity **(+129.56%)** all saw massive increases.

2. **2022 saw a decline in Sales and Sales Quantity but Profit still grew**:
- Sales Amount dropped **(-11.98%)**, Sales Quantity dropped **(-11.88%)**, but Profit still increased **(+6.34%)**.

3. **2023 showed a sales recovery but a profit decline**:
- Sales Amount rebounded **(+8.58%)**, and Sales Quantity increased **(+9.27%)**, but Profit fell **(-18.7%)**.
  
### **Query Result Visualization**
![1  Annual Sales_Amount, Profit, and Sales_Quantity Performance with Percentage Growt ](https://github.com/user-attachments/assets/b89e5454-90c7-486a-a23b-84e5ecbea85e)

## **Key Insights**            
**I. YEAR-OVER-YEAR PERFORMANCE TRENDS**

1.  **2021's exceptional growth may be unsustainable**:
- A **132% increase in sales** suggests a major business expansion, possibly due to new market penetration, promotional efforts, or product launches.
    However, growth at this level is difficult to sustain long-term.

2.  **2022’s drop in revenue and sales quantity signals challenges**:
- The **11.98% decline in sales** and **11.88% drop in quantity** indicate demand contraction or operational inefficiencies.
    However, profit still grew (+6.34%), suggesting pricing or cost efficiency improvements.

3.  **2023 shows revenue recovery but profit struggles**:
- Sales Amount rebounded **(+8.58%)**, and sales quantity increased **(+9.27%)**, indicating demand picked up again.
    However, **Profit dropped (-18.7%)**, likely due to increased costs, discounting strategies, or lower-margin sales.

4.  **Profitability is inconsistent**:
- **2021**: Profit grew alongside sales.
- **2022**: Sales dropped, but profit still increased.
- **2023**: Sales grew, but profit declined.

This indicates fluctuating margins, possibly due to pricing strategies, cost structure changes, or market shifts.

## **Strategic Recommendations**
**I.  STABILIZING REVENUE GROWTH**

1.  **Ensure sustainable demand expansion**:
- 2021’s rapid growth may have been due to temporary factors (e.g., promotions, discounts, or market expansion).
- Conduct deeper analysis to identify key drivers of the 2021 surge and optimize sustainable sales strategies.

2.  **Improve demand forecasting**:
-  The **drop in 2022 sales** followed by a **2023 rebound** suggests inconsistent demand patterns.
-  Utilize predictive analytics to improve inventory and pricing strategies.

**II.  BOOSTING PROFIT MARGINS**

1.  **Assess cost structure and pricing strategy**:
- 2023’s 88profit decline despite sales recovery88 suggests higher costs or pricing inefficiencies.
-  Conduct a profitability analysis at the **product level** to identify low-margin areas.

2.  **Introduce dynamic pricing models**:
- Leverage **data-driven pricing** to adjust product prices based on demand, seasonality, and competition.

3.  **Optimize operational efficiency**:
- Investigate if rising costs (supply chain, logistics, or overhead) contributed to the profit decline in 2023.
- Reduce waste and improve cost controls to protect margins.

**III. ENSURING LONG-TERM BUSINESS SUSTAINABILITY**

1.  **Diversify revenue streams**:
- If 2021’s growth came from new markets or aggressive promotions, explore **sustainable customer acquisition strategies** instead of deep discounting.

2.  Strengthen customer retention efforts:
- **2022’s decline** suggests a drop in repeat purchases or customer loyalty.
-  Implement targeted loyalty programs and personalized engagement strategies.

3.  **Enhance product mix strategy**:
- Evaluate whether 2023’s sales increase came from lower-margin products.
- Shift marketing focus toward **high-margin, high-demand products**.


# **2. Market Continents Performance Analysis**

## **Which continents are driving the highest revenue and profit, and how can we optimize strategies for underperforming regions**?

### **Question Overview**   
**Business Challenge**:
The company wants to evaluate its market performance across different continents to identify regions driving the highest revenue and profit. While some regions are highly profitable, others may be underperforming, requiring strategic adjustments to optimize global success.

**Objective of the Question**:
This project aims to analyse sales and profit contributions by continent, identifying high-performing regions and areas needing improvement. Insights from this analysis will help the business allocate resources effectively, refine market strategies, and enhance profitability in underperforming regions.

**Analytical Approach**:
-   Write SQL queries to calculate total sales and profit by continent.
-   Identify top-performing continents and underperforming regions.
-   Conduct trend analysis to assess revenue and profit growth over time.
-   Provide data-driven recommendations to optimize market strategies and improve profitability across regions.

![2](https://github.com/user-attachments/assets/99c34a4d-6050-4240-b713-6611907a1b23)

### **Here's the breakdown of RESULT based on the QUERY above:**
**I.  TOP-PERFORMING  CONTINENTS** 

1. **North America**: 
- Total Sales Amount: **$608.00 Million**
- Total Profit: **$12.63 Million**

2.  **Europe**:
- Total Sales Amount: **$254.39 Million**
- Total Profit: **$6.07 Million**

3.  **Asia**:
- Total Sales Amount: **$181.08 Million**
- Total Profit: **$4.47 Million**

**II.  UNDERPERFORMING CONTINENTS** 

4.  **Middle East**:
- Total Sales Amount: **$17.28 Million**
- Total Profit: **-$182,096.58**

5.  **Oceania**:
- Total Sales Amount: **$17.06 Million**
- Total Profit: **-$1,969.20**

6. **South America**:
- Total Sales Amount: $4.21 Million
- Total Profit: **-$1,799.52**

### **Query Result Visualization**
![2  Market continents performance analysis](https://github.com/user-attachments/assets/bb73e020-873a-4600-b0f1-55ff9620e22d)
    
## **Key Insights**             
**I.  TOP-PERFORMING PRODUCT TYPES**

1.	**North America is leading by a significant margin in both revenue and profit**. This continent should continue to be the primary focus for growth strategies, with an emphasis on maintaining its strong performance.

2.	**Europe is the second-best performer, generating strong revenue and healthy profit margins**. It’s a key market that should be nurtured to keep the momentum going. 

3.	**Asia is also performing well, contributing solid revenue and profit**. However, there's potential for even more growth, especially if strategic investments are made in high-potential countries within the continent. 

**II.  UNDERPERFORMING CONTINENTS** 

4.	**The Middle East is showing negative profit despite modest revenue**. This region needs a closer look at cost management or market-specific challenges to turn the situation around. 

5.	**Oceania is underperforming, with low sales and minimal losses**. Focus on addressing operational inefficiencies or exploring ways to boost revenue in this region. 


6.	 **South America is the weakest performer, generating minimal revenue and incurring losses**. This market may require significant strategic changes or even re-evaluation of the business model. 

## **Strategic Recommendations**
**I.  MAXIMIZE GROWTH IN HIGH-PERFORMING MARKETS**
1.	**Strengthen North America’s dominance**
-	Invest in customer retention strategies and loyalty programs to maintain high revenue levels.
-	Expand high-margin product offerings to further boost profitability.

2.	**Scale up in Europe and Asia**
-	Since these regions are profitable, **expand marketing and distribution efforts** to unlock more potential.
-	Identify high-performing products in North America and localize them for these markets.

 **II.  TURNAROUND STRATEGY FOR UNDERPERFORMING REGIONS**

1. **Optimize Pricing & Refine Discount Strategy**:
-	Analyse discount effectiveness—**Experiment with small discounts**

2.  **Fix profitability issues in the Middle East**
-  Investigate **high costs, pricing strategies, and competitive pressure** leading to negative profit.
-  Explore operational optimizations like local partnerships or supply chain improvements.
-  If losses persist, reconsider market presence or focus on niche, high-margin products.

3. **Evaluate Oceania and South America’s potential**
-  These regions generate sales but with no profit.
-  Conduct **market feasibility studies** to assess whether scaling up is worthwhile.
-  If demand is limited,** consider exiting or reallocating resources** to high-potential regions.

 **III.  OPTIMIZE MARKET EXPANSION STRATEGY**
1.  **Diversify revenue streams to reduce dependency on North America**
-  Reduce business risk by expanding aggressively in other **profitable** markets (Europe, Asia).

2.  **Refine pricing strategies based on regional demand and costs**
-  Analyse **cost structures, competitor pricing, and willingness to pay** per region.
-  Consider **dynamic pricing models** to optimize revenue across different markets.

3.  **Optimize operational efficiency**
-  If Middle East losses are due to **logistics, tariffs, or distribution inefficiencies**, restructuring operations can help.
-  Consider **regional partnerships** to reduce operational costs.

   
# **3. Product Type Performance Analysis**

## **Which product types are driving the most revenue and profit, and how can we leverage this information to boost sales across other categories**?

### **Question Overview**   
**Business Challenge**:
The company wants to evaluate the sales and profit performance of different product types to identify which categories drive the most revenue and profitability. While some products perform exceptionally well, others lag behind, limiting overall business growth. Understanding these trends is crucial for optimizing product strategy and maximizing profitability.

**Objective of the Question**:
This project aims to analyze sales and profit contributions by product type, identifying high-performing categories and areas needing improvement. By leveraging these insights, the company can refine its product portfolio, enhance marketing strategies, and boost overall sales and profitability.

**Analytical Approach**:
-	Write SQL queries to calculate total sales and profit by product type.
-	Identify top-performing product categories and underperforming ones.
-	Analyse historical trends to assess revenue and profit growth across product types.
-	Provide data-driven recommendations for optimizing product offerings, improving marketing efforts, and driving overall sales growth.

![3](https://github.com/user-attachments/assets/bd8c02d3-4417-4676-9c98-8c5c1f4f5ee0)

### **Here's the breakdown of RESULT based on the QUERY above:**
 **I.  TOP-PERFORMING PRODUCT TYPES**

1. **Own Brand** 
 -  Total Sales Amount: **$463.75 Million**
 -  Total Profit: **$9.12 Million**

2. **Distribution**
 -  Total Sales Amount: **$164.25 Million**
 -  Total Profit: **$3.18 Million**

3. **Custom Made**
-  Total Sales Amount: **$158.50 Million**
-  Total Profit: **$3.85 Million**

**II.  UNDERPERFORMING PRODUCT TYPES** 

4.   **Private Label** 
-  Total Sales Amount: **$124.72 Million**
-  Total Profit: **$2.40 Million**

5.   **Wholesale Goods**
-  Total Sales Amount: **$103.76 Million**
-  Total Profit: **$3.17 Million**

6.   **Third-Party Brand**
-  Total Sales Amount: **$53.72 Million**
-  Total Profit: **$1.21 Million**

7.   **Licensed Product**
-  Total Sales Amount: **$13.34 Million**
-  Total Profit: **$0.06 Million**
           
 ### **Query Result Visualization**
![3  Product Type Performance Analysis](https://github.com/user-attachments/assets/209bde2c-74f6-440f-953c-2bccaf2f908a) 

## **Key Insights**             
**I.  TOP-PERFORMING PRODUCT TYPES**

1.	*Own Brand is by far the highest performer**, driving the most revenue and profit. This product type is a key driver of success and should be scaled further to maintain growth.
 
2.	**Distribution products also contribute significantly to both sales and profit**, though with a lower margin compared to Own Brand. Focus on improving operational efficiency to enhance profit margins here.

3.	**Custom Made products are performing well with solid profits**, indicating that consumers value personalized or unique products. This category could be further capitalized on with customization strategies. 

**II.  UNDERPERFORMING PRODUCT TYPES** 

4.	**Private Label products are generating lower sales and profit compared to other categories**. Focus on improving brand recognition and consumer trust to boost these figures. 

5.	**Wholesale Goods, while generating revenue, have a lower profit margin compared to custom or own-brand products**. Cost reduction and streamlining distribution could help improve profitability. 

6.	**Third-Party Brand products are underperforming, especially in terms of profit**. Consider reassessing partnerships or finding ways to increase sales while improving margins. 

7.	**Licensed Products are the lowest performers in both sales and profit**. A strategic re-evaluation is needed to determine whether to continue or rebrand this category to better meet market demand. 

## **Strategic Recommendations**
1.   **Scale High-Performing Products**: 
-  Invest in marketing, product development, and customer loyalty for Own Brand to capitalize on its success. 

2.   **Enhance Distribution Channels**: 
-  Improve operational efficiencies in Distribution to boost profits by reducing costs and increasing volumes. 

3.   **Leverage Customization**: 
-  Focus on expanding Custom-Made products with more personalization and premium pricing to capture additional market share. 

4.   **Target Underperforming Categories**: 
-  Optimize pricing, marketing, and partnerships for Private Label, Wholesale Goods, and Third-Party Brand to improve profitability. 

5.   **Reassess Licensed Products**: 
-  Re-evaluate the Licensed Product line to determine if adjustments are needed or if a new approach should be considered. 

6.   **Optimize Pricing & Refine Discount Strategy**:
-	Analyse discount effectiveness
-    Experiment with small discounts for high-potential products 


# **4. Customer Type Performance Analysis**

## **Which customer types are driving the highest revenue and profit, and how can we cater to their specific needs to further increase sale**s?

### **Question Overview** 
**Business Challenge**
The company wants to identify which customer types contribute the most to revenue and profit. While overall sales may be growing, leadership needs deeper insights into customer segments to understand which groups drive the highest value. By analyzing customer performance, the business can optimize its marketing, sales strategies, and resource allocation for maximum profitability.

**Objective of the Question**
This project aims to analyse sales and profit contributions across different customer types to identify high-value segments. The insights gained will help the business:
-	Prioritize top-performing customer groups for targeted offers and loyalty programs.
-	Customize marketing strategies and product offerings to enhance engagement and sales.
-	Optimize resource allocation by focusing on the most profitable customer segments.

**Analytical Approach**
-	Use SQL queries to analyze sales and profit distribution across customer types.
-	Identify high-value customers and assess their purchasing behaviors.
-	Compare revenue and profit trends to detect opportunities for personalized engagement.
-	Provide data-driven recommendations to enhance customer retention, increase sales, and maximize profitability.

![4](https://github.com/user-attachments/assets/c36a4ae4-3d0d-4a62-b413-d748b1e802fa)

### **Here's the breakdown of RESULT based on the QUERY above:**
1.   **Brick and Mortar**:
- Total Sales Amount: **$731.34 Million** 
- Total Profit: **$13.71 Million**

2.   **Click and Mortar**:
- Total Sales Amount: **$240.73 Million** 
- Total Profit: **$6.11 Million** 
        
3.   **E-Commerce**:
- Total Sales Amount: **$109.96 Million**
- Total Profit: **$3.17 Million**

### **Query Result Visualization**
![4  Customer Type Performance Analysis](https://github.com/user-attachments/assets/bcb970ac-66f9-4c3e-8293-57470adae9fd)

## **Key Insights**             
1. **Performance Analysis by Customer Type**:
-  ** Brick and Mortar dominates in revenue and absolute profit** but operates at thinner margins. High operational costs (e.g., rent, inventory, logistics) could be reducing profitability.
-  **E-Commerce has the highest profit margin**. Lower operational costs, digital efficiencies, and direct-to-consumer sales likely drive this.
-  **Click and Mortar has a strong sales volume and maintains a stable profit margin**—suggesting that an omnichannel approach is effective.

2. **Potential Areas of Concern**:
-  **Brick and Mortar may face profitability challenges** if costs increase, given its already low margins.
-  **E-Commerce has growth potential but needs higher sales volume** to match the absolute profit of the other segments.
-	**Click and Mortar needs further analysis** to determine whether it should lean more toward physical or digital expansion.

## **Strategic Recommendations**
1. **Brick and Mortar (High Sales, Low Margin)**
-  **Optimize operations**: Reduce overhead costs (rent, staffing, supply chain inefficiencies).
-  **Increase high-margin product sales**: Introduce premium product lines or bundling strategies.
-  **Leverage omnichannel strategies**: Drive foot traffic through online-to-offline promotions and loyalty incentives.

2. **Click and Mortar (Balanced Sales and Profit)**
-  **Enhance digital-physical integration**: Improve in-store pickup and hybrid shopping experiences.
-  **Targeted promotions**: Use customer data to offer discounts based on purchase history.
-  **Expand best-performing stores**: Identify top locations and replicate success in similar markets.
  
3.  **E-Commerce (Highest Margin, Lowest Sales)**
-  **Invest in digital marketing & SEO**: Boost online visibility and drive traffic.
-  **Enhance logistics & fulfillment**: Faster delivery times can increase conversions and repeat purchases.
-  **Expand product assortment**: Introduce more categories to encourage cross-selling.


# **5. Yearly Spotlight: Top 3 Customers Driving Sales Excellence**

## **Who are the top-performing customers each year, and how can their purchasing behaviors guide our strategic decisions**?

### **Question Overview**   
**Business Challenge**
The company seeks to identify its top-performing customers and understand their purchasing behaviours. While overall sales may be growing, leadership wants to determine which customers drive the highest revenue and how their behaviour can inform strategic decisions. 

**Objective of the Question**
This project aims to analyse annual customer performance to identify top contributors to sales. By understanding high-value customer behaviour, the business can:
-	Prioritize and strengthen relationships with key customers.
-	Discover patterns in purchasing behaviour to replicate success across other segments.
-	Develop targeted marketing and loyalty initiatives to retain and expand business with top customers.

**Analytical Approach**
-	Use SQL queries to identify top customers based on annual sales contributions.
-	Analyse purchasing trends and behaviours of high-value customers.
-	Compare customer retention rates and assess loyalty program effectiveness.
-	Provide data-driven recommendations to enhance customer relationships, improve retention, and optimize sales strategies.
  
![5](https://github.com/user-attachments/assets/a2f0ab0d-e211-4628-8878-c8ab3c8407e1)

### **Here's the breakdown of RESULT based on the QUERY above:**	
**2020** 
   
**1.  Prime Stop Superstores**: $54.86 Million 
-   Dominates sales in 2020—critical to maintain and strengthen this  relationship.
  
**2.   Speak Out Mart**: $8.27 Million 
-  Moderate performance; potential for growth through targeted engagement.
    
**3.   Excel Stores**: $7.95 Million
-  Slightly behind; explore loyalty programs to increase their sales contribution. 

**2021** 
   
**1.   Prime Stop Superstores**: $130.40 Million 
-  A massive leap in sales, making this customer the star performer of the year. 

**2.  Speak Out Mart**: $18.27 Million
-  Growth observed; capitalize on their upward trend with personalized offers.
   
**3.  Excel Stores**: $15.55 Million
-  Healthy growth—ensure consistent service to nurture their loyalty.

**2022** 

**1.  Prime Stop Superstores**: $121.81 Million
-  A slight dip from 2021, but they remain the top customer. Analyse the reason for the decline to maintain their momentum. 
    
**2.   Speak Out Mart**: $16.94 Million 
-  Stable performance; consider tailored incentives to encourage further growth. 
    
**3.   Excel Stores**: $14.60 Million 
-  Sales decreased slightly; evaluate areas for re-engagement.

**2023** 

**1.  Prime Stop Superstores**: $130.56 Million
-  Strong comeback to 2021 levels—this is your power customer! Maintain close collaboration to sustain growth.
    
**2.  Excel Stores**: $15.98 Million 
-  Back on track with steady growth. Keep providing value to nurture this positive trend. 
    
**3.  peak Out Mart**: $14.98 Million 
-  Slight decline; reengage with targeted campaigns to revive their momentum.

### **Query Result Visualization**
![5  Yearly Sportlight](https://github.com/user-attachments/assets/5eb1fdee-008e-4c87-aaf1-484cff61b390)
 
## **Key Insights**             
1. **Top Performer**:
-  Prime Stop Superstores leads consistently every year, contributing the majority of sales. Prioritize this customer with loyalty programs, personalized pricing, and exclusive deals. 

2.  **Growth Opportunity**:
- Speak Out Mart shows potential for steady growth. Target this segment with strategic offers to increase their spend. 

3. **Reengagement Needed**:
-  Excel Stores has fluctuating sales—analyse their preferences and offer tailored solutions to maintain loyalty. 
       
 ## **Strategic Recommendations**
 1. **Addressing Sales Decline**
-  **Investigate Prime Stop Superstores' reduced sales**: Conduct customer feedback sessions to understand their shifting needs and identify competitive threats.
-  **Re-engage Speak Out Mart and Excel Stores**: Offer personalized incentives, discounts, or loyalty programs to boost retention.
-  **Diversify the customer base**: Reduce reliance on a single large buyer (Prime Stop Superstores) by acquiring new high-value customers.

2. **Strengthening Customer Relationships**
-  **Develop tailored account management strategies** for Prime Stop Superstores to rebuild lost sales.
-  **Implement data-driven promotions**: Use historical purchasing trends to provide customized offers for each customer.
-  **Enhance customer service and engagement**: Strengthen partnerships through proactive communication and strategic collaborations.

3. **Improving Market Positioning**
-  **Competitor Analysis**: Identify if competitors have taken market share from these customers.
-  **Pricing & Value Proposition Review**: Assess whether pricing strategies remain competitive and appealing.
-  **Expand Product/Service Offerings**: If certain product lines are declining in sales, introduce complementary or high-demand alternatives.

 
# **6. Pareto Analysis of Customers (80/20 Rule) Based on Sales Amount**

## **Who are the key customers responsible for 80% of total sales, and how can we leverage this insight to maximize business impact**?

### **Question Overview** 
**Business Challenge**:
The company wants to identify the key customers responsible for the majority of its revenue. While the customer base is diverse, leadership seeks to understand which customers contribute the most to total sales and how to optimize strategies for retention and growth. Leveraging the Pareto Principle (80/20 Rule) will help focus efforts on high-value customers while improving overall business efficiency.

**Objective of the Question**:
This project aims to conduct a Pareto Analysis to identify the top 20% of customers generating 80% of total sales. By understanding these key customers, the business can develop targeted strategies to enhance customer retention, optimize resource allocation, and drive long-term profitability.

**Analytical Approach**:
-	Write SQL queries to calculate total sales per customer and determine the cumulative sales distribution.
-	Identify the top 20% of customers contributing to 80% of revenue.
-	Analyse purchasing patterns and customer behavior to develop targeted engagement strategies.
-	Provide data-driven recommendations to strengthen relationships with high-value customers while improving overall sales efficiency.

![6](https://github.com/user-attachments/assets/052b1dd0-bc6c-476a-b798-24b1affb7573)

### **Here's the breakdown of RESULT based on the QUERY above:**
**Key Customers Responsible for 80% of Total Sales**

**1.  Prime Stop Superstores**: $437.63 Million
-  Cumulative Sales: $437.63 Million (40.44%)

**2.  Speak Out Mart**: $58.46 Million
- Cumulative Sales: $496.09 Million (45.85%)

**3.  Excel Stores**: $54.09 Million
- Cumulative Sales: $550.17 Million (50.85%)

**4.  Premium Stores**: $50.23 Million
- Cumulative Sales: $600.40 Million (55.49%)

**5.  Sunset Plaza**: $43.91 Million
- Cumulative Sales: $644.31 Million (59.55%)

**6. Vista Goods**: $41.80 Million
- Cumulative Sales: $686.11 Million (63.41%)

**7.  Nixon Hub** : $40.03 Million
- Cumulative Sales: $726.14 Million (67.11%)

**8.  Acclaimed Stores**: $28.05 Million
- Cumulative Sales: $754.19 Million (69.7%)

**9.  Surge Stores**: $27.61 Million
- Cumulative Sales: $781.80 Million (72.25%)

**10.  Forward Stores**: $26.17 Million
- Cumulative Sales: $807.97 Million (74.67%)

**11.  Nomad Stores**: $23.30 Million
- Cumulative Sales: $831.27 Million (76.83%)

**12.  Shop Ease**: $22.75 Million
- Cumulative Sales: $854.03 Million (78.93%)

### **Query Result Visualization**
![6  Pareto Analysis of Customers Based on Sales Amount](https://github.com/user-attachments/assets/16cb89b9-ebff-4b2d-8bd2-79e0c5610895)

## **Key Insights**             
**I.  CUSTOMER REVENUE CONTRIBUTION TRENDS**
1.  **The business is highly dependent on a few key customers**. The top three customers alone generate over 50% of total sales, making them the most valuable.

2.  **The top 12 customers contribute approximately 80% of total revenue**. Any significant drop in sales from these customers would heavily impact overall business performance.

3.  **Prime Stop Superstores is the dominant customer** with over 40% revenue share, meaning that any shift in its purchasing behaviour could dramatically affect company revenue.

4.   **The remaining customers (beyond the top 12) have a significantly lower impact on total sales**, suggesting that the company should focus its retention strategies on the top tier first.

## **Strategic Recommendations**
1.  **Strengthening Relationships with Top Customers**:
-  **Prioritize retention strategies for the top 12 customers**. These key accounts should receive personalized offers, dedicated account management, and loyalty incentives.
-  **Conduct direct engagement with Prime Stop Superstores**. Since it contributes over 40% of total revenue, strengthening this relationship is crucial.
-  **Offer tiered loyalty programs**. Provide exclusive benefits for high-value customers to ensure long-term retention and increase their spending.

2.  **Revenue Diversification & Risk Mitigation**:
-  **Reduce over-reliance on a few customers**. If Prime Stop Superstores reduces its orders, the impact on revenue would be drastic. The business should aim to grow smaller customers into high-value clients.
-  **Analyse at-risk customers**. Identify any declining purchasing trends in the top 12 customers and intervene early with tailored offers.
-  **Expand customer base strategically**. The company should target mid-tier customers (e.g., Nomad Stores, ShopEase) for growth opportunities.

3.  **Data-Driven Customer Segmentation & Personalization**:
-  **Leverage sales data to identify customer preferences**. Develop personalized marketing campaigns based on historical buying behaviours.
-  **Optimize pricing and product offerings**. Ensure high-value customers receive competitive pricing and product bundles that align with their needs.
-  **Enhance customer service for key accounts**. Assign dedicated account managers to high-value customers to strengthen relationships.


# **7. Customer Segmentation**

## **Who are the high-value customers driving both sales revenue and volume, and how can we strategically engage them for maximum growth**?

### **Question Overview**
**Business Challenge**:
The company wants to better understand its customer base by identifying high-value customers who significantly impact sales revenue and volume. While some customers contribute heavily to business performance, others may require strategic engagement to maximize their potential. Leadership seeks data-driven insights to optimize customer relationship management and drive sustainable growth.

**Objective of the Question**:
This project aims to segment customers into High, Medium, and Low Value categories based on sales revenue and purchase volume. By leveraging these insights, the company can prioritize high-value customers, nurture medium-value customers, and re-engage low-value customers to enhance overall sales efficiency and profitability.

**Analytical Approach**:
-	Write SQL queries to categorize customers into High, Medium, and Low Value segments based on sales revenue and volume.
-	Identify key characteristics and purchasing patterns of high-value customers.
-	Develop targeted engagement strategies to retain and maximize high-value customer relationships.
-	Provide data-driven recommendations to nurture medium-value customers and re-engage low-value customers for overall business growth.

![7](https://github.com/user-attachments/assets/f51cc603-41a8-4113-b333-a1fbc65113de)
   
### **Here's the breakdown of RESULT based on the QUERY above:**
**I.  HIGH-VALUE CUSTOMERS (BIG SPENDERS & BIG MOVERS):** Customers Driving Sales Revenue and Volume 

**1.  Prime Stop Superstores**	                                            
-  Total Sales Amount: $437.63 Million 
-  Total Sales Qty (unit): 518.16 k	
 
**2.  Speak Out Mart**	                                            	        
- **Total Sales Amount**: $58.46 Million 
- **Total Sales Qty (unit)**: 87.70 K	
  
**3.  Excel Stores**	                                                       
- **Total Sales Amount**: $54.09 Million 
- **Total Sales Qty (unit)**: 110.56 K	

**4.  Premium Stores**	                                                     
- **Total Sales Amount**: $50.23 Million	
- **Total Sales Qty (unit)**: 208.34 K	

**5.  Sunset Plaza**	                                                       
- **Total Sales Amount**: $43.91 Million 
- **Total Sales Qty (unit)**: 56.68 K	

**6.  Vista Goods**	                                                        
- **Total Sales Amount**: $41.80 Million	
- **Total Sales Qty (unit)**: 57.95 K	

**7.  Nixon Hub**	                                                         
- Total Sales Amount**: $40.03 Million	
- **Total Sales Qty (unit)**: 104.68 K	

**8.  Surge Stores**	                                             	       
- **Total Sales Amount**: $27.61 Million 
- **Total Sales Qty (unit)**: 141.45 K	

**9.  Forward Stores**	                                                      
- **Total Sales Amount**: $26.17 Million	
- **Total Sales Qty (unit)**: 40.05 K	

### **Query Result Visualizations** - **HIGH-VALUE CUSTOMERS (The Big Spenders & Movers)**

![1  New](https://github.com/user-attachments/assets/e9d28183-c50c-4f37-881a-ad2b9bd41904)

![1  new](https://github.com/user-attachments/assets/d3706976-fa7d-49ed-98e0-f239b40f98e1)

## **Key Insights**
**I.  CUSTOMER REVENUE AND VOLUME CONTRIBUTION TRENDS**

1.  **High-Value customers drive the bulk of revenue**:
-  Prime Stop Superstores alone contributes **over 40% of total revenue**.
-  The top five High-Value customers collectively generate a substantial portion of total sales.

2.  **Volume vs. Revenue Disparity**:
-  Some High-Value customers purchase fewer units at a high price (e.g., Sunset Plaza, Vista Goods), indicating a preference for premium products.
-  Others (e.g., Premium Stores, Surge Stores) have high unit purchases, implying price-sensitive or bulk-buying behaviour.

3.  **Medium-Value customers have growth potential**:
-  Some customers in this segment (e.g., Epic Plaza, Urban Finds) purchase significant quantities but remain in the Medium-Value category.
-  These customers could be nurtured into High-Value status with targeted strategies.

4.  **Low-Value customers contribute minimally**:
-  Many low-value customers purchase very few units (e.g., Sage Market, Cornerstone Supplies).
-  Retaining them may require incentives, bundled pricing, or a reassessment of their long-term profitability.

## **Strategic Recommendations**
**I.  STRENGTHENING RELATIONSHIPS WITH HIGH-VALUE CUSTOMERS**

1.  **Develop exclusive VIP programs**:
-  Offer priority access, customized discounts, and premium services to maintain strong relationships.
-  Assign dedicated account managers for top customers like Prime Stop Superstores.

2.  **Segment further by behaviour**:
-  High-revenue, low-quantity customers → Focus on premium product offerings.
-  High-revenue, high-quantity customers → Offer bulk discounts and ensure supply chain reliability.

3.  **Secure long-term contracts**:
-  Encourage multi-year agreements or loyalty incentives to lock in high-value customers.

**II.  NURTURING MEDIUM-VALUE CUSTOMERS FOR GROWTH**

4.  **Target top Medium-Value customers for upselling**:
-  Customers like Epic Plaza and Urban Finds have strong sales quantity but could spend more.
-  Use targeted promotions, volume-based discounts, or bundled offers.

5.  **Identify customers close to High-Value status**:
-  Example: Acclaimed Stores and Surge Stores are on the borderline.
-  Personalized engagement, incentives, or relationship management could push them into the High-Value category.

**III.  RE-ENGAGING LOW-VALUE CUSTOMERS**

6.  **Analyse customer profitability**:
- Some Low-Value customers may not be worth further investment.
- Others might need strategic offers or marketing to increase spending.

7.  **Introduce minimum order incentives**:
-  Encourage small customers to place larger, more frequent orders.
-  Offer discounts on bulk purchases to increase volume.

8.  **Improve customer segmentation with behavioural data**:
-  Identify which Low-Value customers have potential and re-engage them with targeted marketing.
-  If no growth potential, optimize resources elsewhere.


# **Key Expected Outcomes and Estimated Business Impact**
1. **Stabilizing Revenue Growth (+10% to +20%)**
-  Improving demand forecasting and optimizing sales strategies can reduce revenue fluctuations.
-  Sustainable demand expansion ensures that growth isn’t just driven by promotions but by real market demand.

2. **Boosting Profit Margins (+15% to +25%)**
-  Profitability analysis and cost optimization can improve efficiency.
-  Dynamic pricing models can capture more revenue from high-demand periods while maintaining margins.
-  Cutting unnecessary operational costs can help stabilize profit levels.

3. **Ensuring Long-Term Business Sustainability (+12% to +18%)**
-  Customer retention efforts and loyalty programs will lead to repeat purchases.
-  Revenue diversification reduces over-reliance on a few customers or regions.
-  Strategic product mix adjustments improve profitability by focusing on high-margin products.

4. **Maximizing Growth in High-Performing Markets (+20% to +30%)**
-  Strengthening North America and expanding in Europe/Asia will drive higher sales.
-  Localized strategies in different markets ensure better market penetration.

5. **Turnaround Strategy for Underperforming Regions (+10% to +15%)**
-  Addressing losses in the Middle East and low-profit regions can improve cost efficiency.
-  Exiting non-viable markets and reallocating resources can prevent further losses.

6. **Optimizing Market Expansion Strategy (+15% to +22%)**
-  Reducing dependency on a single market minimizes risk.
-  Dynamic pricing and operational efficiencies ensure cost-effective market scaling.

7. **Strengthening Customer Relationships (+12% to +20%)**
-  VIP programs and targeted engagement increase customer lifetime value.
-  Strengthening partnerships with top buyers ensures consistent revenue.

8. **Retail & E-commerce Optimization (+10% to +18%)**
-  Brick-and-mortar cost optimization and omnichannel strategies increase profitability.
-  E-commerce investments drive higher-margin sales and customer acquisition.


## **What I Learned**
Through this analysis, I gained:
1.	A deeper understanding of key business performance metrics.
2.	Insights into how market dynamics influence sales and profitability.
3.	Hands-on experience with advanced analytical tools and storytelling techniques.
4.	The importance of tailoring strategies to specific markets, products, and customer types.

 ## **Conclusion**
This analysis showcases the power of data-driven decision-making in identifying trends, challenges, and opportunities. By focusing on high-performing regions, products, and customer types, while addressing underperforming areas, businesses can achieve sustainable growth and long-term success.

 ## **Closing Thought**
Data is the new oil, but insights are the fuel that drives business growth. As a Data Analyst, my passion lies in uncovering these insights and translating them into strategies that make a real impact. Let’s transform data into decisions and challenges into opportunities!

### **Feel free to explore, share, and connect**! Let's transform data into decisions that drive measurable impact.

## **Connect with Me**
- **📞 +234-8065060691**
- **📧 Email: krisbalo11@gmail.com**
- **🔗 LinkedIn**: [Connect with me on LinkedIn](https://www.linkedin.com/in/olumide-balogun1/)
- **🔗 Medium**: [Explore my Data Storytelling articles](https://medium.com/@Olumide-Balogun)




