-- /* Write your T-SQL query statement below */
declare @allc float = (
    SELECT
       count(distinct player_id) 
    FROM Activity
)

declare @resc float = (
   SELECT 
      COUNT(distinct player_id)  
   FROM 
    (SELECT player_id,
           event_date,
           MIN(event_date) OVER(PARTITION BY player_id) AS first_date
    FROM Activity
    ) AS T 
    WHERE DATEDIFF(day,first_date,event_date)=1
)

SELECT CAST(@resc/@allc AS numeric(10,2)) AS fraction

