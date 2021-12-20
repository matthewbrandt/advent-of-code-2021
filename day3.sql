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
WITH oxy1 AS (
    SELECT CASE
            WHEN COUNT(CASE WHEN SUBSTRING(binary_num, 1, 1) = '0' THEN 0 END) >
                 COUNT(CASE WHEN SUBSTRING(binary_num, 1, 1) = '1' THEN 1 END)
                THEN '0'
            ELSE '1'
           END as pos1_check
    FROM day3
),

oxygen_list1 AS (
    SELECT binary_num
    FROM day3 AS d3
    INNER JOIN oxy1 AS oxy ON oxy.pos1_check = SUBSTRING(d3.binary_num,1,1)
),

oxy2 AS (
    SELECT CASE
            WHEN COUNT(CASE WHEN SUBSTRING(binary_num, 2, 1) = '0' THEN 0 END) >
                 COUNT(CASE WHEN SUBSTRING(binary_num, 2, 1) = '1' THEN 1 END)
                THEN '0'
            ELSE '1'
           END as pos2_check
    FROM oxygen_list1
),

oxygen_list2 AS (
    SELECT binary_num
    FROM oxygen_list1 AS list1
    INNER JOIN oxy2 AS oxy ON oxy.pos2_check = SUBSTRING(list1.binary_num,2,1)
),

oxy3 AS (
    SELECT CASE
            WHEN COUNT(CASE WHEN SUBSTRING(binary_num, 3, 1) = '0' THEN 0 END) >
                 COUNT(CASE WHEN SUBSTRING(binary_num, 3, 1) = '1' THEN 1 END)
                THEN '0'
            ELSE '1'
           END as pos3_check
    FROM oxygen_list2
),

oxygen_list3 AS (
    SELECT binary_num
    FROM oxygen_list2 AS list2
    INNER JOIN oxy3 AS oxy ON oxy.pos3_check = SUBSTRING(list2.binary_num,3,1)
),

oxy4 AS (
    SELECT CASE
            WHEN COUNT(CASE WHEN SUBSTRING(binary_num, 4, 1) = '0' THEN 0 END) >
                 COUNT(CASE WHEN SUBSTRING(binary_num, 4, 1) = '1' THEN 1 END)
                THEN '0'
            ELSE '1'
           END as pos4_check
    FROM oxygen_list3
),

oxygen_list4 AS (
    SELECT binary_num
    FROM oxygen_list3 AS list3
    INNER JOIN oxy4 AS oxy ON oxy.pos4_check = SUBSTRING(list3.binary_num,4,1)
),

oxy5 AS (
    SELECT CASE
            WHEN COUNT(CASE WHEN SUBSTRING(binary_num, 5, 1) = '0' THEN 0 END) >
                 COUNT(CASE WHEN SUBSTRING(binary_num, 5, 1) = '1' THEN 1 END)
                THEN '0'
            ELSE '1'
           END as pos5_check
    FROM oxygen_list4
),

oxygen_list5 AS (
    SELECT binary_num
    FROM oxygen_list4 AS list4
    INNER JOIN oxy5 AS oxy ON oxy.pos5_check = SUBSTRING(list4.binary_num,5,1)
),

oxy6 AS (
    SELECT CASE
            WHEN COUNT(CASE WHEN SUBSTRING(binary_num, 6, 1) = '0' THEN 0 END) >
                 COUNT(CASE WHEN SUBSTRING(binary_num, 6, 1) = '1' THEN 1 END)
                THEN '0'
            ELSE '1'
           END as pos6_check
    FROM oxygen_list5
),

oxygen_list6 AS (
    SELECT binary_num
    FROM oxygen_list5 AS list5
    INNER JOIN oxy6 AS oxy ON oxy.pos6_check = SUBSTRING(list5.binary_num,6,1)
),

oxy7 AS (
    SELECT CASE
            WHEN COUNT(CASE WHEN SUBSTRING(binary_num, 7, 1) = '0' THEN 0 END) >
                 COUNT(CASE WHEN SUBSTRING(binary_num, 7, 1) = '1' THEN 1 END)
                THEN '0'
            ELSE '1'
           END as pos7_check
    FROM oxygen_list6
),

oxygen_list7 AS (
    SELECT binary_num
    FROM oxygen_list6 AS list6
    INNER JOIN oxy7 AS oxy ON oxy.pos7_check = SUBSTRING(list6.binary_num,7,1)
),

