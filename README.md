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

# Summary
The dataset is designed using relational database principles, enabling efficient querying, data analysis, and real-world simulation of an online bookstore system.
