
select* from dbo.sales

select distinct price from dbo.sales

select distinct product from dbo.sales

--checking avg/min/max 

SELECT product, AVG(price) AS Average_Price FROM sales
group by product

SELECT product, MIN(price) AS Minimum_Price FROM sales
group by product


SELECT product, MAX(price) AS Maximum_Price FROM sales
group by product


SELECT COUNT(*) AS Quantity, product, MIN(price) AS Minimum_Price
FROM sales
GROUP BY product 
HAVING MIN(price)<=1200

SELECT COUNT(*) AS Quantity, product, MAX(price) AS Maximum_Price FROM sales
GROUP BY product HAVING MAX(price)=7500;

SELECT product, SUM(price) AS total_price FROM sales 
GROUP BY product;


SELECT product, AVG(price) AS Average_Price FROM sales
GROUP BY product
HAVING AVG(price)>1740

-- total sale calculation
SELECT product, price, COUNT(*) AS quantity ,(COUNT(*) * price) AS total_sales FROM sales
GROUP BY product,price
HAVING COUNT(*) >=1

with sale as
(
SELECT product, price, COUNT(*) AS quantity ,(COUNT(*) * price) AS total_sales FROM sales
GROUP BY product,price
HAVING COUNT(*) >=1
) 
select  sum(total_sales) as revenue from sale



SELECT state,COUNT(*) AS orders_per_state
FROM sales 
GROUP BY state
order by 2 desc

SELECT state, SUM(price) AS total_price, COUNT(*) AS Quantity,
    CASE
        WHEN SUM(price) <= 7000 THEN 'Lowest Revenue'
        WHEN SUM(price) <= 10000 THEN 'Medium Revenue'
        ELSE 'Highest Revenue'
    END as "Rank"
FROM sales
GROUP BY state



SELECT state, SUM(price) AS total_price, COUNT(*) AS Quantity,
    CASE
        WHEN COUNT(*) <= 2 THEN 'Lowest Quantities Sold'
        WHEN COUNT(*) <= 6 THEN 'Medium Quantities Sold'
        ELSE 'Highest Quantities Sold'
    END as "Rank"
FROM sales
GROUP BY state;

SELECT * FROM sales WHERE price > 1 AND payment_type = 'Mastercard'

SELECT * FROM sales WHERE price > 1200 And payment_type = 'Visa' OR product = 'Bed'
ORDER BY payment_type;
