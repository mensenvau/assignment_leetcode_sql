-- Write your MySQL query statement below
SELECT
Department.Name as Department , Employee.Name as Employee , Salary 
FROM 
Employee , Department 
WHERE 
Employee.DepartmentId= Department.Id and 
Employee.Salary IN 
(
    SELECT Salary FROM(
    SELECT distinct Salary FROM Employee 
    WHERE DepartmentId= Department.Id 
    ORDER BY Salary desc 
    LIMIT 3) as t
)