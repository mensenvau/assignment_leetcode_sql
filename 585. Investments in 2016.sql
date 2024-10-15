/* Write your T-SQL query statement below */

SELECT CAST(sum(tiv_2016) AS numeric(10,2)) as tiv_2016
FROM 
(
SELECT  tiv_2016,
        COUNT(*) OVER(partition by tiv_2015) AS S1,
        COUNT(*) OVER(partition by lat,lon ) AS S2
FROM Insurance 
) AS T
WHERE S1>1 and S2=1