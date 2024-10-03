### Problem Description

**Difficulty: Medium, Topic: Odd and Even Measurements Calculation**

This problem involves calculating the sum of odd-numbered and even-numbered measurements from a Google sensor, taken over multiple days. Measurements are taken multiple times within each day, and the goal is to compute the sums of odd-numbered and even-numbered measurements for each day separately.

### Definitions:
- **Odd-numbered measurements**: Measurements taken at the 1st, 3rd, 5th, etc., times within a day.
- **Even-numbered measurements**: Measurements taken at the 2nd, 4th, 6th, etc., times within a day.

### Requirements:
1. Calculate the sum of odd-numbered and even-numbered measurements for each day.
2. The result should be displayed in two separate columns: one for the sum of odd-numbered measurements and one for the sum of even-numbered measurements.
3. The output should display the **measurement_day**, **odd_sum**, and **even_sum**.

### Table Schema:

- **measurements** table:

| Column Name        | Type      |
|--------------------|-----------|
| measurement_id     | integer   |
| measurement_value  | decimal   |
| measurement_time   | datetime  |

### Input Example:

**measurements** table:

| measurement_id | measurement_value | measurement_time    |
|:--------------:|:-----------------:|:-------------------:|
| 131233         | 1109.51           | 07/10/2022 09:00:00 |
| 135211         | 1662.74           | 07/10/2022 11:00:00 |
| 523542         | 1246.24           | 07/10/2022 13:15:00 |
| 143562         | 1124.50           | 07/11/2022 15:00:00 |
| 346462         | 1234.14           | 07/11/2022 16:45:00 |

### Output Columns:
- **measurement_day**: The day when the measurements were taken (rounded to midnight time).
- **odd_sum**: The sum of odd-numbered measurements for that day.
- **even_sum**: The sum of even-numbered measurements for that day.

### Output Example:

| measurement_day      | odd_sum  | even_sum |
|:--------------------:|:--------:|:--------:|
| 07/10/2022 00:00:00  | 2355.75  | 1662.74  |
| 07/11/2022 00:00:00  | 1124.50  | 1234.14  |

### Explanation:
- On **07/10/2022**, the sum of odd-numbered measurements (1st, 3rd) is **2355.75**, while the sum of even-numbered measurements (2nd) is **1662.74**.
- On **07/11/2022**, there are two measurements, with the odd-numbered measurement sum being **1124.50** and the even-numbered measurement sum being **1234.14**.

