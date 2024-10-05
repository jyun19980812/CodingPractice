### Problem Description

**Difficulty: Medium, Topic: Uncategorised Call Percentage Calculation**

UnitedHealth Group (UHG) operates the **Advocate4Me** program, where members can call advocates for support regarding health care needs. Calls are classified into various categories, but some calls may not be categorised, labeled as “n/a”, or left blank. The goal is to calculate the percentage of calls that cannot be categorised.

### Requirements:
1. Use the **callers** table to calculate the percentage of calls that are uncategorised.
2. Calls are considered uncategorised if the **call_category** field is "n/a" or empty.
3. Round the result to 1 decimal place.

### Table Schema:

- **callers** table:

| Column Name        | Type       |
|--------------------|------------|
| policy_holder_id   | integer    |
| case_id            | varchar    |
| call_category      | varchar    |
| call_date          | timestamp  |
| call_duration_secs | integer    |

### Input Example:

**callers** table:

| policy_holder_id | case_id                               | call_category        | call_date                | call_duration_secs |
|:----------------:|:-------------------------------------:|:--------------------:|:------------------------:|:------------------:|
| 1                | f1d012f9-9d02-4966-a968-bf6c5bc9a9fe  | emergency assistance | 2023-04-13T19:16:53Z      | 144                |
| 1                | 41ce8fb6-1ddd-4f50-ac31-07bfcce6aaab  | authorisation        | 2023-05-25T09:09:30Z      | 815                |
| 2                | 9b1af84b-eedb-4c21-9730-6f099cc2cc5e  | n/a                  | 2023-01-26T01:21:27Z      | 992                |
| 2                | 8471a3d4-6fc7-4bb2-9fc7-4583e3638a9e  | emergency assistance | 2023-03-09T10:58:54Z      | 128                |
| 2                | 38208fae-bad0-49bf-99aa-7842ba2e37bc  | benefits             | 2023-06-05T07:35:43Z      | 619                |

### Output Column:
- **uncategorised_call_pct**: The percentage of calls that are uncategorised, rounded to 1 decimal place.

### Output Example:

| uncategorised_call_pct |
|:----------------------:|
| 20.0                   |

### Explanation:
- Out of 5 total calls in the input, 1 call is uncategorised (with a category of "n/a").
- Therefore, the percentage of uncategorised calls is calculated as:
  \[
  \frac{1}{5} \times 100 = 20.0\%
  \]
- This result is rounded to 1 decimal place, giving **20.0%**.

### Approach:
1. Count the total number of calls in the **callers** table.
2. Count the number of calls where **call_category** is either "n/a" or empty.
3. Calculate the percentage of uncategorised calls by dividing the number of uncategorised calls by the total number of calls and multiplying by 100.
4. Round the result to 1 decimal place.

