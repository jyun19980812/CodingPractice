### Problem Description

**Difficulty: Medium, Topic: International Call Percentage Calculation**

This problem requires calculating the percentage of phone calls that are considered **international**. A phone call is classified as international when the caller is in a different country than the receiver.

### Requirements:
1. Use the **phone_calls** and **phone_info** tables to identify whether the caller and receiver are from different countries.
2. Calculate the percentage of international phone calls out of the total number of calls.
3. Round the result to 1 decimal place.

### Assumption:
- The **caller_id** in the **phone_info** table refers to both the caller and the receiver.

### Table Schemas:

- **phone_calls** table:

| Column Name | Type      |
|-------------|-----------|
| caller_id   | integer   |
| receiver_id | integer   |
| call_time   | timestamp |

- **phone_info** table:

| Column Name  | Type      |
|--------------|-----------|
| caller_id    | integer   |
| country_id   | string    |
| network      | string    |
| phone_number | string    |

### Input Example:

**phone_calls** table:

| caller_id | receiver_id | call_time           |
|:---------:|:------------:|:-------------------:|
| 1         | 2            | 2022-07-04 10:13:49 |
| 1         | 5            | 2022-08-21 23:54:56 |
| 5         | 1            | 2022-05-13 17:24:06 |
| 5         | 6            | 2022-03-18 12:11:49 |

**phone_info** table:

| caller_id | country_id | network  | phone_number        |
|:---------:|:----------:|:--------:|:-------------------:|
| 1         | US         | Verizon  | +1-212-897-1964     |
| 2         | US         | Verizon  | +1-703-346-9529     |
| 3         | US         | Verizon  | +1-650-828-4774     |
| 4         | US         | Verizon  | +1-415-224-6663     |
| 5         | IN         | Vodafone | +91 7503-907302     |
| 6         | IN         | Vodafone | +91 2287-664895     |

### Output Column:
- **international_calls_pct**: The percentage of phone calls that are international, rounded to 1 decimal place.

### Output Example:

| international_calls_pct |
|:-----------------------:|
| 50.0                    |

### Explanation:
- There are a total of 4 phone calls in the input.
- Out of these, 2 are international:
  - Caller ID 1 (US) calls Receiver ID 5 (IN)
  - Caller ID 5 (IN) calls Receiver ID 1 (US)
- Thus, the percentage of international calls is calculated as **(2/4) * 100 = 50.0%**.