oxy8 AS (
    SELECT CASE
            WHEN COUNT(CASE WHEN SUBSTRING(binary_num, 8, 1) = '0' THEN 0 END) >
                 COUNT(CASE WHEN SUBSTRING(binary_num, 8, 1) = '1' THEN 1 END)
                THEN '0'
            ELSE '1'
           END as pos8_check
    FROM oxygen_list7
),

oxygen_list8 AS (
    SELECT binary_num
    FROM oxygen_list7 AS list7
    INNER JOIN oxy8 AS oxy ON oxy.pos8_check = SUBSTRING(list7.binary_num,8,1)
),

oxy9 AS (
    SELECT CASE
            WHEN COUNT(CASE WHEN SUBSTRING(binary_num, 9, 1) = '0' THEN 0 END) >
                 COUNT(CASE WHEN SUBSTRING(binary_num, 9, 1) = '1' THEN 1 END)
                THEN '0'
            ELSE '1'
           END as pos9_check
    FROM oxygen_list8
),

oxygen_list9 AS (
    SELECT binary_num
    FROM oxygen_list8 AS list8
    INNER JOIN oxy9 AS oxy ON oxy.pos9_check = SUBSTRING(list8.binary_num,9,1)
),

oxy10 AS (
    SELECT CASE
            WHEN COUNT(CASE WHEN SUBSTRING(binary_num, 10, 1) = '0' THEN 0 END) >
                 COUNT(CASE WHEN SUBSTRING(binary_num, 10, 1) = '1' THEN 1 END)
                THEN '0'
            ELSE '1'
           END as pos10_check
    FROM oxygen_list9
),

oxygen_list10 AS (
    SELECT binary_num
    FROM oxygen_list9 AS list9
    INNER JOIN oxy10 AS oxy ON oxy.pos10_check = SUBSTRING(list9.binary_num,10,1)
),

oxy11 AS (
    SELECT CASE
            WHEN COUNT(CASE WHEN SUBSTRING(binary_num, 11, 1) = '0' THEN 0 END) >
                 COUNT(CASE WHEN SUBSTRING(binary_num, 11, 1) = '1' THEN 1 END)
                THEN '0'
            ELSE '1'
           END as pos11_check
    FROM oxygen_list10
),

oxygen_list11 AS (
    SELECT binary_num
    FROM oxygen_list10 AS list10
    INNER JOIN oxy11 AS oxy ON oxy.pos11_check = SUBSTRING(list10.binary_num,11,1)
),

oxy12 AS (
    SELECT CASE
            WHEN COUNT(CASE WHEN SUBSTRING(binary_num, 12, 1) = '0' THEN 0 END) >
                 COUNT(CASE WHEN SUBSTRING(binary_num, 12, 1) = '1' THEN 1 END)
                THEN '0'
            ELSE '1'
           END as pos12_check
    FROM oxygen_list11
),

oxygen_list12 AS (
    SELECT binary_num
    FROM oxygen_list11 AS list11
    INNER JOIN oxy12 AS oxy ON oxy.pos12_check = SUBSTRING(list11.binary_num,12,1)
),

--BREAK HERE FOR CO2 STUFF

scr1 AS (
    SELECT CASE
            WHEN COUNT(CASE WHEN SUBSTRING(binary_num, 1, 1) = '0' THEN 0 END) >
                 COUNT(CASE WHEN SUBSTRING(binary_num, 1, 1) = '1' THEN 1 END)
                THEN '1'
            ELSE '0'
           END as pos1_check
    FROM day3
),

scr_list1 AS (
    SELECT binary_num
    FROM day3 AS d3
    INNER JOIN scr1 AS scr ON scr.pos1_check = SUBSTRING(d3.binary_num,1,1)
),

scr2 AS (
    SELECT CASE
            WHEN COUNT(CASE WHEN SUBSTRING(binary_num, 2, 1) = '0' THEN 0 END) >
                 COUNT(CASE WHEN SUBSTRING(binary_num, 2, 1) = '1' THEN 1 END)
                THEN '1'
            ELSE '0'
           END as pos2_check
    FROM scr_list1
),

scr_list2 AS (
    SELECT binary_num
    FROM scr_list1 AS list1
    INNER JOIN scr2 AS scr ON scr.pos2_check = SUBSTRING(list1.binary_num,2,1)
),

scr3 AS (
    SELECT CASE
            WHEN COUNT(CASE WHEN SUBSTRING(binary_num, 3, 1) = '0' THEN 0 END) >
                 COUNT(CASE WHEN SUBSTRING(binary_num, 3, 1) = '1' THEN 1 END)
                THEN '1'
            ELSE '0'
           END as pos3_check
    FROM scr_list2
),

