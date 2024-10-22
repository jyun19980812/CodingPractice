### Problem Description

**Difficulty: Medium, Topic: Active User Retention**

This problem involves calculating the **Monthly Active Users (MAUs)** for **July 2022**. An **active user** is defined as a user who has performed actions such as "sign-in", "like", or "comment" in both the current month and the previous month. The goal is to determine how many users were active in July 2022.

### Requirements:
1. Identify users who performed any action ("sign-in", "like", "comment") in both **June 2022** and **July 2022**.
2. Count the number of users who meet this condition and display the **month** and the number of **monthly_active_users**.
3. Output the month in numerical format (i.e., "6" for June, "7" for July, etc.).

### Table Schema:

- **user_actions** table:

| Column Name  | Type       | Description                          |
|--------------|------------|--------------------------------------|
| user_id      | integer    | The unique ID of the Facebook user   |
| event_id     | integer    | The unique ID of the event           |
| event_type   | string     | The type of action performed (sign-in, like, comment) |
| event_date   | datetime   | The date and time the event occurred |

### Input Example:

**user_actions** table:

| user_id | event_id | event_type | event_date           |
|:-------:|:--------:|:----------:|:--------------------:|
| 445     | 7765     | sign-in    | 05/31/2022 12:00:00  |
| 742     | 6458     | sign-in    | 06/03/2022 12:00:00  |
| 445     | 3634     | like       | 06/05/2022 12:00:00  |
| 742     | 1374     | comment    | 06/05/2022 12:00:00  |
| 648     | 3124     | like       | 06/18/2022 12:00:00  |

### Output Columns:
- **month**: The month in numerical format (for example, "7" for July 2022).
- **monthly_active_users**: The count of monthly active users.

### Output Example for June 2022:

| month | monthly_active_users |
|:-----:|:--------------------:|
| 6     | 1                    |

### Explanation:
- In this example, **user_id 445** performed actions in both May 2022 and June 2022, making them a **monthly active user** for June.
- Although **user_id 742** was active in June, they did not perform actions in May, so they are not considered a **monthly active user**.

For **July 2022**, the query should identify users who performed actions in both **June 2022** and **July 2022**.

### Approach:
1. First, filter the **user_actions** table for events that occurred in **June 2022** and **July 2022**.
2. Identify users who performed actions in both months by grouping by **user_id** and checking that they have activity in both months.
3. Count the number of users who meet the condition for being active in both the current and previous month.
4. Return the result as the number of **monthly_active_users** for July 2022.

This solution allows for analyzing retention by identifying how many users remained active across consecutive months.

