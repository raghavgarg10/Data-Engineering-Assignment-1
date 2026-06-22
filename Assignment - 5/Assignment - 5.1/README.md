# Employee Data Processing using PySpark

## 📌 Overview

This assignment demonstrates how Apache Spark (PySpark) can be used for data cleaning, transformation, and analysis using DataFrames. A sample employee dataset containing missing values and duplicate records was processed to improve data quality and generate meaningful insights.

The assignment highlights essential Spark operations that are commonly used in data preprocessing and big data analytics.

---

## 🎯 Assignment Objectives

* Understand Spark DataFrame concepts
* Load and inspect employee data
* Identify and handle missing values
* Remove duplicate records
* Apply filtering conditions on data
* Perform aggregation and statistical analysis
* Group records using `groupBy()`
* Create derived columns
* Modify schema and column names
* Sort and organize processed data
* Export the final cleaned dataset

---

## 🛠️ Tools and Technologies

* Python
* Apache Spark (PySpark)
* Google Colab
* Jupyter Notebook

---

## 📂 Dataset Description

The employee dataset contains the following attributes:

* ID
* Name
* Age
* Department
* Monthly_Salary
* Bonus

The dataset was intentionally designed with missing values and duplicate entries to demonstrate data cleaning techniques.

---

## ⚙️ Tasks Performed

### 1. Data Inspection

* Created a Spark DataFrame
* Displayed records using `show()`
* Examined schema using `printSchema()`

### 2. Data Cleaning

* Detected missing values
* Replaced null values with suitable defaults
* Removed duplicate records

### 3. Data Transformation

* Added a new derived column (`Bonus`)
* Renamed columns for better readability
* Performed datatype casting

### 4. Data Filtering

* Filtered employees based on age conditions
* Retrieved department-specific records

### 5. Data Aggregation

* Calculated employee count
* Computed total salary
* Calculated average salary
* Found minimum salary
* Found maximum salary

### 6. Grouped Analysis

* Performed department-wise analysis using `groupBy()`
* Applied conditions on aggregated results

### 7. Data Export

* Saved the final processed dataset in CSV format

---

## 📊 Key Learning Outcomes

* Understanding Spark DataFrame operations
* Handling incomplete and inconsistent data
* Performing data transformation and aggregation
* Applying filtering and grouping techniques
* Building a simple data processing pipeline using PySpark

---

## ✅ Conclusion

This assignment provided practical experience with Apache Spark DataFrames and demonstrated how data cleaning, transformation, filtering, and aggregation can be performed efficiently on structured datasets. The implemented workflow represents a basic data engineering pipeline used for preparing data for analysis and reporting.
