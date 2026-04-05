# -SQL-OnlineBookstore
An Online Bookstore database project built using SQL, featuring structured schema design, data management, and queries for book search, order processing, and customer handling.

# Project Overview
This project presents a relational database system for an Online Bookstore developed using SQL. It focuses on designing an efficient database schema to handle books, users, and orders. The project implements key database concepts such as normalization, primary and foreign keys, and complex queries to ensure data integrity and efficient operations.

# Project Objectives
- Design a database for an online bookstore
- Manage books, customers, and orders
- Use SQL queries for data handling
- Ensure data accuracy using relationships and normalization

# key Questions
- How can we calculate the total number of books sold for each genre?
- How can we find the average price of books in the "Fantasy" genre?
- How can we identify customers who have placed at least 2 orders?
- How can we determine the most frequently ordered book?
- How can we find the top 3 most expensive books in the "Fantasy" genre?
- How can we calculate the total quantity of books sold by each author?
- How can we list the cities where customers who spent more than $30 are located?
- How can we find the customer who spent the most on orders?
- How can we calculate the remaining stock after fulfilling all orders?

# # Dataset Description
The dataset for the Online Bookstore project consists of structured relational tables that store information about books, customers, and orders. The data is organized to efficiently manage bookstore operations such as inventory tracking, customer management, and order processing.

## Tables Used
 ### Books Table: 
 Stores information about all available books.

## Attributes:
- Book_ID – Unique identifier for each book
- Title – Name of the book
- Author – Author of the book
- Genre – Category (e.g., Fiction, Fantasy)
- Price – Cost of the book
- Stock – Number of copies available
- Published_Year – Year of publication

 ### Customers Table
Stores customer details.

## Attributes:
- Customer_ID – Unique identifier for each customer
- Name – Customer name
- Email – Contact email
- Country – Customer’s country
- City – Customer’s city
 
 ### Orders Table
Stores order transaction details.
## Attributes:
- Order_ID – Unique identifier for each order
- Customer_ID – References the customer
- Book_ID – References the book
- Order_Date – Date when order was placed
- Quantity – Number of books ordered
- Total_Amount – Total cost of the order

## Relationships
- Books and Orders are linked through Book_ID
- Customers and Orders are linked through Customer_ID
- These relationships help maintain data consistency and integrity

# Data Dictionary
## Books Table
| Column Name    | Data Type | Description                          |
| -------------- | --------- | ------------------------------------ |
| Book_ID        | INT       | Unique ID for each book              |
| Title          | VARCHAR   | Name of the book                     |
| Author         | VARCHAR   | Author of the book                   |
| Genre          | VARCHAR   | Category of the book (Fiction, etc.) |
| Price          | DECIMAL   | Price of the book                    |
| Stock          | INT       | Available quantity in inventory      |
| Published_Year | INT       | Year the book was published          |

## Customers Table
| Column Name | Data Type | Description                 |
| ----------- | --------- | --------------------------- |
| Customer_ID | INT       | Unique ID for each customer |
| Name        | VARCHAR   | Customer name               |
| Email       | VARCHAR   | Customer email address      |
| Country     | VARCHAR   | Customer country            |
| City        | VARCHAR   | Customer city               |

## Orders Table
| Column Name  | Data Type | Description                |
| ------------ | --------- | -------------------------- |
| Order_ID     | INT       | Unique ID for each order   |
| Customer_ID  | INT       | Links to Customers table   |
| Book_ID      | INT       | Links to Books table       |
| Order_Date   | DATE      | Date when order was placed |
| Quantity     | INT       | Number of books ordered    |
| Total_Amount | DECIMAL   | Total price of the order   |

## Tools Used
SQL – For writing queries and managing data
MySQL – Database management system used to store data
MySQL Workbench – Tool used to design and execute SQL queries

## Sql Analysis and Queries
### Q1: How can we calculate the total number of books sold for each genre?
```sql
select b.genre,sum(o.Quantity) as total_quantity
from Books as b
join Orders as o
on b.Book_ID=o.book_id
group by b.genre;
```
### Q2: How can we find the average price of books in the "Fantasy" genre?
```sql
select avg(price) ,Genre
from Books
where Genre='Fantasy';
```
### Q3: How can we identify customers who have placed at least 2 orders?
```sql
select c.Name,o.Customer_ID,COUNT(o.Order_ID) as o_count
from Customers as c
join Orders as o
on c.Customer_ID=o.Customer_ID
group by o.Customer_ID,c.NAME
having count(Order_ID)>=2;
```
### Q4: How can we determine the 5 most frequently ordered book?
```sql
select o.Book_id, b.Title , count(o.Order_ID) as order_count
from Orders as o  join Books as b on o.Book_ID=b.Book_ID
group by o.Book_id,b.Title
order by order_count desc
limit 5;
```
### Q5: How can we find the top 3 most expensive books in the "Fantasy" genre?
```sql
select Title,price,Genre from Books
where Genre='Fantasy'
order by price desc
limit 3;
```
### Q6: How can we calculate the total quantity of books sold by each author?
```sql
select  b.Author,sum(o.Quantity) as quan
from Books b join Orders o on b.Book_id=o.Book_id
group by Author;
```
### Q7: How can we list the cities where customers who spent more than $30 are located?
```sql
select distinct c.City 
from Customers as c join Orders as o on c.Customer_id=o.Customer_id
where o.Total_Amount>30;
```
### Q8: How can we find the customer who spent the most on orders?
```sql
select c.Customer_id, c.Name ,sum(o.Total_Amount) as total_spent
from Customers as c join Orders as o on c.Customer_id=o.Customer_id
group by c.Customer_id, c.Name
order by  total_spent desc;
```
### Q9: How can we calculate the remaining stock after fulfilling all orders?
```sql
select b.Book_ID,b.Title,b.Stock,
coalesce(sum(o.Quantity),0) as order_quantity,
b.Stock- coalesce(sum(o.Quantity),0) as remaining_stock
from Books as b left join Orders as o on b.Book_id=o.Book_id
group by b.Book_ID,b.Title,b.Stock
order by b.Book_id;
```

