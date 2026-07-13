# E-Commerce Analytics System

## Overview

This project demonstrates an end-to-end E-Commerce Analytics System using Python, Pandas, SQL, and SQLite. It covers data generation, data cleaning, SQL analytics, Python-SQL integration, and edge case testing. The project simulates a real-world e-commerce environment by generating realistic datasets with intentional data quality issues and extracting business insights through SQL queries.

---

## Technologies Used

- Python
- Pandas
- Faker
- Apache Spark (Databricks)
- SQL
- SQLite

---

## Project Structure

```
Assignment - 8
│
├── 📁 Notebooks
│   ├── Part_1_Data_Generation.ipynb
│   ├── Part_2_Data_Cleaning.ipynb
│   ├── Part_3_SQL_Analysis.ipynb
│   ├── Part_4_Python_SQL_Integration.ipynb
│   └── Part_5_Edge_Case_Handling.ipynb
│
├── 📁 Datasets_Generated
│   ├── customers.csv
│   ├── products.csv
│   ├── orders.csv
│   └── order_items.csv
│
├── 📁 Cleaned Datasets
│   ├── customers_clean.csv
│   ├── products_clean.csv
│   ├── orders_clean.csv
│   └── order_items_clean.csv
│
└── 📄 README.md
```

---

# Part 1 – Data Generation

Generated realistic e-commerce datasets using Python and Faker.

### Datasets

- Customers (500 records)
- Products (500 records)
- Orders (700 records)
- Order Items (2500 records)

### Intentional Data Issues

- Missing customer IDs
- Invalid email addresses
- Inconsistent product names
- Different date formats
- Negative quantities
- Missing values

---

# Part 2 – Data Cleaning and Validation

Performed data cleaning using Pandas.

### Tasks

- Fixed date formats
- Replaced missing customer IDs
- Normalized product names
- Validated email addresses
- Checked referential integrity
- Generated cleaned CSV files

---

# Part 3 – SQL Analysis

Performed analytical SQL queries including:

- Revenue by category
- Top customers
- Monthly order trends
- Customers with no delivered orders
- Products with highest returns
- Return rate by category
- Running total revenue
- Product ranking
- LAG and LEAD analysis
- Customer segmentation
- NTILE quartile analysis
- Year-over-Year comparison
- First vs Last purchased category
- Cumulative revenue distribution
- Cohort analysis
- Frequently bought together products

---

# Part 4 – Python and SQL Integration

Developed a reporting tool using Python and SQLite.

### Features

- Report type selection
- Date range input
- Total orders
- Revenue summary
- Unique customers
- Top 3 products
- Previous period comparison

---

# Part 5 – Edge Case Handling

Implemented test cases for:

- Invalid Order IDs
- Discount greater than 100%
- Zero Quantity
- Future Order Date

---

## Skills Demonstrated

- Python Programming
- Pandas Data Cleaning
- SQL Queries
- Window Functions
- Common Table Expressions (CTEs)
- Data Validation
- SQLite Integration
- Business Analytics
- E-Commerce Data Analysis

---

