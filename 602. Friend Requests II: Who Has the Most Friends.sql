-- rite your MySQL query statement below
 
SELECT requester_id as id,count(requester_id) as num 
FROM(
SELECT requester_id FROM request_accepted
UNION ALL
SELECT accepter_id FROM request_accepted
) as fr 
GROUP BY requester_id 
order by count(requester_id) desc
limit 1
 