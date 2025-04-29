1.cleaned dataset (if needed)

CREATE TABLE online_sales_cleaned AS
SELECT 
  InvoiceNo AS order_id,
  substr(InvoiceDate, 1, 10) AS order_date,  
  StockCode AS product_id,
  UnitPrice * Quantity AS amount
FROM online_sales_dataset
WHERE Quantity > 0 AND UnitPrice > 0;  

2.Run the Monthly Revenue and Volume Query

SELECT 
  strftime('%Y', InvoiceDate) AS year,
  strftime('%m', InvoiceDate) AS month,
  SUM(UnitPrice) AS monthly_revenue,
  COUNT(DISTINCT InvoiceNo) AS monthly_order_volume
FROM online_sales_dataset
GROUP BY year, month
ORDER BY year, month;

3.Monthly Revenue and Order Volume

SELECT 
    strftime('%Y', InvoiceDate) AS year,
    strftime('%m', InvoiceDate) AS month,
    SUM(UnitPrice) AS monthly_revenue,
    COUNT(DISTINCT InvoiceNo) AS monthly_order_volume
FROM 
    online_sales_dataset
GROUP BY 
    year, month
ORDER BY 
    year ASC, month ASC;

4.Top 3 months by revenue

SELECT 
    strftime('%Y', InvoiceDate) AS year,
    strftime('%m', InvoiceDate) AS month,
    SUM(UnitPrice) AS monthly_revenue
FROM 
    online_sales_dataset
GROUP BY 
    year, month
ORDER BY 
    monthly_revenue DESC
LIMIT 3;