# Week 6 - Apache Spark Assignments

## Overview

This repository contains the solutions for **Week 6 Apache Spark Assignments** implemented using **PySpark**. The assignments focus on learning Apache Spark architecture, DataFrame operations, schema handling, transformations, actions, lazy evaluation, performance optimization, and efficient data processing using CSV and Parquet file formats.

The repository consists of two assignments:

- **Assignment 1 – Efficient Data Processing using PySpark**
- **Assignment 2 – Apache Spark Concepts and DataFrame Operations (Q1–Q15)**

These assignments provide both practical implementation and theoretical understanding of Apache Spark.

---

# Objectives

- Understand Apache Spark Architecture
- Learn the roles of Driver, Cluster Manager, and Executors
- Understand Lazy Evaluation and DAG (Directed Acyclic Graph)
- Read CSV files with schema inference
- Perform DataFrame transformations and actions
- Filter and select required records
- Rename DataFrame columns
- Convert data types using type casting
- Create calculated columns
- Handle NULL values efficiently
- Build Spark Data Processing Pipelines
- Compare CSV and Parquet file formats
- Understand Predicate Pushdown
- Learn Wide Transformations and Shuffle
- Save processed data as CSV and Parquet
- Follow Spark performance best practices

---

# Technologies Used

- Python 3
- Apache Spark (PySpark)
- Google Colab
- Jupyter Notebook
- CSV
- Parquet
- Git & GitHub

---

# Repository Structure

## Assignment 1 – Efficient Data Processing using PySpark

### Topics Covered

- Creating Spark Session
- Reading CSV Files
- Displaying Dataset
- Printing Schema
- Schema Handling
- Selecting Required Columns
- Filtering Records
- Renaming Columns
- Data Type Casting
- Adding New Columns
- Handling NULL Values
- Data Processing Pipeline
- Lazy Evaluation
- Wide Transformations (groupBy)
- Predicate Pushdown
- Saving Data as CSV
- Saving Data as Parquet
- Reading Parquet Files

---

## Assignment 2 – Apache Spark Practical Question

### Topics Covered

- Spark Architecture
- Driver Program
- Cluster Manager
- Executors
- Client Mode vs Cluster Mode
- Lazy Evaluation
- DAG (Lineage Graph)
- Transformations vs Actions
- Reading CSV Files
- Schema Handling
- Filtering and Selection
- Column Renaming
- Data Type Casting
- Adding New Columns
- Handling NULL Values
- Wide Transformations
- Predicate Pushdown
- CSV vs Parquet
- show() vs collect()
- Spark Best Practices

---

# Performance Insights

- Spark executes transformations lazily and runs them only when an action is triggered.
- DAG helps Spark optimize execution and provides fault tolerance.
- Predicate Pushdown reduces unnecessary data scanning while reading Parquet files.
- Parquet provides better compression and faster query execution than CSV.
- Wide transformations such as **groupBy()** require data shuffling across partitions.
- Using **show()** is safer than **collect()** when working with large datasets.
- Selecting only required columns improves execution performance.
- DataFrame APIs provide optimized and scalable data processing.

---

# Learning Outcomes

After completing these assignments, the following concepts were learned:

- Apache Spark Architecture
- Spark Execution Modes
- Spark DataFrames
- Schema Management
- Transformations and Actions
- Lazy Evaluation
- DAG Optimization
- Filtering and Selection
- Column Renaming
- Data Type Conversion
- New Column Creation
- NULL Value Handling
- Wide Transformations
- Predicate Pushdown
- CSV vs Parquet Comparison
- Spark Performance Optimization
- Data Processing Pipelines
- Best Practices for Large-Scale Data Processing

---

# Conclusion

These assignments provided hands-on experience with Apache Spark using PySpark for efficient data processing. The implementation covered Spark architecture, DataFrame operations, transformations, actions, schema handling, lazy evaluation, execution optimization, and file processing using CSV and Parquet formats. The knowledge gained through these assignments forms a strong foundation for Big Data processing and real-world Data Engineering applications.