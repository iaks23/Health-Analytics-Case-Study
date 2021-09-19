[![forthebadge](https://forthebadge.com/images/badges/built-with-grammas-recipe.svg)](https://forthebadge.com)              [![forthebadge](https://forthebadge.com/images/badges/powered-by-black-magic.svg)](https://forthebadge.com) 
 <img align="left" width="170" height="35" src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white">

# Health Analytics Mini Case Study 🩺
A mini case study performed in <code>PostGreSQL</code> as part of the [SeriousSQL](https://www.datawithdanny.com) course by Danny Ma. 

[![Stars !](https://img.shields.io/badge/Star-If%20Useful-1abc9c.svg)](https://GitHub.com/Naereen/ama) [![Open Source? Yes!](https://badgen.net/badge/Open%20Source%20%3F/Yes%21/blue?icon=github)](https://github.com/Naereen/badges/) [![made-by-e](https://img.shields.io/badge/View-Profile-1f425f.svg)](https://github.com/iaks23) 

## Table of Contents

* [🚨 Problem Statement](#problem)
* [📖 Business Questions](#questions)
* [🌟 Solutions](#solutions)



-------

# 🚨 Problem Statement <a name='problem'></a>

The General Manager of Analytics at Health Co has requested our assistance with their analysis of the health.user_logs dataset. The Health Co analytics team have shared with us their SQL script - they unfortunately ran into a few bugs that they couldn’t fix! 

Our task here is to debug their SQL script, and retrieve all the correct answers to the business questions the GM has requested for a board meeting about their active users.

<p align="center">
  <img width="350" height="350" src="https://github.com/iaks23/Health-Analytics-Case-Study/blob/main/img/Drake_350x350.jpg">
</p>

# 📖 Business Questions <a name='questions'></a>

### These were the questions that the GM needed us to fetch from our queries.

 Q1. How many *unique users* exist in the logs dataset?
 
 Q2. How many total measurements do we have *per user on average*?
 
 Q3. What about the *median* number of measurements per user?
 
 Q4. How many *users* have 3 or more *measurements*?
 
 Q5. How many *users* have *1,000 or more measurements*?

> Looking at the logs data - what is the number and *percentage of the active user* base who:

 Q6. Have logged *blood glucose measurements*?
 
 Q7. Have at least 2 types of measurements?
 
 Q8. Have all *3 measures* - blood glucose, weight and blood pressure?

> For users that have blood pressure measurements:

 Q9. What is the *median systolic/diastolic blood pressure* values?



# 🌟 Solutions <a name='solutions'></a>

### Q1: How many *unique users* exist in the logs dataset?

```sql

SELECT COUNT(DISTINCT id) AS unique_users FROM health.user_logs;

```
|unique_users|
|---|
|554|

### Q2: How many total measurements do we have *per user on average*?

```sql

SELECT ROUND(AVG(measure_count),2) AS Avg_Measurements
FROM user_measure_count;

```
|Avg_Measurements|
|---|
|79.23|


### Q3: What about the *median* number of measurements per user?

```sql

SELECT
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY measure_count) AS median_value
FROM user_measure_count;

```
|Median_Value|
|---|
|2|


### Q4: How many *users* have 3 or more *measurements*?

```sql

SELECT COUNT(id) AS no_of_users
FROM user_measure_count 
WHERE measure_count >= 3;

```
|no_of_users|
|---|
|209|

### Q5: How many *users* have 1000 or more *measurements*?

```sql

SELECT COUNT(id) AS no_of_users
FROM user_measure_count 
WHERE measure_count >= 1000;

```
|no_of_users|
|---|
|5|

### Q6: Have logged *blood glucose measurements*?

```sql

SELECT COUNT (DISTINCT id) as no_of_users
FROM health.user_logs
WHERE measure='blood_glucose';

```
|no_of_users|
|---|
|325|

### Q7: Have at least 2 types of measurements?

```sql

SELECT COUNT(id) as no_of_users
FROM user_measure_count
WHERE unique_measures >= 2;

```
|no_of_users|
|---|
|204|

### Q8: Have all *3 measures* - blood glucose, weight and blood pressure?

```sql

SELECT COUNT(id)
FROM user_measure_count as no_of_users
WHERE unique_measures = 3;

```
|no_of_users|
|---|
|50|

### Q8: What is the *median systolic/diastolic blood pressure* values?

```sql

SELECT
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY systolic) AS median_systolic,
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY diastolic) AS median_diastolic
FROM health.user_logs
WHERE measure='blood_pressure';

```
|median_systolic|median_diastolic|
|---|---|
|126|79|

----------------------

© Akshaya Parthasarathy, 2021

For feedback, or if you just feel like saying Hi!

[![LINKEDIN](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/akshaya-parthasarathy23)
[![INSTAGRAM](https://img.shields.io/badge/Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white)](https://www.instagram.com/aks_sarathy/)
[![REDDIT](https://img.shields.io/badge/Reddit-FF4500?style=for-the-badge&logo=reddit&logoColor=white)](https://www.reddit.com/user/longstoryshort_)