scr_list3 AS (
    SELECT binary_num
    FROM scr_list2 AS list2
    INNER JOIN scr3 AS scr ON scr.pos3_check = SUBSTRING(list2.binary_num,3,1)
),

scr4 AS (
    SELECT CASE
            WHEN COUNT(CASE WHEN SUBSTRING(binary_num, 4, 1) = '0' THEN 0 END) >
                 COUNT(CASE WHEN SUBSTRING(binary_num, 4, 1) = '1' THEN 1 END)
                THEN '1'
            ELSE '0'
           END as pos4_check
    FROM scr_list3
),

scr_list4 AS (
    SELECT binary_num
    FROM scr_list3 AS list3
    INNER JOIN scr4 AS scr ON scr.pos4_check = SUBSTRING(list3.binary_num,4,1)
),

scr5 AS (
    SELECT CASE
            WHEN COUNT(CASE WHEN SUBSTRING(binary_num, 5, 1) = '0' THEN 0 END) >
                 COUNT(CASE WHEN SUBSTRING(binary_num, 5, 1) = '1' THEN 1 END)
                THEN '1'
            ELSE '0'
           END as pos5_check
    FROM scr_list4
),

scr_list5 AS (
    SELECT binary_num
    FROM scr_list4 AS list4
    INNER JOIN scr5 AS scr ON scr.pos5_check = SUBSTRING(list4.binary_num,5,1)
),

scr6 AS (
    SELECT CASE
            WHEN COUNT(CASE WHEN SUBSTRING(binary_num, 6, 1) = '0' THEN 0 END) >
                 COUNT(CASE WHEN SUBSTRING(binary_num, 6, 1) = '1' THEN 1 END)
                THEN '1'
            ELSE '0'
           END as pos6_check
    FROM scr_list5
),

scr_list6 AS (
    SELECT binary_num
    FROM scr_list5 AS list5
    INNER JOIN scr6 AS scr ON scr.pos6_check = SUBSTRING(list5.binary_num,6,1)
),

scr7 AS (
    SELECT CASE
            WHEN COUNT(CASE WHEN SUBSTRING(binary_num, 7, 1) = '0' THEN 0 END) >
                 COUNT(CASE WHEN SUBSTRING(binary_num, 7, 1) = '1' THEN 1 END)
                THEN '1'
            ELSE '0'
           END as pos7_check
    FROM scr_list6
),

scr_list7 AS (
    SELECT binary_num
    FROM scr_list6 AS list6
    INNER JOIN scr7 AS scr ON scr.pos7_check = SUBSTRING(list6.binary_num,7,1)
),

scr8 AS (
    SELECT CASE
            WHEN COUNT(CASE WHEN SUBSTRING(binary_num, 8, 1) = '0' THEN 0 END) >
                 COUNT(CASE WHEN SUBSTRING(binary_num, 8, 1) = '1' THEN 1 END)
                THEN '1'
            ELSE '0'
           END as pos8_check
    FROM scr_list7
),

scr_list8 AS (
    SELECT binary_num
    FROM scr_list7 AS list7
    INNER JOIN scr8 AS scr ON scr.pos8_check = SUBSTRING(list7.binary_num,8,1)
),

scr9 AS (
    SELECT CASE
            WHEN COUNT(CASE WHEN SUBSTRING(binary_num, 9, 1) = '0' THEN 0 END) >
                 COUNT(CASE WHEN SUBSTRING(binary_num, 9, 1) = '1' THEN 1 END)
                THEN '1'
            ELSE '0'
           END as pos9_check
    FROM scr_list8
),

scr_list9 AS (
    SELECT binary_num
    FROM scr_list8 AS list8
    INNER JOIN scr9 AS scr ON scr.pos9_check = SUBSTRING(list8.binary_num,9,1)
),

life_support AS (
    SELECT decimal,
       LAG(decimal,1) OVER() AS lagged_decimal
    FROM (
        SELECT binary_num, binary_num::BIT(12)::INTEGER AS decimal FROM scr_list9
        UNION ALL
        SELECT binary_num, binary_num::BIT(12)::INTEGER AS decimal FROM oxygen_list12
    ) AS joined
)

SELECT decimal * lagged_decimal AS life_support_rating
FROM life_support
WHERE lagged_decimal IS NOT NULL;