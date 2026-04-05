CREATE DATABASE OnlineBookstore;
use OnlineBookstore;

DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);
DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);
DROP TABLE IF EXISTS orders;
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount decimal(10, 2)
);

SELECT * FROM Books;

SELECT * FROM Customers;

SELECT * FROM Orders;

SHOW TABLES;
SELECT * FROM Books;

SHOW TABLES;
SELECT * FROM Customers;

SHOW TABLES;
SELECT * FROM Orders ;

-- 1) Retrieve all books in the "Fiction" genre:

SELECT * FROM Books
WHERE Genre='Fiction';


-- 2) Find books published after the year 1950:
SELECT * from Books
where Published_Year>1950;


-- 3) List all customers from the Canada:
select * from Customers
where Country='Canada';


-- 4) Show orders placed in November 2023:
select * from Orders
where Order_Date between '2023-11-01' and '2023-11-30';

-- 5) Retrieve the total stock of books available:
select sum(Stock) as total_stock from Books;
-- group by Stock;

-- 6) Find the details of the 5 most expensive book:
select * from Books
order by price desc  limit 5;

-- 7) Show all customers who ordered more than 1 quantity of a book:
Select *
from Orders
where Quantity>1;

-- 8) Retrieve all orders where the total amount exceeds 320:
select * from Orders
where Total_Amount>320;

-- 9) List all Genres available in the Books table:
select Distinct Genre from Books;

-- 10) Find the book with the lowest stock:
select * from books
order by Stock
limit 10 ;

-- 11) Calculate the total revenue generated from all orders:
select sum(Total_Amount) as Total_revenue
from Orders;

-- Advance Questions : 
SELECT * FROM Books;

SELECT * FROM Customers;

SELECT * FROM Orders;

-- 1) Retrieve the total number of books sold for each genre:
select b.genre,sum(o.Quantity) as total_quantity
from Books as b
join Orders as o
on b.Book_ID=o.book_id
group by b.genre;

 --  2) Find the average price of books in the "Fantasy" genre:
select avg(price) ,Genre
from Books
where Genre='Fantasy';


-- 3) List customers who have placed at least 2 orders:
select c.Name,o.Customer_ID,COUNT(o.Order_ID) as o_count
from Customers as c
join Orders as o
on c.Customer_ID=o.Customer_ID
group by o.Customer_ID,c.NAME
having count(Order_ID)>=2;

-- 4) Find the most frequently ordered book:
select o.Book_id, b.Title , count(o.Order_ID) as order_count
from Orders as o  join Books as b on o.Book_ID=b.Book_ID
group by o.Book_id,b.Title
order by order_count desc
limit 10;


-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
select Title,price,Genre from Books
where Genre='Fantasy'
order by price desc
limit 3;

-- 6) Retrieve the total quantity of books sold by each author:
select  b.Author,sum(o.Quantity) as quan
from Books b join Orders o on b.Book_id=o.Book_id
group by Author;

-- 7) List the cities where customers who spent over $30 are located:
select distinct c.City 
from Customers as c join Orders as o on c.Customer_id=o.Customer_id
where o.Total_Amount>30;

-- 8) Find the customer who spent the most on orders:
select c.Customer_id, c.Name ,sum(o.Total_Amount) as total_spent
from Customers as c join Orders as o on c.Customer_id=o.Customer_id
group by c.Customer_id, c.Name
order by  total_spent desc;


-- 9) Calculate the stock remaining after fulfilling all orders
select b.Book_ID,b.Title,b.Stock,
coalesce(sum(o.Quantity),0) as order_quantity,
b.Stock- coalesce(sum(o.Quantity),0) as remaining_stock
from Books as b left join Orders as o on b.Book_id=o.Book_id
group by b.Book_ID,b.Title,b.Stock
order by b.Book_id;











