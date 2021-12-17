--what is the power consumption of the submarine?
WITH dataframe AS (
    SELECT binary_num,
           BTRIM(REGEXP_SPLIT_TO_ARRAY(binary_num::VARCHAR, E'')::VARCHAR,'{}') AS csv_split
    FROM day3
),

sep_columns AS (
--split each value into a separate column
    SELECT SPLIT_PART(csv_split,',',1)::VARCHAR AS col1,
           SPLIT_PART(csv_split,',',2)::VARCHAR AS col2,
           SPLIT_PART(csv_split,',',3)::VARCHAR AS col3,
           SPLIT_PART(csv_split,',',4)::VARCHAR AS col4,
           SPLIT_PART(csv_split,',',5)::VARCHAR AS col5,
           SPLIT_PART(csv_split,',',6)::VARCHAR AS col6,
           SPLIT_PART(csv_split,',',7)::VARCHAR AS col7,
           SPLIT_PART(csv_split,',',8)::VARCHAR AS col8,
           SPLIT_PART(csv_split,',',9)::VARCHAR AS col9,
           SPLIT_PART(csv_split,',',10)::VARCHAR AS col10,
           SPLIT_PART(csv_split,',',11)::VARCHAR AS col11,
           SPLIT_PART(csv_split,',',12)::VARCHAR AS col12
    FROM dataframe
),

