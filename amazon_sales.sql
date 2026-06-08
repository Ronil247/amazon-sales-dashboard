
USE amazon_sales;

-- total number of orders
SELECT COUNT(*) AS Total_Orders
FROM sales;

SELECT SUM(Total_Sales_INR) AS Total_Revenue
FROM sales;

SELECT SUM(Quantity) AS Total_Quantity_Sold
FROM sales;

SELECT AVG(Total_Sales_INR) AS Average_Order_Value
FROM sales;

SELECT AVG(Review_Rating) AS Average_Rating
FROM sales;

-- CATEGORY ANALYSIS

SELECT Product_Category,
       SUM(Total_Sales_INR) AS Revenue
FROM sales
GROUP BY Product_Category
ORDER BY Revenue DESC;

SELECT Product_Category,
       SUM(Quantity) AS Quantity_Sold
FROM sales
GROUP BY Product_Category
ORDER BY Quantity_Sold DESC;

SELECT Product_Category,
       AVG(Review_Rating) AS Avg_Rating
FROM sales
GROUP BY Product_Category
ORDER BY Avg_Rating DESC;

-- STATE ANALYSIS

SELECT State,
       SUM(Total_Sales_INR) AS Revenue
FROM sales
GROUP BY State
ORDER BY Revenue DESC;

SELECT State,
       COUNT(*) AS Orders_Count
FROM sales
GROUP BY State
ORDER BY Orders_Count DESC;

SELECT State,
       AVG(Review_Rating) AS Avg_Rating
FROM sales
GROUP BY State
ORDER BY Avg_Rating DESC;

-- PAYMENT METHOD ANALYSIS

SELECT Payment_Method,
       COUNT(*) AS Total_Orders
FROM sales
GROUP BY Payment_Method
ORDER BY Total_Orders DESC;

SELECT Payment_Method,
       SUM(Total_Sales_INR) AS Revenue
FROM sales
GROUP BY Payment_Method
ORDER BY Revenue DESC;

-- DELIVERY ANALYSIS

SELECT Delivery_Status,
       COUNT(*) AS Orders_Count
FROM sales
GROUP BY Delivery_Status;

SELECT Delivery_Status,
       SUM(Total_Sales_INR) AS Revenue
FROM sales
GROUP BY Delivery_Status;

SELECT SUM(Total_Sales_INR) AS Returned_Revenue
FROM sales
WHERE Delivery_Status = 'Returned';

-- PRODUCT ANALYSIS

SELECT Product_Name,
       SUM(Total_Sales_INR) AS Revenue
FROM sales
GROUP BY Product_Name
ORDER BY Revenue DESC
LIMIT 10;

SELECT Product_Name,
       SUM(Quantity) AS Quantity_Sold
FROM sales
GROUP BY Product_Name
ORDER BY Quantity_Sold DESC
LIMIT 10;

SELECT Product_Name,
       AVG(Review_Rating) AS Avg_Rating
FROM sales
GROUP BY Product_Name
ORDER BY Avg_Rating DESC
LIMIT 10;

-- CUSTOMER ANALYSIS

SELECT Customer_ID,
       SUM(Total_Sales_INR) AS Total_Spent
FROM sales
GROUP BY Customer_ID
ORDER BY Total_Spent DESC
LIMIT 10;

SELECT Customer_ID,
       COUNT(*) AS Total_Orders
FROM sales
GROUP BY Customer_ID
ORDER BY Total_Orders DESC
LIMIT 10;



-- FILTERING QUERIES

SELECT *
FROM sales
WHERE Review_Rating = 5;

SELECT *
FROM sales
WHERE Total_Sales_INR > 100000;

SELECT *
FROM sales
WHERE Product_Category = 'Electronics';

SELECT *
FROM sales
WHERE Delivery_Status = 'Returned';


-- TOP 5 STATES

SELECT State,
       SUM(Total_Sales_INR) AS Revenue
FROM sales
GROUP BY State
ORDER BY Revenue DESC
LIMIT 5;

-- TOP 5 CATEGORIES


SELECT Product_Category,
       SUM(Total_Sales_INR) AS Revenue
FROM sales
GROUP BY Product_Category
ORDER BY Revenue DESC
LIMIT 5;
