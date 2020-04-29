-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
    SELECT  p.'Id' "ProductId", p.'ProductName', c.'CategoryName'
    FROM "Product" AS p
    JOIN "Category" AS c
    ON p.'Id' = c.'Id';

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
    SELECT o.'Id', s.'CompanyName'
    FROM "Order" AS o
    JOIN "Shipper" AS s
    ON o."ShipVia" = s.Id
    WHERE o."OrderDate" < "2012-08-09";

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
    SELECT p."ProductName", od."Quantity"
    FROM "OrderDetail" AS od 
    JOIN "Product" AS p
    ON od."ProductId" = p."Id"
    JOIN "Order" AS o
    ON o."Id" = od."OrderId"
    WHERE o.'id' = 10251
    ORDER BY p."ProductName";

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
    SELECT o."Id" "OrderId", c."CompanyName", e."LastName" "EmployeeLastName"
    FROM "Order" AS o
    JOIN "Customer" AS c
    ON o."CustomerId" = c."Id"
    JOIN "Employee" AS e
    ON o."EmployeeId" = e."Id";


-- Stretch problems from SQL Try Editor at W3Schools.com

-- Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.
    SELECT c."CategoryName", COUNT(p."ProductID") "count"
    FROM "Products" AS p
    JOIN "Categories" AS c
    ON p."CategoryID" = c."CategoryID"
    GROUP BY c."CategoryID";