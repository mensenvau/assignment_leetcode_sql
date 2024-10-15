-- Write your MySQL query statement below
SELECT IF(cid is null,id,cid) as id, student 
FROM
    ( SELECT 
             IF(id%2=1,
                LEAD(id) OVER(order by id), 
                LAG(id) OVER(order by id)
              ) as cid ,
               id , 
              student
     FROM Seat 
) as t 
order by id 