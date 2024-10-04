### Problem Description

**Difficulty: Medium, Topic: Identifying Supercloud Customers**

A **Microsoft Azure Supercloud customer** is defined as a customer who has purchased at least one product from every product category listed in the **products** table. The goal is to write a query that identifies these Supercloud customers by their **customer_id**.

### Requirements:
1. Use the **customer_contracts** and **products** tables to identify customers who have purchased products from all the product categories.
2. Output the **customer_id** of those who qualify as Supercloud customers.

### Table Schemas:

- **customer_contracts** table:

| Column Name  | Type    |
|--------------|---------|
| customer_id  | integer |
| product_id   | integer |
| amount       | integer |

- **products** table:

| Column Name      | Type    |
|------------------|---------|
| product_id       | integer |
| product_category | string  |
| product_name     | string  |

### Input Example:

**customer_contracts** table:

| customer_id | product_id | amount |
|:-----------:|:----------:|:------:|
| 1           | 1          | 1000   |
| 1           | 3          | 2000   |
| 1           | 5          | 1500   |
| 2           | 2          | 3000   |
| 2           | 6          | 2000   |

**products** table:

| product_id | product_category | product_name              |
|:----------:|:----------------:|:-------------------------:|
| 1          | Analytics         | Azure Databricks          |
| 2          | Analytics         | Azure Stream Analytics    |
| 4          | Containers        | Azure Kubernetes Service  |
| 5          | Containers        | Azure Service Fabric      |
| 6          | Compute           | Virtual Machines          |
| 7          | Compute           | Azure Functions           |

### Output Column:
- **customer_id**: The ID of the customer who qualifies as a Supercloud customer.

### Output Example:

| customer_id |
|:-----------:|
| 1           |

### Explanation:
- **Customer 1** bought products from the **Analytics**, **Containers**, and **Compute** categories, qualifying them as a Supercloud customer.
- **Customer 2**, however, did not purchase any products from the **Containers** category, so they do not qualify as a Supercloud customer.

### Approach:
1. Join the **customer_contracts** table with the **products** table to associate each customer's purchase with the corresponding product category.
2. Group the results by **customer_id** and count the distinct product categories each customer has purchased from.
3. Compare this count to the total number of distinct categories in the **products** table.
4. Return the **customer_id** of those who have purchased from all product categories.

