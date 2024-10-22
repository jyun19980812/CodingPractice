### Problem Description

**Difficulty: Medium, Topic: Credit Card Launch Success**

Your team at **JPMorgan Chase** is launching a new credit card, and you're tasked with estimating how many cards will be issued in the first month. To gain perspective, you want to analyze how previous credit card launches have performed during their launch month.

### Requirements:
1. The goal is to identify the **earliest month** in which each credit card was issued and determine how many cards were issued during that **launch month**.
2. The results should display the **card_name** and the **issued_amount** for the launch month.
3. Order the results by **issued_amount** in descending order (from highest to lowest).

### Table Schema:

- **monthly_cards_issued** table:

| Column Name    | Type    | Description                            |
|----------------|---------|----------------------------------------|
| issue_month    | integer | The month when the cards were issued    |
| issue_year     | integer | The year when the cards were issued     |
| card_name      | string  | The name of the credit card             |
| issued_amount  | integer | The number of cards issued in that month|

### Input Example:

**monthly_cards_issued** table:

| issue_month | issue_year | card_name             | issued_amount |
|:-----------:|:----------:|:---------------------:|:-------------:|
| 1           | 2021       | Chase Sapphire Reserve| 170000        |
| 2           | 2021       | Chase Sapphire Reserve| 175000        |
| 3           | 2021       | Chase Sapphire Reserve| 180000        |
| 3           | 2021       | Chase Freedom Flex    | 65000         |
| 4           | 2021       | Chase Freedom Flex    | 70000         |

### Output Columns:
- **card_name**: The name of the credit card.
- **issued_amount**: The number of cards issued during the launch month.

### Output Example:

| card_name             | issued_amount |
|:---------------------:|:-------------:|
| Chase Sapphire Reserve| 170000        |
| Chase Freedom Flex    | 65000         |

### Explanation:
- The **Chase Sapphire Reserve** card was launched in **January 2021** with **170,000** cards issued in that month.
- The **Chase Freedom Flex** card was launched in **March 2021** with **65,000** cards issued in its launch month.
- These results are sorted by the **issued_amount** in descending order, showing which credit card had the most successful launch.

### Approach:
1. Use a window function to identify the **earliest issue_month** for each **card_name**.
2. Filter the results to get the issued amount for each card's **launch month**.
3. Return the **card_name** and the **issued_amount**, sorted in descending order by the number of cards issued.

This approach allows you to analyze the performance of past credit card launches, providing insights that can help predict the success of future launches.

