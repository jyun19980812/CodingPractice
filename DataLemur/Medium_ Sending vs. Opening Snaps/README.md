### Problem Description

**Difficulty: Medium, Topic: Time Spent Sending vs. Opening Snaps**

This problem involves calculating the percentage of time spent **sending** vs. **opening** snaps for Snapchat users, grouped by their age groups. The goal is to provide a breakdown of the total time spent on these activities for each age group as a percentage.

### Notes:
1. Calculate the following percentages for each age group:
   - **Time spent sending** / (Time spent sending + Time spent opening)
   - **Time spent opening** / (Time spent sending + Time spent opening)
2. Round the percentages to 2 decimal places.
3. Multiply by **100.0** to avoid integer division when calculating percentages.

### Table Schemas:

- **activities** table:

| Column Name   | Type       |
|---------------|------------|
| activity_id   | integer    |
| user_id       | integer    |
| activity_type | string     | ('send', 'open', 'chat') |
| time_spent    | float      |
| activity_date | datetime   |

- **age_breakdown** table:

| Column Name | Type   |
|-------------|--------|
| user_id     | integer|
| age_bucket  | string | ('21-25', '26-30', '31-35') |

### Input Example:

**activities** table:

| activity_id | user_id | activity_type | time_spent | activity_date        |
|:-----------:|:-------:|:--------------:|:----------:|:--------------------:|
| 7274        | 123     | open           | 4.50       | 06/22/2022 12:00:00  |
| 2425        | 123     | send           | 3.50       | 06/22/2022 12:00:00  |
| 1413        | 456     | send           | 5.67       | 06/23/2022 12:00:00  |
| 1414        | 789     | chat           | 11.00      | 06/25/2022 12:00:00  |
| 2536        | 456     | open           | 3.00       | 06/25/2022 12:00:00  |

**age_breakdown** table:

| user_id | age_bucket |
|:-------:|:----------:|
| 123     | 31-35      |
| 456     | 26-30      |
| 789     | 21-25      |

### Output Columns:
- **age_bucket**: The age group of the users.
- **send_perc**: Percentage of time spent sending snaps, rounded to 2 decimal places.
- **open_perc**: Percentage of time spent opening snaps, rounded to 2 decimal places.

### Output Example:

| age_bucket | send_perc | open_perc |
|:----------:|:---------:|:---------:|
| 26-30      | 65.40     | 34.60     |
| 31-35      | 43.75     | 56.25     |

### Explanation:
- For the age bucket **26-30**, the time spent sending snaps is **5.67**, and the time spent opening snaps is **3.00**.
  - Total time spent = 5.67 + 3.00 = **8.67**
  - Percentage of time spent sending snaps = (5.67 / 8.67) * 100.0 = **65.40%**
  - Percentage of time spent opening snaps = (3.00 / 8.67) * 100.0 = **34.60%**
  
- For the age bucket **31-35**, the time spent sending snaps is **3.50**, and the time spent opening snaps is **4.50**.
  - Total time spent = 3.50 + 4.50 = **8.00**
  - Percentage of time spent sending snaps = (3.50 / 8.00) * 100.0 = **43.75%**
  - Percentage of time spent opening snaps = (4.50 / 8.00) * 100.0 = **56.25%**

