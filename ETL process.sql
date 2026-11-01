CREATE DATABASE RETAIL;
USE RETAIL;

SELECT * FROM STORE_DIM;


-- USE CASE -1 ( DATA CLEANING AND STANDARDIZING)
-- 1.
SELECT * FROM PRODUCT_DIM;
SELECT PRODUCTID, PRODUCTNAME,UPPER(TRIM(CATEGORY)) AS CleanCategory, Brand, CostPrice,SellingPrice
from Product_dim;

-- 2. 
select * from sales_fact;
SELECT SALEID,PRODUCTID, CUSTOMERID,STOREID, CAST(date as DATE) AS SalesDate, Quantity,Discount from sales_fact;

-- 3.
select * from customer_dim;

-- Cast the joindate into data and also give alias as joindate 
Select CustomerID, Name, Gender, City, State, Age, cast(JoinDate as Date) as Joindate, LoyaltyTier
from Customer_dim;

-- Remove all extra space from the name column using initcap(trim())
Select CustomerID, trim(Name) as CustomerName, Gender, City, State, Age, cast(JoinDate as Date) as Joindate, LoyaltyTier
from Customer_dim;


-- Use case -2 (Handling Nulls, MissingRecords & Data correction)
-- 1.

Select * from inventory_fact;

-- Handling Nulls values present in the ClosingStock column then we use coalesce() to replace null values with 0
Select InventoryID, Date, ProductID, StoreID, OpeningStock,PurchaseQty,SalesQty,coalesce(ClosingStock,0) as ClosingStock
from inventory_fact;

-- 2. 
select * from customer_dim;

-- Replace missing values in the  loyaltytier with the silver using coalesce().
Select CustomerID,Name, Gender, City, State, Age, cast(JoinDate as Date) as Joindate, coalesce(LoyaltyTier,"Silver") as LoyaltyTier
from Customer_dim;

SELECT s.storeid,s.storename,coalesce(s.region,r.defaultregion) as region from
store_dim s left join region_reference r on s.storename =r.storename;


-- USECASE -3 ( JOIN THE TABLE )

-- 1. 
select s.SaleID,s.Date,s.Quantity,p.ProductName,p.Category,c.Name,c.City,st.Region,st.StoreName 
from sales_fact as s
join product_dim as p on s.productId=p.productID
join customer_dim as c on  s.customerID=c.customerID
join store_dim as st on s.storeID=st.storeID;


-- USECASE -4 (DATA WITH DATE TO MONTH AND ALSO YEAR )
SELECT DATE,YEAR(DATE) AS YEAR, 
MONTH(DATE) AS MONTH , 
monthname(DATE) AS MONTHNAME, 
DAY(DATE) AS DAY, 
QUARTER(DATE) AS QUARTER,
WEEK(DATE) AS WEEKOFYEAR,
FORMAT(DATE,"MM-YY") AS YEARMONTH
FROM CALENDAR_DIM;

-- USECASE -5 (AGGREGATION FUNCTION)
-- 1. DAILY SALES 

SELECT s.DATE, p.PRODUCTID, s.STOREID, SUM(s.QUANTITY) AS TOTALQTY 
FROM SALES_FACT AS s 
join product_dim as p on s.productid=p.productid
GROUP BY s.DATE, p.PRODUCTID, s.STOREID 
order by totalqty desc ;

-- 2. Monthly sales 

select year(date) as year,
month(date) as month ,
productid, storeid, sum(quantity) as totalqty
from sales_fact
group by year, month, productid, storeid;


-- Use Case-6 ( Business KPI's )

-- 1. AVERAGE SALING PRICE of each productid 
SELECT p.productid,p.productname, round(sum(p.sellingprice)/sum(s.quantity)) as ASP
from sales_fact as s 
join product_dim as p 
on p.productid=s.productid 
group by p.productid,p.productname
order by asp desc;

-- 2. Contribution of which product of highest sales 
select s.category, sum(s.sellingprice) as categorysales,
(sum(s.sellingprice)*100 / (select sum(totalamount) from sales_fact)) as contribution_pct
from sales_fact s join product_dim as p
on s.productid =p.productid 
group by category;

-- 3. Calculated the repeated customer.
select customerid, count(*) as purchasecount
from sales_fact
group by customerid 
having count(*) > 5;


-- incremental load query (it is used to load new data which means those are the  new records. )
-- USE CASE -7

INSERT INTO SALES_FACT 
SELECT * FROM SALES_FACT 
WHERE DATE > (SELECT MAX(DATE) FROM SALES_FACT);

-- SCD (SLOWLY CHANGING DIMENSION )- IT is used to handle the changing / updation  from previous time to current time things maybe we can say sales, price etc.

-- 2. update the selling price from new selling price 
select p.productid, p.productname , s.date,coalesce(p.sellingprice,s.discount) as EffectivePrice
from sales_fact as s
join product_dim as p
on s.productid=p.productid
and s.date between "2024-01-01" and "2024-06-01";

-- 3. Validation and quality check 

select saleid, count(*) from 
sales_fact 
group by saleid 
having count(*) >1;


select * from sales_fact 
where quantity <0;

select s.productid 
from sales_fact as s
left join product_dim as p
on s.productid =p.productid
where  p.productid is null;


-- Final fact table 

CREATE TABLE FACT_SALEs AS 
SELECT s.SaleId,s.date as SalesDate, s.ProductId,
p.Category, p.Brand, st.StoreID,st.Region as StoreRegion,
s.CustomerID, s.Quantity, p.SellingPrice as TotalAmount
from sales_fact as s
join product_dim as p on s.productid=p.productid
join customer_dim as c on s.customerid=c.customerid
join store_dim as st on s.storeid=st.storeid;

select * from fact_sales
order by saleid asc;