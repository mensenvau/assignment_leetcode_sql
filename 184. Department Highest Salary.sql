-- Write your MySQL query statement below
SELECT D.name as Department, E.name as Employee , E.Salary as  Salary
FROM Employee E
INNER JOIN Department D
ON E.DepartmentId = D.id
 Where (E.DepartmentId , Salary) IN
    (   SELECT
            DepartmentId, MAX(Salary)
        FROM
            Employee
        GROUP BY DepartmentId
	)