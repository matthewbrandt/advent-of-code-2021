--what do you get if you multiply your final horizontal position by your final depth?
SELECT SUM(CASE
        WHEN command LIKE 'forward%' THEN SPLIT_PART(command,' ',2)::INT
       END) *
           (SUM(CASE
            WHEN command LIKE 'up%' THEN -SPLIT_PART(command,' ',2)::INT
           END) +
           SUM(CASE
            WHEN command LIKE 'down%' THEN SPLIT_PART(command,' ',2)::INT
           END)) AS total
FROM day2;

--what do you get if you multiply your final horizontal position by your final depth?
WITH dataframe AS (
    SELECT *,
           CASE
            WHEN command LIKE 'forward%' THEN SPLIT_PART(command,' ',2)::INT
           END AS forward,
           CASE
            WHEN command LIKE 'up%' THEN -SPLIT_PART(command,' ',2)::INT
           END AS up,
           CASE
            WHEN command LIKE 'down%' THEN SPLIT_PART(command,' ',2)::INT
           END AS down,
           CASE
            WHEN command LIKE 'down%' THEN 0 + SPLIT_PART(command,' ',2)::INT
            WHEN command LIKE 'up%' THEN 0 - SPLIT_PART(command,' ',2)::INT
           END AS aim_effect
    FROM day2
),

aim_calc AS (
    SELECT *,
           SUM(aim_effect) OVER (ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS current_aim
    FROM dataframe
),

depth_calc AS (
    SELECT *,
           CASE
            WHEN command LIKE 'forward%' THEN current_aim * SPLIT_PART(command,' ',2)::INT
           END AS depth,
           ROW_NUMBER() OVER() AS row_num
    FROM aim_calc
)

SELECT SUM(forward) * SUM(depth) AS answer
FROM depth_calc;