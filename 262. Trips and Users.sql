-- Write your MySQL query statement below
SELECT T1.Request_at as Day  , ROUND(IFNULL(T2.soni/T1.soni,0),2) as 'Cancellation Rate' FROM 
(SELECT count(*) as soni, Request_at  
FROM Trips 
WHERE
(Client_Id in (SELECT Users_Id  FROM Users WHERE Banned='No' and Role='client') and 
Driver_Id  in (SELECT Users_Id  FROM Users WHERE Banned='No' and Role='driver'))  
GROUP BY Request_at) as T1
LEFT JOIN
(SELECT count(*) as soni, Request_at  
FROM Trips 
WHERE
(Client_Id in (SELECT Users_Id  FROM Users WHERE Banned='No' and Role='client') and 
Driver_Id  in (SELECT Users_Id  FROM Users WHERE Banned='No' and Role='driver')) and 
Status!='completed'
GROUP BY Request_at) as T2
On  T1.Request_at = T2.Request_at
WHERE T1.Request_at>="2013-10-01" and T1.Request_at<="2013-10-03"