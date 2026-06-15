# Week 4 Assignment – Azure Cloud Fundamentals and Data Pipeline Implementation using Azure Data Factory

## Objective

The objective of this assignment is to gain hands-on experience with Azure Cloud services and implement a simple data integration pipeline using Azure Blob Storage and Azure Data Factory (ADF).

## Technologies Used

* Microsoft Azure
* Azure Blob Storage
* Azure Data Factory (ADF)
* CSV File
* Azure IAM (Identity and Access Management)

## Tasks Performed

### Task 1: Resource Group Creation

* Created a Resource Group (`RG-ADF-Assignment`) in Azure Portal.
* Organized all Azure resources within the same resource group.

### Task 2: Storage Configuration

* Created an Azure Storage Account.
* Created Blob Storage containers (`input-data` and `output-data`).
* Uploaded the `Sample - Superstore.csv` file to the source container.

### Task 3: Azure Data Factory Basics

* Created Azure Data Factory (`ADF-Raghav-2026`).
* Explored the Author, Monitor, and Manage sections.
* Created a Linked Service (`LS_BlobStorage`) to connect ADF with Blob Storage.
* Created Source and Destination Datasets.
* Configured the Get Metadata activity to retrieve file information.

### Task 4: Pipeline Development

* Created a pipeline using the Copy Data activity.
* Configured the Source Dataset and Destination Dataset.
* Connected Get Metadata and Copy Data activities to create the data flow.

### Task 5: Pipeline Execution

* Executed the pipeline using the Debug option.
* Verified successful pipeline execution.
* Confirmed that the source file was copied to the destination container.

### Task 6: IAM and Access Management

* Explored Azure IAM (Identity and Access Management).
* Assigned appropriate access permissions.
* Granted Azure Data Factory access to Azure Blob Storage using the **Storage Blob Data Contributor** role.

## Pipeline Flow

```text
Source CSV File
       │
       ▼
Get Metadata Activity
       │
       ▼
Copy Data Activity
       │
       ▼
Destination File (output.csv)
```

## Outcome

* Successfully created and configured Azure resources.
* Established connectivity between Azure Data Factory and Blob Storage.
* Retrieved file metadata using the Get Metadata activity.
* Built and executed a data pipeline for file transfer.
* Successfully copied data from the source container to the destination container.
* Configured IAM permissions for secure access management.
* Gained practical experience with Azure Data Factory and Azure Blob Storage.
