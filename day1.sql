--how many measurements are larger than the previous measurement?
SELECT day_lag,
       COUNT(*) AS type_count
FROM (
     SELECT measurement,
            CASE
                WHEN LAG(measurement) OVER () IS NULL THEN 'n/a'
                WHEN LAG(measurement) OVER () < measurement THEN 'increased'
             ELSE 'decreased'
            END AS day_lag
     FROM day1
     ) AS lag_calc
GROUP BY 1
ORDER BY 2 DESC;

--how many sums are larger than the previous sum?
WITH dataframe AS (
    SELECT measurement,
           measurement +
            LAG(measurement,1) OVER() +
            LAG(measurement,2) OVER() AS sum_3_days
    FROM day1
),

three_day_lag_calc AS (
    SELECT *,
           CASE
            WHEN LAG(sum_3_days) OVER() IS NULL THEN 'n/a'
            WHEN LAG(sum_3_days) OVER() < sum_3_days THEN 'increased'
            ELSE 'decreased'
           END AS three_day_lag
    FROM dataframe
)

SELECT three_day_lag,
       COUNT(*) AS three_day_lag_count
FROM three_day_lag_calc
GROUP BY 1
ORDER BY 2 DESC;
