SELECT COUNT(DISTINCT id) as unique_users FROM health.user_logs; 



SELECT ROUND(AVG(measure_count),2) AS Avg_Measurements
FROM user_measure_count;



SELECT
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY measure_count) AS median_value
FROM user_measure_count;



SELECT COUNT(id) AS no_of_users
FROM user_measure_count 
WHERE measure_count >= 3;



SELECT COUNT(id) AS no_of_users
FROM user_measure_count 
WHERE measure_count >= 1000;



SELECT COUNT (DISTINCT id) as no_of_users
FROM health.user_logs
WHERE measure='blood_glucose';



SELECT COUNT(id) as no_of_users
FROM user_measure_count
WHERE unique_measures >= 2;



SELECT COUNT(id)
FROM user_measure_count as no_of_users
WHERE unique_measures = 3;



SELECT
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY systolic) AS median_systolic,
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY diastolic) AS median_diastolic
FROM health.user_logs
WHERE measure='blood_pressure';


