# 🛍️ Retail Sales, Inventory & Customer Insights Analytics

## 📌 Project Overview

The **Retail Sales, Inventory & Customer Insights Analytics** project is an end-to-end Business Intelligence solution developed using **Microsoft Power BI** to analyze retail business performance across sales, inventory, products, stores, and customer segments.

The project focuses on transforming raw retail data into meaningful business insights through data modeling, DAX calculations, time intelligence, KPI development, and interactive visualizations.

Using a **Star Schema data model with six interconnected tables**, this project provides a structured approach to understanding sales performance, monitoring inventory levels, evaluating customer behaviour, and supporting data-driven business decisions.

## 🎯 Project Goals & Objectives

The primary objective is to help retail businesses understand their operational and commercial performance through data-driven analysis.

Key objectives include:

- Analyze overall sales performance and identify sales trends.
- Monitor inventory levels and identify potential stockout situations.
- Understand customer purchasing behaviour and customer segments.
- Evaluate product and store-level performance.
- Perform year-over-year (YoY) and month-over-month (MoM) comparisons.
- Identify top-performing products, stores, and customers using ranking techniques.
- Calculate Inventory Days of Cover and perform ABC inventory analysis.
- Develop interactive dashboards to support business decision-making.

## 🏗️ Data Model & Star Schema

The project follows a **Star Schema data modeling approach** to organize retail business data efficiently and establish meaningful relationships between fact and dimension tables.

### Tables Used

The data model consists of six tables:

| Table     | Type            | Description                                                   |
| --------- | --------------- | ------------------------------------------------------------- |
| Sales     | Fact Table      | Contains retail sales transactions and sales-related metrics. |
| Product   | Dimension Table | Stores product details and product categories.                |
| Customer  | Dimension Table | Contains customer information and segmentation attributes.    |
| Store     | Dimension Table | Stores store-related information and locations.               |
| Calendar  | Dimension Table | Contains date attributes for time-based analysis.             |
| Inventory | Fact Table      | Tracks inventory levels and stock-related information.        |

### Data Modeling Concepts

- Star Schema architecture
- Fact and Dimension tables
- Primary and foreign key relationships
- One-to-many relationships
- Date table configuration
- Relationship management and filter propagation

## 📊 Analytical Techniques & DAX Concepts

One of the major learning areas of this project was implementing advanced analytical calculations using **DAX (Data Analysis Expressions)**.

### 1. Time Intelligence

- Year-over-Year (YoY) analysis
- Month-over-Month (MoM) analysis
- Previous month and previous year comparisons
- Year-to-date (YTD) calculations
- Monthly and yearly sales trends

### 2. Ranking & Performance Analysis

- Top N product ranking
- Customer ranking based on sales
- Store performance ranking
- Category-level performance comparisons
- Identifying best and lowest-performing segments

### 3. Business Calculations

- Total Sales
- Total Quantity Sold
- Average Sales
- Sales Growth Percentage
- Inventory Days of Cover
- ABC Inventory Classification
- Inventory performance analysis

### 4. KPI Development

- Business-oriented KPI definitions
- Sales performance indicators
- Inventory monitoring indicators
- Customer performance metrics
- Comparative performance measurement

## 💡 Business Benefits & Insights

This project demonstrates how retail analytics can help organizations improve operational efficiency and make better business decisions.

**Sales Optimization**

- Identify high-performing products and stores.
- Understand seasonal sales trends.
- Compare sales performance across different periods.

**Inventory Optimization**

- Monitor available inventory.
- Identify potential stockout situations.
- Analyze Inventory Days of Cover.
- Classify products using ABC analysis for inventory prioritization.

**Customer Understanding**

- Analyze customer purchasing patterns.
- Identify high-value customers.
- Compare customer and segment performance.
- Understand customer contribution to overall sales.

**Business Decision-Making**

- Track important business KPIs.
- Identify performance gaps.
- Support data-driven planning.
- Improve visibility into retail operations.

## 🛠️ Tools & Technologies

| Tool               | Purpose                                                |
| ------------------ | ------------------------------------------------------ |
| Microsoft Power BI | Interactive dashboards and data visualization          |
| Power Query        | Data cleaning and transformation                       |
| DAX                | Business calculations, measures, and time intelligence |
| Data Modeling      | Star Schema and table relationships                    |
| Excel              | Data inspection and preparation                        |
| SQL                | Data querying and analytical operations                |

## 📚 Key Learning Outcomes

Working on this project helped me strengthen my practical understanding of Business Intelligence and retail analytics.

Some of the major concepts I learned and practiced include:

- Designing a Star Schema data model using fact and dimension tables.
- Understanding relationships between multiple business entities.
- Creating calculated measures using DAX.
- Implementing time intelligence calculations for business comparisons.
- Applying ranking functions to identify top-performing entities.
- Performing YoY and MoM performance analysis.
- Understanding Inventory Days of Cover and ABC analysis.
- Developing business-focused KPIs.
- Translating business requirements into analytical solutions.
- Converting raw data into actionable business insights.

## 🚀 Conclusion

This project provided practical exposure to real-world retail business scenarios and helped me understand how data analytics supports sales optimization, inventory management, and customer insights.

It strengthened my ability to approach business problems analytically, design structured data models, write meaningful DAX calculations, and communicate insights through interactive Power BI dashboards.

**The key takeaway:** Data analytics is not just about creating visualizations; it is about transforming data into meaningful insights that help businesses make better decisions.

---

⭐ If you find this project useful, feel free to explore the repository and share your feedback!
