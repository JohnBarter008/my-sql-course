/*
The Chinook database contains details of an online music store.
Here are some example answers to the question
*/

-- List all customers
select * from Customer c 

-- List all customers. Show only the CustomerId, FirstName and LastName columns
SELECT C.CustomerId, C.FirstName, C.LastName
FROM Customer as C


-- List customers in the United Kingdom
SELECT C.CustomerId, c.FirstName, C.LastName, C.Country
FROM Customer as C
WHERE C.Country = 'United Kingdom'

-- List customers whose first names begins with an A.
-- Hint: use LIKE and the % wildcard
SELECT C.CustomerId, c.FirstName, C.LastName, C.Country
FROM Customer as C
WHERE C.FirstName LIKE 'A%'

-- List Customers with an apple email address
SELECT C.CustomerId, c.FirstName, C.LastName, C.Country, C.Email
FROM Customer as C
WHERE C.Email LIKE '%@apple.%'

-- Which customers have the initials LK?
SELECT C.CustomerId, c.FirstName, C.LastName, C.Country, C.Email
FROM Customer as C
WHERE (C.FirstName LIKE 'L%' AND C.LastName Like 'K%')

-- Which are the corporate customers i.e. those with a value, not NULL, in the Company column?
SELECT C.CustomerId, c.FirstName, C.LastName, C.Country, C.Company
FROM Customer as C
WHERE C.Company IS NOT NULL

-- How many customers are in each country.  Order by the most popular country first.
SELECT Count(*) as Number_Customers,C.Country
FROM Customer as C
--WHERE C.Company IS NOT NULL
GROUP BY C.Country
ORDER BY Number_Customers DESC

-- When was the oldest employee born?  Who is that?
SELECT TOP 1 e.BirthDate FROM Employee e

SELECT MIN (e.Birthdate) FROM Employee e


-- List the 10 latest invoices. Include the InvoiceId, InvoiceDate and Total
-- Then  also include the customer full name (first and last name together)
SELECT TOP (10) i.InvoiceId, i.InvoiceDate, i.Total,
    --c.FirstName, c.LastName, (c.FirstName + ' ' + c.LastName) as 'CustomerName'
    CONCAT(c.FirstName,' ',c.LastName) as 'CustomerName2'
    ,c.SupportRepId, CONCAT(e.FirstName,' ',e.LastName)
FROM Invoice i
    Left Join Customer c ON i.CustomerId = c.CustomerId  
    Left Join Employee e ON c.SupportRepId = e.EmployeeId    
ORDER BY I.InvoiceDate DESC


-- List the customers who have spent more than £45
SELECT Sum(i.Total) as 'TotalSpend',
    c.FirstName, c.LastName, (c.FirstName + ' ' + c.LastName) as 'CustomerName'
FROM Invoice i
    Left Join Customer c ON i.CustomerId = c.CustomerId  
WHERE TotalSpend > 45
GROUP BY 
    c.FirstName, c.LastName, (c.FirstName + ' ' + c.LastName)
ORDER BY I.InvoiceDate DESC

-- List the City, CustomerId and LastName of all customers in Paris and London, 
-- and the Total of their invoices
	
-- Show all details about customer Michelle Brooks.  List salient details of her invoices.

/*
Which employees were born in the 1960s?  Show only the EmployeeId, FirstName, LastName and BirthDate columns
Note: Define a date value as with the region independent format 'yyyy-mm-dd' e.g. '1969-12-31'
*/


-- List countries, and the number of customers and the total invoiced amount
-- Order  high to low in terms of the number of customers

-- What are the top 10 most popular artists in terms of number of tracks bought by customers?

-- List the albums in alphabetical order of Title

-- List 10 albums and their artist.  Order by album title.