common_lookup AS (
    SELECT CASE
               WHEN count(case when col1 = '0' then col1 end) >
                    count(case when col1 = '1' then col1 end)
                     THEN '0'
               WHEN count(case when col1 = '0' then col1 end) <
                    count(case when col1 = '1' then col1 end)
                     THEN '1'
           END as col1_gam,
           CASE
               WHEN count(case when col2 = '0' then col2 end) >
                    count(case when col2 = '1' then col2 end)
                     THEN '0'
               WHEN count(case when col2 = '0' then col2 end) <
                    count(case when col2 = '1' then col2 end)
                     THEN '1'
           END as col2_gam,
           CASE
               WHEN count(case when col3 = '0' then col3 end) >
                    count(case when col3 = '1' then col3 end)
                     THEN '0'
               WHEN count(case when col3 = '0' then col3 end) <
                    count(case when col3 = '1' then col3 end)
                     THEN '1'
           END as col3_gam,
           CASE
               WHEN count(case when col4 = '0' then col4 end) >
                    count(case when col4 = '1' then col4 end)
                     THEN '0'
               WHEN count(case when col4 = '0' then col4 end) <
                    count(case when col4 = '1' then col4 end)
                     THEN '1'
           END as col4_gam,
           CASE
               WHEN count(case when col5 = '0' then col5 end) >
                    count(case when col5 = '1' then col5 end)
                     THEN '0'
               WHEN count(case when col5 = '0' then col5 end) <
                    count(case when col5 = '1' then col5 end)
                     THEN '1'
           END as col5_gam,
           CASE
               WHEN count(case when col6 = '0' then col6 end) >
                    count(case when col6 = '1' then col6 end)
                     THEN '0'
               WHEN count(case when col6 = '0' then col6 end) <
                    count(case when col6 = '1' then col6 end)
                     THEN '1'
           END as col6_gam,
           CASE
               WHEN count(case when col7 = '0' then col7 end) >
                    count(case when col7 = '1' then col7 end)
                     THEN '0'
               WHEN count(case when col7 = '0' then col7 end) <
                    count(case when col7 = '1' then col7 end)
                     THEN '1'
           END as col7_gam,
           CASE
               WHEN count(case when col8 = '0' then col8 end) >
                    count(case when col8 = '1' then col8 end)
                     THEN '0'
               WHEN count(case when col8 = '0' then col8 end) <
                    count(case when col8 = '1' then col8 end)
                     THEN '1'
           END as col8_gam,
           CASE
               WHEN count(case when col9 = '0' then col9 end) >
                    count(case when col9 = '1' then col9 end)
                     THEN '0'
               WHEN count(case when col9 = '0' then col9 end) <
                    count(case when col9 = '1' then col9 end)
                     THEN '1'
           END as col9_gam,
           CASE
               WHEN count(case when col10 = '0' then col10 end) >
                    count(case when col10 = '1' then col10 end)
                     THEN '0'
               WHEN count(case when col10 = '0' then col10 end) <
                    count(case when col10 = '1' then col10 end)
                     THEN '1'
           END as col10_gam,
           CASE
               WHEN count(case when col11 = '0' then col11 end) >
                    count(case when col11 = '1' then col11 end)
                     THEN '0'
               WHEN count(case when col11 = '0' then col11 end) <
                    count(case when col11 = '1' then col11 end)
                     THEN '1'
           END as col11_gam,
           CASE
               WHEN count(case when col12 = '0' then col12 end) >
                    count(case when col12 = '1' then col12 end)
                     THEN '0'
               WHEN count(case when col12 = '0' then col12 end) <
                    count(case when col12 = '1' then col12 end)
                     THEN '1'
           END as col12_gam,
           --break for opposite condition for epsilon calculation
           CASE
               WHEN count(case when col1 = '0' then col1 end) >
                    count(case when col1 = '1' then col1 end)
                     THEN '1'
               WHEN count(case when col1 = '0' then col1 end) <
                    count(case when col1 = '1' then col1 end)
                     THEN '0'
           END as col1_eps,
           CASE
               WHEN count(case when col2 = '0' then col2 end) >
                    count(case when col2 = '1' then col2 end)
                     THEN '1'
               WHEN count(case when col2 = '0' then col2 end) <
                    count(case when col2 = '1' then col2 end)
                     THEN '0'
           END as col2_eps,
           CASE
               WHEN count(case when col3 = '0' then col3 end) >
                    count(case when col3 = '1' then col3 end)
                     THEN '1'
               WHEN count(case when col3 = '0' then col3 end) <
                    count(case when col3 = '1' then col3 end)
                     THEN '0'
           END as col3_eps,
           CASE
               WHEN count(case when col4 = '0' then col4 end) >
                    count(case when col4 = '1' then col4 end)
                     THEN '1'
               WHEN count(case when col4 = '0' then col4 end) <
                    count(case when col4 = '1' then col4 end)
                     THEN '0'
           END as col4_eps,
           CASE
               WHEN count(case when col5 = '0' then col5 end) >
                    count(case when col5 = '1' then col5 end)
                     THEN '1'
               WHEN count(case when col5 = '0' then col5 end) <
                    count(case when col5 = '1' then col5 end)
                     THEN '0'
           END as col5_eps,
           CASE
               WHEN count(case when col6 = '0' then col6 end) >
                    count(case when col6 = '1' then col6 end)
                     THEN '1'
               WHEN count(case when col6 = '0' then col6 end) <
                    count(case when col6 = '1' then col6 end)
                     THEN '0'
           END as col6_eps,
           CASE
               WHEN count(case when col7 = '0' then col7 end) >
                    count(case when col7 = '1' then col7 end)
                     THEN '1'
               WHEN count(case when col7 = '0' then col7 end) <
                    count(case when col7 = '1' then col7 end)
                     THEN '0'
           END as col7_eps,
           CASE
               WHEN count(case when col8 = '0' then col8 end) >
                    count(case when col8 = '1' then col8 end)
                     THEN '1'
               WHEN count(case when col8 = '0' then col8 end) <
                    count(case when col8 = '1' then col8 end)
                     THEN '0'
           END as col8_eps,
           CASE
               WHEN count(case when col9 = '0' then col9 end) >
                    count(case when col9 = '1' then col9 end)
                     THEN '1'
               WHEN count(case when col9 = '0' then col9 end) <
                    count(case when col9 = '1' then col9 end)
                     THEN '0'
           END as col9_eps,
           CASE
               WHEN count(case when col10 = '0' then col10 end) >
                    count(case when col10 = '1' then col10 end)
                     THEN '1'
               WHEN count(case when col10 = '0' then col10 end) <
                    count(case when col10 = '1' then col10 end)
                     THEN '0'
           END as col10_eps,
           CASE
               WHEN count(case when col11 = '0' then col11 end) >
                    count(case when col11 = '1' then col11 end)
                     THEN '1'
               WHEN count(case when col11 = '0' then col11 end) <
                    count(case when col11 = '1' then col11 end)
                     THEN '0'
           END as col11_eps,
           CASE
               WHEN count(case when col12 = '0' then col12 end) >
                    count(case when col12 = '1' then col12 end)
                     THEN '1'
               WHEN count(case when col12 = '0' then col12 end) <
                    count(case when col12 = '1' then col12 end)
                     THEN '0'
           END as col12_eps
    FROM sep_columns
)

SELECT gamma * epsilon AS power_consumption
FROM (
SELECT ((col1_gam ||  col2_gam ||  col3_gam ||  col4_gam ||  col5_gam ||  col6_gam ||  col7_gam ||  col8_gam ||  col9_gam ||  col10_gam ||  col11_gam ||  col12_gam)::BIT(12))::INTEGER AS gamma,
       ((col1_eps ||  col2_eps ||  col3_eps ||  col4_eps ||  col5_eps ||  col6_eps ||  col7_eps ||  col8_eps ||  col9_eps ||  col10_eps ||  col11_eps ||  col12_eps)::BIT(12))::INTEGER AS epsilon
FROM common_lookup) AS gamma_epsilon;

--what is the life support rating of the submarine?
--TBD







