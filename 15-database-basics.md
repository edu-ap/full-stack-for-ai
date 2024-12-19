\newpage
# Chapter 15: Database Setup and Management

Databases are critical for storing, managing, and retrieving application data. This chapter introduces fundamental concepts of database setup and management, covers relational and non-relational databases, and provides hands-on examples for creating and managing databases effectively.

## Introduction to Databases

A database is an organized collection of data that can be accessed, managed, and updated efficiently. There are two primary types of databases:
1. **Relational Databases (SQL)**: Use structured schemas with tables, rows, and columns.
   - Examples: MySQL, PostgreSQL, Microsoft SQL Server.
2. **Non-Relational Databases (NoSQL)**: Store data in flexible formats like key-value pairs, documents, or graphs.
   - Examples: MongoDB, Redis, Cassandra.

## Choosing the Right Database

### Factors to Consider
1. **Data Structure**:
   - Use SQL for structured, tabular data.
   - Use NoSQL for unstructured or semi-structured data.
2. **Scalability**:
   - SQL databases are vertically scalable (scale-up).
   - NoSQL databases are horizontally scalable (scale-out).
3. **Consistency vs. Availability**:
   - SQL prioritizes consistency (ACID transactions).
   - NoSQL prioritizes availability and partition tolerance (BASE model).

## Setting Up a Relational Database

### Example: MySQL

#### Installation
1. Install MySQL on your system:
   ```bash
   sudo apt update
   sudo apt install mysql-server
   ```
2. Secure the installation:
   ```bash
   sudo mysql_secure_installation
   ```

#### Creating a Database
1. Log into the MySQL shell:
   ```bash
   mysql -u root -p
   ```
2. Create a database:
   ```sql
   CREATE DATABASE my_app;
   ```
3. Use the database:
   ```sql
   USE my_app;
   ```
4. Create a table:
   ```sql
   CREATE TABLE users (
       id INT AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(100),
       email VARCHAR(100)
   );
   ```
5. Insert data:
   ```sql
   INSERT INTO users (name, email) VALUES ('John Doe', 'john@example.com');
   ```

#### Querying Data
Retrieve data with SQL queries:
```sql
SELECT * FROM users;
```

## Setting Up a Non-Relational Database

### Example: MongoDB

#### Installation
1. Install MongoDB on your system:
   ```bash
   sudo apt update
   sudo apt install -y mongodb
   ```
2. Start the MongoDB service:
   ```bash
   sudo systemctl start mongodb
   ```

#### Creating a Database
1. Open the MongoDB shell:
   ```bash
   mongo
   ```
2. Create or switch to a database:
   ```javascript
   use my_app
   ```
3. Insert a document:
   ```javascript
   db.users.insertOne({ name: 'Jane Doe', email: 'jane@example.com' });
   ```

#### Querying Data
Retrieve data with MongoDB queries:
```javascript
db.users.find();
```

## Database Management

### Backups
1. **MySQL**:
   ```bash
   mysqldump -u root -p my_app > my_app_backup.sql
   ```
2. **MongoDB**:
   ```bash
   mongodump --db my_app --out /backups/
   ```

### Performance Optimization
1. Indexing: Use indexes to speed up queries.
2. Connection Pooling: Optimize database connections.
3. Query Optimization: Use EXPLAIN to analyze query performance.

### Security
1. Use strong passwords and authentication mechanisms.
2. Restrict database access to specific IP addresses.
3. Encrypt data at rest and in transit.

## Hands-On Exercise: Building a Simple Application

### Step 1: Set Up the Backend
1. Install Node.js and Express:
   ```bash
   npm install express mysql
   ```
2. Create a database connection in `index.js`:
   ```javascript
   const express = require('express');
   const mysql = require('mysql');

   const app = express();
   const db = mysql.createConnection({
       host: 'localhost',
       user: 'root',
       password: '',
       database: 'my_app'
   });

   db.connect(err => {
       if (err) throw err;
       console.log('Connected to MySQL');
   });

   app.get('/users', (req, res) => {
       db.query('SELECT * FROM users', (err, results) => {
           if (err) throw err;
           res.json(results);
       });
   });

   app.listen(3000, () => console.log('Server running on port 3000'));
   ```

### Step 2: Test the Application
1. Start the server:
   ```bash
   node index.js
   ```
2. Access the endpoint in your browser:
   ```
   http://localhost:3000/users
   ```

## Summary

In this chapter, you learned:
- The differences between relational and non-relational databases.
- How to set up and manage MySQL and MongoDB databases.
- Best practices for database security, backups, and optimization.
- How to integrate a database into a simple Node.js application.

Databases are the foundation of modern applications, enabling efficient data storage and retrieval. In the next chapter, we’ll explore AI embeddings and foundation models to enhance your applications with intelligent capabilities.

