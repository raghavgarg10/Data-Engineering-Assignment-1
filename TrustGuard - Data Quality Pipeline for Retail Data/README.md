# TrustGuard: Data Quality Pipeline for Retail Data

## Project Overview

TrustGuard is an end-to-end Data Engineering project developed using **Apache Spark, PySpark, SQL, Delta Lake, and Databricks**. The project focuses on improving the quality of retail transaction data by implementing a complete Data Quality Pipeline.

The pipeline performs data ingestion, validation, cleaning, SQL-based analysis, and anomaly detection to transform raw retail transaction data into clean, reliable, and analytics-ready datasets.

---

## Objectives

- Build a complete ETL (Extract, Transform, Load) pipeline.
- Perform automated Data Quality Checks.
- Clean and standardize retail transaction data.
- Generate business insights using SQL.
- Detect anomalous transactions using threshold-based rules.
- Store processed data as Delta Tables.

---

## Tech Stack

- Python
- Apache Spark
- PySpark
- Databricks
- Delta Lake
- SQL
- CSV Dataset

---

## Dataset

The project uses a Retail Transactions Dataset containing:

- Transaction ID
- Customer ID
- Category
- Item
- Price Per Unit
- Quantity
- Total Spent
- Payment Method
- Location
- Transaction Date
- Discount Applied

---

## Project Workflow

### Module 1 – Data Ingestion
- Load raw CSV dataset into Databricks.
- Validate dataset schema.
- Store raw data in Delta Table.

### Module 2 – Data Quality Checks
- Check missing values.
- Detect duplicate records.
- Validate schema.
- Generate Data Quality Report.

### Module 3 – Data Cleaning
- Handle missing values.
- Remove duplicate records.
- Standardize text and dates.
- Perform type casting.
- Store cleaned dataset as Delta Table.

### Module 4 – SQL-Based Analysis
Generate business insights:

- Monthly Revenue Analysis
- Top 10 Customers
- Payment Method Distribution
- Product Category Performance

### Module 5 – Basic Anomaly Detection
Detect anomalies using threshold-based rules:

- Invalid Unit Price
- Abnormal Quantity
- Store anomalies in Anomaly Log

---

## Project Structure

```
TrustGuard-Data-Quality-Pipeline/
│
├── notebooks/
│   ├── 01_Data_Ingestion.ipynb
│   ├── 02_Data_Quality_Checks.ipynb
│   ├── 03_Data_Cleaning.ipynb
│   ├── 04_SQL_Based_Analysis.ipynb
│   └── 05_Basic_Anomaly_Detection.ipynb
│
├── data/
│   ├── retail_transactions.csv
│   └── clean_customerw.csv
│   └── clean_ transactions.csv
│
└── README.md
```

---

## Business Insights

The project generates valuable business insights including:

- Monthly Revenue Analysis
- Top Customers by Spending
- Payment Method Distribution
- Product Category Performance
- Data Quality Report
- Anomaly Detection Report

---

## Results

- Successfully implemented a complete Data Quality Pipeline.
- Improved data quality by handling missing values and duplicate records.
- Generated business-ready analytical reports.
- Detected unusual transactions using statistical threshold rules.
- Stored processed data using Delta Lake.

---

