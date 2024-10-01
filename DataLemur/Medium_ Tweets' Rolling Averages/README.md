### Problem Description

**Difficulty: Medium, Topic: 3-Day Rolling Averages Calculation**

The goal is to calculate the **3-day rolling average** of tweets for each user from the given tweet data.

- A **rolling average** (also known as a moving average or running mean) is a time-series technique used to analyze trends over a specified period.
- In this case, we want to calculate how the tweet count for each user changes over a 3-day period.

### Requirements:
1. Use the **tweets** table to calculate the 3-day rolling average for each user.
2. Output the **rolling_avg_3d** rounded to 2 decimal places.
3. The output should display the **user_id**, **tweet_date**, and the calculated rolling average.

### Table Schema:

- **tweets** table:

| Column Name  | Type      |
|--------------|-----------|
| user_id      | integer   |
| tweet_date   | timestamp |
| tweet_count  | integer   |

### Input Example (tweets table):

| user_id | tweet_date          | tweet_count |
|:-------:|:-------------------:|:-----------:|
| 111     | 06/01/2022 00:00:00 | 2           |
| 111     | 06/02/2022 00:00:00 | 1           |
| 111     | 06/03/2022 00:00:00 | 3           |
| 111     | 06/04/2022 00:00:00 | 4           |
| 111     | 06/05/2022 00:00:00 | 5           |

### Output Columns:
- **user_id**: User ID
- **tweet_date**: Date of the tweet
- **rolling_avg_3d**: 3-day rolling average of tweet counts (rounded to 2 decimal places)

### Output Example:

| user_id | tweet_date          | rolling_avg_3d |
|:-------:|:-------------------:|:--------------:|
| 111     | 06/01/2022 00:00:00 | 2.00           |
| 111     | 06/02/2022 00:00:00 | 1.50           |
| 111     | 06/03/2022 00:00:00 | 2.00           |
| 111     | 06/04/2022 00:00:00 | 2.67           |
| 111     | 06/05/2022 00:00:00 | 4.00           |

### Explanation:
- On June 1, 2022, the user posted 2 tweets, so the rolling average is **2.00**.
- On June 2, 2022, the average tweet count for the past two days is **1.50**.
- By June 4, 2022, the user posted 8 tweets in total over 3 days, resulting in an average of **2.67** tweets.

