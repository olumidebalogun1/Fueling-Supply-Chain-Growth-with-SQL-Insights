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
    total_sales_amount DESC	:

/*
Here's the breakdown of RESULT based on the QUERY above:

Top-Performing Continents 🚀

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

Underperforming Continents 📉

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

	*/


